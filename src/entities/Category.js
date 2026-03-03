"use strict";



class Category {
    constructor(data) {

        this.id = data.id_category;
        this.nameCategory = data.name_category;
        this.createdAt = data.created_at;

        // Relations optionnelles
        if (data.recipes_list) {
            this.recipes = data.recipes_list.map(r => new Recipe(r));
        }
    }

    static fromDatabase(row) {
        return row ? new Category(row) : null;
    }

    static fromDatabaseList(rows) {
        return rows.map((row) => new EventTarget(row));
    }

    toJSON() {
        return {
            id: this.id,
            nameCategory: this.nameCategory,
            createdAt: this.createdAt,
        }
    }

    toString() {
        return JSON.stringify(this.toJSON);
    }
}

export default Category;
