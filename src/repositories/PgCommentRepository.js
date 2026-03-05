"use strict";

import db from "../config/database.js";
import Comment from "../entities/Comment.js";



class CommentRepository {

    static async findById(id) {
        const query = /*sql*/ `
        SELECT
            id_comment,
            user_id,
            recipe_id,
            content,
            created_at
        FROM comments
        WHERE id_comment = $1
        `;

        const { rows } = await db.query(query, [id]);
        return rows[0] ? new Comment(rows[0]) : null;
    }
    static async findByUserId(userId) {
        const query = /*sql*/ `
            SELECT *
            FROM comments
            WHERE user_id = $1
            ORDER BY created_at DESC;
        `;
        const { rows } = await db.query(query, [userId]);
        return rows.map(row => new Comment(row));
    }
    static async findByRecipeId(recipeId) {
    const query = /*sql*/ `
    SELECT
        id_comment,
        user_id,
        recipe_id,
        content,
        created_at
    FROM comments
    WHERE recipe_id = $1
    ORDER BY created_at DESC
    `;

    const { rows } = await db.query(query, [recipeId]);
    return rows.map((row) => new Comment(row));
    }
    /**
   * Compte les commentaires d’une recette
   *
   * @param {string} recipeId
   * @returns {Promise<number>}
   */
    static async countByRecipeId(recipeId) {
        const query = /*sql*/ `
        SELECT COUNT(*) AS count
        FROM comments
        WHERE recipe_id = $1;
        `;
        const { rows } = await db.query(query, [recipeId]);
        return Number(rows[0].count);
    }

    /**
   * Crée un commentaire
   *
   * @param {object} data
   * @returns {Promise<Comment>}
   */
    static async create(data) {
        const query = /*sql*/ `
        INSERT INTO comments (
            user_id,
            recipe_id,
            content
        )
        VALUES ($1, $2, $3)
        RETURNING
            id_comment,
            user_id,
            recipe_id,
            content,
            created_at
        `;

        const values = [
            data.userId,
            data.recipeId,
            data.content,
        ];

        const { rows } = await db.query(query, values);
        return new Comment(rows[0]);
    }



    /**
   * Supprime un commentaire
   *
   * @param {string} id
   * @returns {Promise<boolean>}
   */
    static async delete(id) {
    const query = /*sql*/ `
    DELETE FROM comments
    WHERE id_comment = $1
    `;

    const result = await db.query(query, [id]);
    return result.rowCount > 0;
    }
    /**
   * Supprime tous les commentaires liés à un recette
   *
   * @param {string} recipeId
   * @returns {Promise<number>}
   */
    static async deleteByRecipe(recipeId) {
        const result = await db.query(`DELETE FROM comments WHERE recipe_id = $1`, [
            recipeId,
        ]);

        return result.rowCount;
    }
}

export default CommentRepository;
