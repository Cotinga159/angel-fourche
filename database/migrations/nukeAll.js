import { pool } from "../../src/config/database.js";
import { readFileSync } from "fs";
import { fileURLToPath } from "url";
import path from "path";
import readline from "readline";
import runAllMigrations from "./runAll.js";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

async function nukeAll() {
    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout,
    });

    rl.question('Tapez "NUKE" pour confirmer : ', async (answer) => {
        if (answer !== "NUKE") {
            console.log("❌ Annulé.");
            rl.close();
            pool.end();
            return;
        }

        rl.question("Reconstruire ? (y/n) : ", async (confirm) => {
            rl.close();
            try {
                const dropFiles = [
                    "./drop/01_drop_all_tables.sql",
                    "./drop/02_drop_all_types.sql",
                ];
                for (const file of dropFiles) {
                    const sql = readFileSync(path.join(__dirname, file), "utf8");
                    await pool.query(sql);
                    console.log(`✅ ${file}`);
                }
                if (confirm === "y") {
                    await runAllMigrations();
                }
                console.log("✅ Nuke terminé !");
            } catch (err) {
                console.error("❌ NUKE FAILED:", err);
            } finally {
                pool.end();
            }
        });
    });
}

nukeAll();