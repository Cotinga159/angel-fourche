"use strict";

import RecipeRepository from "../repositories/PgRecipeRepository.js";

class RecipeService {

    static async getById(recipeId) {
        return RecipeRepository.findById(recipeId);
    }

    static async getByUser(userId) {
        return RecipeRepository.findByUserId(userId);
    }

    static async create(data) {

        if (!data.title || !data.title.trim()) {
            throw new Error("Le titre de la recette ne peut pas être vide");
        }
        if (!data.userId) {
            throw new Error("Un utilisateur doit être associé à la recette");
        }
        if (!data.categoryId) {
            throw new Error("La recette doit appartenir à une catégorie");
        }

        return RecipeRepository.create(data);
    }

    static async getAll() {
    return RecipeRepository.findAllComplete();
}

    static async update(recipeId, data) {

        return RecipeRepository.update(recipeId, data);
    }

    static async delete(recipeId) {
        return RecipeRepository.delete(recipeId);
    }
}

export default RecipeService;