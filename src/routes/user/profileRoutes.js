"use strict";

import { Router } from "express";
import RecipeController from "../../controllers/RecipeController.js";
import RecipeService from "../../services/RecipeService.js";
import { requireAuth } from "../../middlewares/authMiddleware.js";
import UserRepository from "../../repositories/PgUserRepository.js";
import FavoriteRepository from "../../repositories/PgFavoriteRepository.js";

const router = Router();

/**
 * Routes UTILISATEUR (requiert authentification)
 *
 * Création, mise à jour, suppression de recettes
 */
router.get("/", requireAuth, async (req, res) => {
    try {
        const userId = req.session.userId;
        const recipes = await RecipeService.getByUser(userId);
        const stats = await UserRepository.findProfilWithStats(userId);
        const favorites = await FavoriteRepository.getByUser(userId);
        res.render("pages/users/index", { 
            user: req.session.user,
            recipes: recipes,
            favorites,
            myRecipesCount: recipes.length,
            myFavoritesCount: stats.favoritesCount,
            myCommentsCount:  stats.commentsCount,
            myRatingsCount:   stats.ratingsCount
        });
    } catch (error) {
        req.flash("error", error.message);
        res.redirect("/recipes");
    }
});
/**
 * ➕ Créer une nouvelle recette
 * POST /recipes/create
 */
router.post("/create", requireAuth, RecipeController.create);

/**
 * ✏️ Mettre à jour une recette existante
 * POST /recipes/:id/update
 */
router.post("/:id/update", requireAuth, RecipeController.update);

/**
 * 🗑️ Supprimer une recette
 * POST /recipes/:id/delete
 */
router.post("/:id/delete", requireAuth, RecipeController.delete);

export default router;