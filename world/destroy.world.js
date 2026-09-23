import { clean } from 'water-abstraction-engine/test/database.js'

/**
 * Removes all created data from the database
 */
export default async function destroyWorld() {
  await clean()

  // delete the world.json file
}
