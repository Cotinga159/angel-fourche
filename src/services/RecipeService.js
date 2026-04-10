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

        const parsed = schemas.create.parse(data);
        
        return RecipeRepository.create({
        ...data,  
        ...parsed 
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