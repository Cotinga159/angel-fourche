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
        if (!rows[0]) return null;
    rows[0].step = Array.isArray(rows[0].step) ? rows[0].step : [];
    rows[0].ingredient = Array.isArray(rows[0].ingredient) ? rows[0].ingredient : [];
    return new Recipe(rows[0]);
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

    // Liste des recettes avec auteur et rating

static async findAllWithRatings() {
        const query = /*sql*/ `
        SELECT *
        FROM v_recipes_with_rating_view
        ORDER BY created_at DESC;
        `;
        const { rows } = await db.query(query);
        return rows.map((row) => new Recipe(row));
    }
      // Liste des recettes avec commentaires
    static async findAllWithComments() {
        const query = /*sql*/ `
        SELECT *
        FROM v_recipes_with_comments_view
        ORDER BY created_at DESC;
        `;
        const { rows } = await db.query(query);
        return rows.map((row) => new Recipe(row));
    }

        // Liste des recettes complètes (auteur, rating, commentaires)
    static async findAllComplete() {
        const query = /*sql*/ `
        SELECT *
        FROM v_recipes_complete
        ORDER BY created_at DESC;
        `;
        const { rows } = await db.query(query);
            
        return rows.map(row => {
        // JSONB est déjà parsé par pg → pas besoin de JSON.parse !
        row.step = Array.isArray(row.step) ? row.step : [];
        row.ingredient = Array.isArray(row.ingredient) ? row.ingredient : [];
        return new Recipe(row);
    });
    }

        // Recherche de recettes par mot clé
    static async searchByKeyword(keyword) {
        const query = /*sql*/ `
        SELECT *
        FROM v_recipes_search_view
        WHERE title ILIKE $1 OR description ILIKE $1
        ORDER BY created_at DESC;
        `;
        const { rows } = await db.query(query, [`%${keyword}%`]);
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
        RETURNING 
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
        `;

        const values = [
        data.description ?? null,
        data.ingredient ?? null,
        data.step ?? null,
        data.difficulty ?? null,
        data.picture ?? null,
        data.typeDiet ?? null,
        data.dietReligious ?? null,
        data.typeFlavor ?? null,
        id, 
        ];
        
                const { rows } = await db.query(query, values);
                return rows[0] ? new Recipe(rows[0]) : null;

    }
}

export default RecipeRepository;
