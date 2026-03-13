"use strict";

import RatingService from "../services/RatingService.js";
import RatingRepository from "../repositories/PgRatingRepository.js";

class RatingController {

    /**
   * Ajouter ou mettre à jour une note pour une recette
   */
    async rateRecipe(req, res) {
    try {
        const userId = req.session.userId;
        const recipeId = req.params.recipeId;
        const value = parseInt(req.body.value);

        const existing = await RatingRepository.findByUserAndRecipe(userId, recipeId);
console.log("existing:", existing);
        console.log("value:", value);
        if (existing) {
            console.log("UPDATE avec id:", existing.id);
            await RatingService.update(existing.id, value);
        } else {
            console.log("CREATE");
            await RatingService.add(userId, recipeId, value);
        }

        req.flash("success", "Note enregistrée ⭐");
        res.redirect(`/recipes/${recipeId}`);
    } catch (error) {
        req.flash("error", error.message);
        res.redirect(`/recipes/${req.params.recipeId}`);
    }
}

    /**
   * Supprimer une note
   */
    async deleteRating(req, res) {
    try {
        const userId = req.session.userId;
        const recipeId = req.params.recipeId;

        await RatingService.deleteRating(userId, recipeId);

        req.flash("success", "Note supprimée");
        res.redirect(`/recipes/${recipeId}`);

    } catch (error) {
        req.flash("error", error.message);
        res.redirect(`/recipes/${req.params.recipeId}`);
    }
    }
}

export default new RatingController();