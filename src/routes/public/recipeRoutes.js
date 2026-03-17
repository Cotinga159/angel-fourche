"use strict";

import { Router } from "express";
import RecipeController from "../../controllers/RecipeController.js";
import { requireAuth } from "../../middlewares/authMiddleware.js";
import CategoryRepository from "../../repositories/PgCategoryRepository.js";
import RecipeRepository from "../../repositories/PgRecipeRepository.js";

const router = Router();

router.get("/recipes", RecipeController.index);

/**
 * 📄 Afficher le formulaire de création
 * GET /recipes/new
 */
router.get("/recipes/new", requireAuth, async (req, res) => {
    try {
        const categories = await CategoryRepository.findAll();
        res.render("pages/recipes/new", { categories });
    } catch (error) {
        req.flash("error", error.message);
        res.redirect("/recipes");
    }
});

router.get("/recipes/:id/edit", requireAuth, RecipeController.showEditForm);

router.get("/recipes/search", async (req, res) => {
    try {
        const keyword = req.query.q || "";
        console.log("recherche:", keyword);
        const recipes = await RecipeRepository.searchByKeyword(keyword);
        console.log("résultats:", recipes.length);
        res.render("pages/recipes/index", { recipes, searchQuery: keyword, user: req.session.user || null });
    } catch (error) {
        console.log("ERREUR recherche:", error.message);
        req.flash("error", error.message);
        res.redirect("/recipes");
    }
});

router.get("/recipes/:id", RecipeController.show);


export default router;
