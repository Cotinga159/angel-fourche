"use strict";

import { Router } from "express";
import RecipeController from "../../controllers/RecipeController.js";
import RecipeService from "../../services/RecipeService.js";
import { requireAuth } from "../../middlewares/authMiddleware.js";
import UserRepository from "../../repositories/PgUserRepository.js";
import FavoriteRepository from "../../repositories/PgFavoriteRepository.js";
import { hashPassword } from "../../utils/passwordHelper.js";

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
        console.log("recipe[0] complet:", JSON.stringify(recipes[0]));
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

router.post("/update", requireAuth, async (req, res) => {
    try {
        const userId = req.session.userId;
        const { nameUser, email, password, passwordConfirm } = req.body;

        if (password && password !== passwordConfirm) {
            req.flash("error", "Les mots de passe ne correspondent pas.");
            return res.redirect("/users");
        }

        const passwordHash = password ? await hashPassword(password) : undefined;

        await UserRepository.update(userId, {
            nameUser: nameUser || undefined,
            email:    email    || undefined,
            passwordHash,
        });

        // Met à jour la session
        req.session.nameUser = nameUser || req.session.nameUser;
        req.session.email    = email    || req.session.email;

        req.flash("success", "Profil mis à jour !");
        res.redirect("/users");
    } catch (error) {
        req.flash("error", error.message);
        res.redirect("/users");
    }
});

router.get("/edit", requireAuth, async (req, res) => {
    try {
        res.render("pages/users/edit", {
            title: "Modifier mon profil",
        });
    } catch (error) {
        req.flash("error", error.message);
        res.redirect("/users");
    }
});

router.post("/delete", requireAuth, async (req, res) => {
    try {
        const userId = req.session.userId;
        await UserRepository.delete(userId);
        req.session.destroy(() => {
            res.redirect("/auth/register");
        });
    } catch (error) {
        req.flash("error", error.message);
        res.redirect("/users");
    }
});

export default router;