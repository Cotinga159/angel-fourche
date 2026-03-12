"use strict";

import RecipeService from "../services/RecipeService.js";
import CommentService from "../services/CommentService.js";

class RecipeController {

    /**
   * Affiche toutes les recettes (ou filtrées)
   */
    async index(req, res) {
    try {
        const userId = req.session.userId || null;
        const recipes = await RecipeService.getAll(userId);
        res.render("pages/recipes/index", {
        title: "Recettes",
        recipes,
        });
    } catch (error) {
        req.flash("error", error.message);
        res.redirect("back");
    }
    }

    /**
   * Affiche une recette unique
   */
    async show(req, res) {
    try {
        const recipe = await RecipeService.getById(req.params.id);
        if (!recipe) {
            return res.status(404).render("pages/errors/404");
        }

        const comments = await CommentService.getByRecipeId(req.params.id); // ← ajoute ça

        res.render("pages/recipes/show", {
            title: recipe.title,
            recipe,
            comments,
            user: req.session.userId ?? null,
        });
    } catch (error) {
         console.error("Erreur RecipeController.show:", error); // ← pour voir l'erreur réelle
        res.redirect("/recipes");
    }
    }

    /**
   * Crée une nouvelle recette
   */
    async create(req, res) {
    try {
        const userId = req.session.userId;
        if (!userId) {
        req.flash("error", "Vous devez être connecté pour ajouter une recette");
        return res.redirect("/auth/login");
        }

        const recipeData = { ...req.body, userId };
        await RecipeService.addRecipe(recipeData);

        req.flash("success", "Recette ajoutée !");
        res.redirect("/recipes");
    } catch (error) {
        req.flash("error", error.message);
        res.redirect("back");
    }
    }

    /**
   * Met à jour une recette existante
   */
    async update(req, res) {
    try {
        const userId = req.session.userId;
        const recipeId = req.params.id;

        await RecipeService.updateRecipe(recipeId, userId, req.body);

        req.flash("success", "Recette mise à jour !");
        res.redirect(`/recipes/${recipeId}`);
    } catch (error) {
        req.flash("error", error.message);
        res.redirect("back");
    }
    }

    /**
   * Supprime une recette
   */
    async delete(req, res) {
    try {
        const userId = req.session.userId;
        const recipeId = req.params.id;

        await RecipeService.deleteRecipe(recipeId, userId);

        req.flash("success", "Recette supprimée !");
        res.redirect("/recipes");
    } catch (error) {
        req.flash("error", error.message);
        res.redirect("back");
    }
    }
}

export default new RecipeController();