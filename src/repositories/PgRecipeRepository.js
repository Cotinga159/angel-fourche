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
        updated_at,
        category_name,
        user_pseudo,
        average_rating,
        ratings_count,
        comments_count
        FROM v_recipes_complete
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
    const words = keyword.trim().split(/\s+/);
    
    const conditions = words.map((_, i) => `(
        title ILIKE $${i + 1}
        OR description ILIKE $${i + 1}
        OR ingredient::text ILIKE $${i + 1}
        OR diet_religious ILIKE $${i + 1}
        OR difficulty ILIKE $${i + 1}
        OR type_flavor ILIKE $${i + 1}
        OR type_diet ILIKE $${i + 1}
    )`).join(" AND ");

    const values = words.map(w => `%${w}%`);

    const query = /*sql*/ `
        SELECT *
        FROM v_recipes_search
        WHERE ${conditions}
        ORDER BY created_at DESC;
    `;

    const { rows } = await db.query(query, values);
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
        category_id     = COALESCE($1, category_id),
        title           = COALESCE($2, title),
        description     = COALESCE($3, description),
        ingredient      = COALESCE($4, ingredient),
        step            = COALESCE($5, step),
        preparation_time = COALESCE($6, preparation_time),
        serving         = COALESCE($7, serving),
        difficulty      = COALESCE($8, difficulty),
        picture         = COALESCE($9, picture),
        type_diet       = COALESCE($10, type_diet),
        diet_religious  = COALESCE($11, diet_religious),
        type_flavor     = COALESCE($12, type_flavor),
        updated_at      = NOW()
    WHERE id_recipe = $13
    RETURNING *;
    `;
    const values = [
        data.categoryId      ?? null,
        data.title           ?? null,
        data.description     ?? null,
        data.ingredient      ? JSON.stringify(data.ingredient) : null,
        data.step            ? JSON.stringify(data.step) : null,
        data.preparationTime ?? null,
        data.serving         ?? null,
        data.difficulty      ?? null,
        data.picture         ?? null,
        data.typeDiet        ?? null,
        data.dietReligious   ?? null,
        data.typeFlavor      ?? null,
        id,
    ];

    const { rows } = await db.query(query, values);
    return rows[0] ? new Recipe(rows[0]) : null;
}

    static async delete(id) {
    const query = /*sql*/ `
        DELETE FROM recipes
        WHERE id_recipe = $1
        RETURNING id_recipe;
    `;
    const { rows } = await db.query(query, [id]);
    return rows.length > 0;
}
static async getTopFavoritesWeek() {
    const { rows } = await db.query(`
        SELECT * FROM v_recipes_top_favorites_week LIMIT 4
    `);
    return rows.map(row => new Recipe(row));
}

static async getTopRated() {
    const { rows } = await db.query(`
        SELECT * FROM v_recipes_top_rated LIMIT 7
    `);
    return rows.map(row => new Recipe(row));
}

static async getTopByCategory() {
    const { rows } = await db.query(`
        SELECT * FROM v_recipes_top_by_category
    `);
    return rows.map(row => new Recipe(row));
}
}

export default RecipeRepository;
