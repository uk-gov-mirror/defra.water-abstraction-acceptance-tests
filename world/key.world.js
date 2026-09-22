import path from 'path'

/**
 * Build the world.json key for a given scenario and test pairing, e.g. 'licence.scenario.js' +
 * '.../search.spec.js' -> 'licence-search'
 *
 * @param {string} scenarioFilename - e.g. 'licence.scenario.js'
 * @param {string} specFilePath - path to the spec file, e.g. '.../search.spec.js'
 *
 * @returns {string} the combined world.json key, e.g. 'licence-search'
 */
export default function buildWorldKey(scenarioFilename, specFilePath) {
  const scenarioSlug = scenarioFilename.replace('.scenario.js', '')
  const specSlug = path.basename(specFilePath, '.spec.js')

  return `${scenarioSlug}-${specSlug}`
}
