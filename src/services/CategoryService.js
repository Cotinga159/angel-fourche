"use strict";
import CategoryRepository from "../repositories/PgCategoryRepository.js";

class CategoryService {

    static async getById(categoryId) {
        return CategoryRepository.findById(categoryId);
    }

    static async add(nameCategory) {
        if (!nameCategory || nameCategory.trim() === "") {
            throw new Error("Le nom de la catégorie ne peut pas être vide");
        }
        return CategoryRepository.create({ nameCategory: nameCategory.trim() });
    }

    static async delete(categoryId) {
        return CategoryRepository.delete(categoryId)
    }
}

export default CategoryService;
