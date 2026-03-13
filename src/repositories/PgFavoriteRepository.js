"use strict";

import db from "../config/database.js";



class FavoriteRepository {

    static async add(userId, recipeId) {
        const query = /*sql*/ `
        INSERT INTO favorites (user_id, recipe_id) 
            VALUES ($1, $2)
            ON CONFLICT (user_id, recipe_id) DO NOTHING
            RETURNING user_id, recipe_id;
        `;

        const { rows } = await db.query(query, [userId, recipeId]);
        return rows[0] ? { userId: rows[0].user_id, recipeId: rows[0].recipe_id } : null;
    }

    static async remove(userId, recipeId) {
        const query = /*sql*/ `
        DELETE FROM favorites
            WHERE user_id = $1 AND recipe_id = $2
            RETURNING user_id, recipe_id;
        `;

        const { rows } = await db.query(query, [userId, recipeId]);
        return rows.length > 0;
    }

    static async exists(userId, recipeId) {
        const query = /*sql*/ `
        SELECT 1
        FROM favorites
        WHERE user_id = $1 AND recipe_id = $2;
    `;

        const { rows } = await db.query(query, [userId, recipeId]);
        return rows.length > 0;
    }
}


export default FavoriteRepository;
