import { pool } from "../config/database.js";
import { readFileSync } from "fs";
import { fileURLToPath } from "url";
import path from "path";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

async function runAllMigrations() {
    const files = [
        "./config/03_add_extensions.sql",
        "./config/04_add_types.sql",
        "./tables/01_add_users_table.sql",
        "./tables/02_add_categories_table.sql",
        "./tables/03_add_recipes_table.sql",
        "./tables/04_add_comments_table.sql",
        "./tables/05_add_ratings_table.sql",
        "./tables/06_add_favorites_table.sql",
        "./tables/07_add_user_session.sql",
    ];

    for (const file of files) {
        const sql = readFileSync(path.join(__dirname, file), "utf8");
        await pool.query(sql);
        console.log(`✅ ${file}`);
    }
}

const isMainModule = import.meta.url === `file://${process.argv[1]}`;
if (isMainModule) {
    runAllMigrations()
        .catch((err) => {
            console.error("❌ MIGRATIONS FAILED:", err);
            process.exit(1);
        })
        .finally(() => {
            pool.end();
        });
}

export default runAllMigrations;