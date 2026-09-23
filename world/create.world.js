import fs from 'node:fs/promises'
import path from 'path'

import buildWorldKey from './key.world.js'
import loadService from '../tests/support/load/load.service.js'

const SCENARIOS_DIR = 'tests/support/scenarios'
const TEST_DIRS = ['tests/internal', 'tests/external']

/**
 * Seed one independent copy of a scenario's data for every test that requires it, then write the
 * combined result to world.json for tests to read via the `world` fixture
 */
export default async function createWorld() {
  const tests = await listTests()
  const aggregatedScenarioData = {}

  // STEP 1: Load all scenario data into memory first
  for (const test of tests) {
    aggregatedScenarioData[test.key] = await _scenarioData(test.scenarioPath)
  }

  // STEP 2: Strip duplicates across all scenarios BEFORE seeding/loading
  _protectWorld(aggregatedScenarioData)

  // STEP 3: Seed the cleaned data via loadService
  for (const scenarioData of Object.values(aggregatedScenarioData)) {
    await loadService(scenarioData)
  }

  // STEP 4: Write the cleaned dataset to world.json
  await saveWorld(aggregatedScenarioData)
}

function _protectWorld(aggregatedScenarioData) {
  const uniqueBillRuns = new Set()
  const scenKey = {}

  for (const [scenarioKey, aggregatedScenario] of Object.entries(aggregatedScenarioData || {})) {
    if (Array.isArray(aggregatedScenario.billRuns)) {
      aggregatedScenario.billRuns = aggregatedScenario.billRuns.filter((billRun) => {
        if (billRun?.batchType === 'annual') {
          const year = String(billRun.fromFinancialYearEnding)
          const region = String(billRun.regionId.value)
          const key = `annual_${year}_${region}`

          if (uniqueBillRuns.has(key)) {
            console.log('Previous scenario', scenKey[key])
            console.log(`[DELETED DUPLICATE] Removed ${key} from ${scenarioKey}`)

            return false
          }

          uniqueBillRuns.add(key)
          scenKey[key] = scenarioKey
          return true // Retains first occurrence
        }

        return true // Keep non-annual items
      })

      // Clean up property if array is now empty
      if (aggregatedScenario.billRuns.length === 0) {
        delete aggregatedScenario.billRuns
        delete aggregatedScenario.bills
        delete aggregatedScenario.transactions
        delete aggregatedScenario.billLicences
      }
    }
  }

  console.log('Unique Bill Run Keys Registered:', [...uniqueBillRuns])
}

/**
 * Write the aggregated per-test scenario data to world.json
 *
 * @param {object} world - the aggregated scenario data, keyed by world key
 */
async function saveWorld(world) {
  await fs.writeFile('world/world.json', JSON.stringify(world, null, 2), 'utf-8')
}

/**
 * List every test file under a directory, recursively
 *
 * @param {string} baseDir - the absolute path to scan
 * @returns {Promise<string[]>} paths (relative to baseDir) of every *.spec.js file found
 */
async function _testFiles(baseDir) {
  const entries = await fs.readdir(baseDir, { recursive: true })

  return entries.filter((file) => {
    return file.endsWith('.spec.js')
  })
}

/**
 * Find every spec (across TEST_DIRS) that calls the `world` fixture and work out the scenario and
 * world.json key it needs
 *
 * @returns {Promise<object[]>} one entry per matching spec, each with `scenarioPath` and `key`
 */
async function listTests() {
  const tests = []

  for (const dir of TEST_DIRS) {
    const baseDir = path.resolve(dir)
    const testFiles = await _testFiles(baseDir)

    for (const testFile of testFiles) {
      const testPath = path.resolve(baseDir, testFile)
      const content = await fs.readFile(testPath, 'utf-8')

      // Find where the spec calls the `world` fixture with the scenario it needs, e.g.
      // world('licence.scenario.js')
      const match = content.match(/world\(\s*['"]([^'"]+\.scenario\.js)['"]\s*\)/)

      // Not every spec seeds data this way (yet) - skip ones that don't call world(...)
      if (!match) {
        continue
      }

      const scenarioFilename = match[1]

      tests.push({
        scenarioPath: scenarioFilename,
        key: buildWorldKey(scenarioFilename, testPath)
      })
    }
  }

  return tests
}

/**
 * Load a scenario's data by calling its default export
 *
 * @param {string} filename - the scenario filename, e.g. 'licence.scenario.js'
 *
 * @returns {Promise<object>} the scenario's data
 */
async function _scenarioData(filename) {
  const scenarioPath = path.resolve(SCENARIOS_DIR, filename)
  const { default: getBody } = await import(`file://${scenarioPath}`)

  if (typeof getBody !== 'function') {
    throw new Error(`The file "${filename}" must have an "export default" function.`)
  }

  return await getBody()
}
