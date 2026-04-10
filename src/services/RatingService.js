"use strict";
import RatingRepository from "../repositories/PgRatingRepository.js";
import { schemas } from "../validators/ratingValidator.js";

class RatingService {

    // Récupérer une note par son ID
    static async getById(ratingId) {
        return RatingRepository.findById(ratingId);
    }

    // Ajouter une note
static async add(userId, recipeId, score) {
    console.log("ZOD CHECK score:", score);
    const result = schemas.create.safeParse({ recipe_id: recipeId, score });
    console.log("ZOD RESULT:", result);
    if (!result.success) {
        const firstError = result.error.errors[0].message;
        throw new Error(firstError);
    }
    return RatingRepository.create({ userId, recipeId, score });
}


    // Mettre à jour une note existante
    static async update(id, score) {
        const result = schemas.update.safeParse({ score });
        if (!result.success) {
            const firstError = result.error.errors[0].message;
            throw new Error(firstError);
        }
        return RatingRepository.update(id, score);
    }

    // Supprimer une note
    static async delete(ratingId) {
        return RatingRepository.delete(ratingId);
    }

    // Calculer la moyenne des notes d'une recette
    static async getAverageByRecipe(recipeId) {
        return RatingRepository.getAverageByRecipe(recipeId);
    }
}

export default RatingService;