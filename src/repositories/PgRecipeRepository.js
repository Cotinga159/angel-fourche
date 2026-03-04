"use strict";

import db from "../config/database.js";
import Recipe from "../entities/Recipe.js";


class RecipeRepository {

    static async findById(id) {
        const query = /*sql*/ `
        SELECT
            id_recipe,
            user_id,
            category_id,
            title,
            description,
            ingredient,
            step,
            preparation_time,
            serving,
            difficulty,
            picture,
            type_diet,
            diet_religious,
            type_flavor,
            created_at,
            updated_at
        FROM recipes
        WHERE id_recipe = $1;
        `;

        const { rows } = await db.query(query, [id]);
        return rows[0] ? new Recipe(rows[0]) : null;
    }

    static async findByUserId(userId) {
        const query = /*sql*/ `
        SELECT *
        FROM v_recipes_with_author
        WHERE id_user = $1
        ORDER BY created_at DESC;
        `;

        const { rows } = await db.query(query, [userId]);
        return rows.map((row) => new Recipe(row));
    }

    static async create(data) {
        const query = /*sql*/ `
        INSERT INTO recipes (
            user_id,
            category_id,
            title,
            description,
            ingredient,
            step,
            preparation_time,
            serving,
            difficulty,
            picture,
            type_diet,
            diet_religious,
            type_flavor
        )
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13)
        RETURNING *;
        `;

        const values = [
            data.userId,
            data.categoryId,
            data.title.trim(),
            data.description.trim(),
            JSON.stringify(data.ingredient),
            JSON.stringify(data.step),
            data.preparationTime,
            data.serving,
            data.difficulty,
            data.picture || null,
            data.typeDiet || null,
            data.dietReligious || null,
            data.typeFlavor || null,
        ];

        const { rows } = await db.query(query, values);
        return new Recipe(rows[0]);
    }

    static async update(id, data) {
        const query = /*sql*/ `
        UPDATE recipes
        SET
            description = COALESCE($1, description),
            ingredient = COALESCE($2, ingredient),
            step = COALESCE($3, step),
            difficulty = COALESCE($4, difficulty),
            picture = COALESCE($5, picture),
            type_diet = COALESCE($6, type_diet),
            diet_religious = COALESCE($7, diet_religious),
            type_flavor = COALESCE($8, type_flavor)
        WHERE id_recipe = $9
        RETURNING *;
        `
    }
}