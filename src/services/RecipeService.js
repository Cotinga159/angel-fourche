"use strict";

import RecipeRepository from "../repositories/PgRecipeRepository.js";
import { schemas } from "../validators/recipeValidator.js";

class RecipeService {

    static async getById(recipeId) {
        return RecipeRepository.findById(recipeId);
    }

    static async getByUser(userId) {
        return RecipeRepository.findByUserId(userId);
    }

static async create(data) {
    const result = schemas.create.safeParse(data);
    
    if (!result.success) {
        const firstError = result.error.issues[0].message;
        throw new Error(firstError);
    }
    
    return RecipeRepository.create({
        ...data,
        ...result.data
    });
}
static async search(query) {
    if (!query || !query.trim()) return [];
    return RecipeRepository.search(query.trim());
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

    static async getTopFavoritesWeek() {
    return RecipeRepository.getTopFavoritesWeek();
}

static async getTopRated() {
    return RecipeRepository.getTopRated();
}

static async getTopByCategory() {
    return RecipeRepository.getTopByCategory();
}
}

export default RecipeService;