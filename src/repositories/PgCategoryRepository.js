"use strict";

import db from "../config/database.js";
import Category from "../entities/Category.js";



class CategoryRepository {

    static async findById(id) {
        const query = /*sql*/ `
        SELECT
            id_category,
            name_category,
            created_at
        FROM categories
        WHERE id_category = $1
        `;

        const { rows } = await db.query(query, [id]);
        return rows[0] ? new Category(rows[0]) : null;
    }

    static async findAll() {
    const query = /*sql*/ `
    SELECT
        id_category,
        name_category,
        created_at
    FROM categories
    ORDER BY name_category
    `;

    const { rows } = await db.query(query);
    return rows.map((row) => new Category(row));
}

static async create(name) {
    const query = /*sql*/ `
    INSERT INTO categories (name_category)
    VALUES ($1)
    RETURNING
        id_category,
        name_category,
        created_at
    `;

    const { rows } = await db.query(query, [name]);
    return new Category(rows[0]);
}

static async delete(id) {
    const query = /*sql*/ `
    DELETE FROM categories
    WHERE id_category = $1
    `;

    const result = await db.query(query, [id]);
    return result.rowCount > 0;
}

static async findRecipesByCategory(id) {
    const query = /*sql*/ `
    SELECT *
    FROM recipes
    WHERE category_id = $1
    `;

    const { rows } = await db.query(query, [id]);
    return rows;
}

}

export default CategoryRepository;
