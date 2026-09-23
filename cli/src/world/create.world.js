import { fileURLToPath } from 'node:url'
import fs from 'node:fs/promises'
import path from 'path'

import loadService from '../../../tests/support/load/load.service.js'

const SCENARIOS_DIR = 'tests/support/scenarios'

/**
 * Seed a curated set of scenarios, one after another. Does not tear down first
 */
export default async function createWorld() {
  const scenarios = await _worldData()

  for (const scenarioData of Object.values(scenarios)) {
    await loadService(scenarioData)
  }

  await _saveWorld(scenarios)
}

async function _saveWorld(scenarios) {
  const __dirname = path.dirname(fileURLToPath(import.meta.url))
  const WORLD_FILE = path.resolve(__dirname, 'world.json')

  await fs.writeFile(WORLD_FILE, JSON.stringify(scenarios, null, 2), 'utf-8')
}

async function _worldData() {
  const scenarios = {}
  const files = await fs.readdir(SCENARIOS_DIR)
  const filenames = files.filter((file) => {
    return file.endsWith('.scenario.js')
  })

  for (const filename of filenames) {
    const scenarioPath = path.resolve(SCENARIOS_DIR, `${filename}`)
    const { default: data } = await import(`file://${scenarioPath}`)

    // Use the scenario file name without the 'scenario.js'
    const [key] = filename.split('.')

    scenarios[key] = data()
  }

  return scenarios
}
