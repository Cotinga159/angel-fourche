"use strict";
import FavoriteRepository from "../repositories/PgFavoriteRepository.js";

class FavoriteService {
    static async toggle(userId, recipeId) {
        const already = await FavoriteRepository.exists(userId, recipeId);
        if (already) {
            await FavoriteRepository.remove(userId, recipeId);
            return false;
        } else {
            await FavoriteRepository.add(userId, recipeId);
            return true;
        }
    }

    static async isFavorite(userId, recipeId) {
        return FavoriteRepository.exists(userId, recipeId);
    }
}

export default FavoriteService;