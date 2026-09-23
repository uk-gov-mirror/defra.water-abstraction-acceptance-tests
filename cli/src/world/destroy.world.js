import { clean } from 'water-abstraction-engine/test/database.js'
import { fileURLToPath } from 'node:url'
import path from 'node:path'
import { unlink } from 'node:fs/promises'

/**
 * Removes all created data from the database and deletes local world.json
 */
export default async function destroyWorld() {
  await clean()

  try {
    const __dirname = path.dirname(fileURLToPath(import.meta.url))
    const worldFile = path.resolve(__dirname, 'world.json')
    await unlink(worldFile)
  } catch (error) {
    // Ignore error if the file already doesn't exist
    if (error.code !== 'ENOENT') {
      throw error
    }
  }
}
