import resetWorld from './world/reset.world.js'

/**
 * Playwright global setup: reset the world before the test run starts
 */
export default async function globalSetup() {
  console.log('Starting global setup: Reset world...')

  await resetWorld()

  console.log('World reset successfully.')
}
