"use strict";

import db from "../config/database.js";
import Rating from "../entities/Rating.js";

class RatingRepository {

    static async findById(id) {
        const query = /*sql*/ `
        SELECT
            id_rating,
            user_id,
            recipe_id,
            score,
            created_at
        FROM ratings
        WHERE id_rating = $1
        `;

        const { rows } = await db.query(query, [id]);
        return rows[0] ? new Rating(rows[0]) : null;
    }

// Ajoute une note

    static async create(data) {
    const query = /*sql*/ `
    INSERT INTO ratings (
        user_id,
        recipe_id,
        score
    )
    VALUES ($1, $2, $3)
    RETURNING
        id_rating,
        user_id,
        recipe_id,
        score,
        created_at
    `;

    const values = [
        data.userId,
        data.recipeId,
        data.score,
    ];

    const { rows } = await db.query(query, values);
    return new Rating(rows[0]);
}

static async update(id, score) {
    console.log("UPDATE rating - id:", id, "score:", score);
    const query = /*sql*/ `
    UPDATE ratings
    SET score = $1
    WHERE id_rating = $2
    RETURNING id_rating, user_id, recipe_id, score, created_at
    `;
    try {
        const { rows } = await db.query(query, [score, id]);
        console.log("UPDATE result:", rows[0]);
        return rows[0] ? new Rating(rows[0]) : null;
    } catch (err) {
        console.error("UPDATE error:", err.message);
        throw err;
    }
}
// Trouve la note d’un utilisateur pour une recette

static async findByUserAndRecipe(userId, recipeId) {
    const query = /*sql*/ `
    SELECT
        id_rating,
        user_id,
        recipe_id,
        score,
        created_at
    FROM ratings
    WHERE user_id = $1
    AND recipe_id = $2
    `;

    const { rows } = await db.query(query, [userId, recipeId]);
    return rows[0] ? new Rating(rows[0]) : null;
}

// Calculer la moyenne des notes d’une recette

static async getAverageByRecipe(recipeId) {
    const query = /*sql*/ `
    SELECT
        AVG(score) AS average_rating
    FROM ratings
    WHERE recipe_id = $1
    `;

    const { rows } = await db.query(query, [recipeId]);
    return Number(rows[0].average_rating) || 0;
}

// Compte le nombre de votes

static async countByRecipe(recipeId) {
    const query = /*sql*/ `
    SELECT COUNT(*) AS count
    FROM ratings
    WHERE recipe_id = $1
    `;

    const { rows } = await db.query(query, [recipeId]);
    return Number(rows[0].count);
}

// Supprime une note

static async delete(id) {
    const query = /*sql*/ `
    DELETE FROM ratings
    WHERE id_rating = $1
    `;

    const result = await db.query(query, [id]);
    return result.rowCount > 0;
}
}

export default RatingRepository;