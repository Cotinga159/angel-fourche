import { pool } from "../../src/config/database.js";
import { readFileSync } from "fs";
import { fileURLToPath } from "url";
import path from "path";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

async function runAllMigrations() {
    const files = [
        "./config/03_add_extensions.sql",
        "./config/04_add_types.sql",
        "../triggers/01_add_trigger_set_timestamp.sql",
        "./tables/01_add_users_table.sql",
        "./tables/02_add_categories_table.sql",
        "./tables/03_add_recipes_table.sql",
        "./tables/04_add_comments_table.sql",
        "./tables/05_add_ratings_table.sql",
        "./tables/06_add_favorites_table.sql",
        "./tables/07_add_user_session.sql",
           "../views/01_v_recipes_with_author_view.sql",
    "../views/02_v_recipes_with_rating_view.sql",
    "../views/03_v_recipes_complete_view.sql",
    "../views/04_v_recipes_with_comments_view.sql",
    "../views/05_v_user_profile_stats_view.sql",
    "../views/06_v_recipes_favorites_views.sql",
    "../views/07_v_recipes_search_view.sql",
    "../views/08_v_recipes_top_favorites_week_view.sql",
    "../views/09_v_recipes_top_rated_view.sql",
    "../views/10_v_recipes_top_by_category_view.sql",
        "../seeders/01_add_users_seeders.sql",
    "../seeders/02_add_categories_seeders.sql",
    "../seeders/03_add_recipes_seeders.sql",
    "../seeders/04_add_comments_seeders.sql",
    "../seeders/05_add_ratings_seeders.sql",
    "../seeders/06_add_favorites_seeders.sql",
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