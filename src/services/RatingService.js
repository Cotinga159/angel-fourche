"use strict";
import RatingRepository from "../repositories/PgRatingRepository.js";

class RatingService {

    // Récupérer une note par son ID
    static async getById(ratingId) {
        return RatingRepository.findById(ratingId);
    }

    // Ajouter une note
    static async add(userId, recipeId, score) {
        if (score < 1 || score > 5) {
            throw new Error("Score must be between 1 and 5");
        }
        return RatingRepository.create({ userId, recipeId, score });
    }

    // Mettre à jour une note existante
    static async update(ratingId, score) {
        if (score < 1 || score > 5) {
            throw new Error("Score must be between 1 and 5");
        }
        return RatingRepository.update(ratingId, score);
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