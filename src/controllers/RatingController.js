"use strict";

import RatingService from "../services/RatingService.js";

class RatingController {

    /**
   * Ajouter ou mettre à jour une note pour une recette
   */
    async rateRecipe(req, res) {
    try {
        const userId = req.session.userId;
        const recipeId = req.params.recipeId;
        const { value } = req.body;

        await RatingService.rateRecipe(userId, recipeId, value);

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