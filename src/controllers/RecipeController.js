"use strict";

import RecipeService from "../services/RecipeService.js";
import CommentService from "../services/CommentService.js";
import FavoriteService from "../services/FavoriteService.js";
import CategoryRepository from "../repositories/PgCategoryRepository.js";

class RecipeController {

    /**
   * Affiche toutes les recettes (ou filtrées)
   */
    async index(req, res) {
    try {
        const userId = req.session.userId || null;
        const recipes = await RecipeService.getAll(userId);
        const myRecipesCount = userId 
        ? recipes.filter(r => r.userId === userId).length 
        : 0;
        let favoriteIds = [];
        if (userId) {
            const favorites = await Promise.all(
                recipes.map(r => FavoriteService.isFavorite(userId, r.id))
            );
            favoriteIds = recipes
                .filter((_, i) => favorites[i])
                .map(r => r.id);
        }
        res.render("pages/recipes/index", {
        title: "Recettes",
        recipes,
        favoriteIds,
        user: userId,
        myRecipesCount,
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

        const isFavorite = req.session.userId 
    ? await FavoriteService.isFavorite(req.session.userId, req.params.id)
    : false;

        res.render("pages/recipes/show", {
            title: recipe.title,
            recipe,
            comments,
            user: req.session.userId ?? null,
            isFavorite,
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
        console.log("req.body:", req.body);
        console.log("userId:", req.session.userId);
        const userId = req.session.userId;
        const quantities = [].concat(req.body.ingredient_quantity || []);
        const units      = [].concat(req.body.ingredient_unit || []);
        const names      = [].concat(req.body.ingredient_name || []);

        const ingredients = names.map((name, i) => ({
        quantity: quantities[i] ? parseFloat(quantities[i]) : null,
        unit:     units[i] || null,
        name:     name.trim()
        }));

const steps = Array.isArray(req.body.step)
    ? req.body.step.map((s, i) => ({ step_number: i + 1, instruction: s }))
    : [{ step_number: 1, instruction: req.body.step }];
        const recipeData = { 
            userId,
            categoryId:      req.body.category_id,
            title:           req.body.title,
            description:     req.body.description,
            ingredient:      ingredients,
            step:            steps,
            preparationTime: req.body.preparation_time,  
            serving:         req.body.serving,
            difficulty:      req.body.difficulty,
            picture:         req.body.picture,
            typeDiet:        req.body.type_diet,        
            dietReligious:   req.body.diet_religious,    
            typeFlavor:      req.body.type_flavor,       
        
        };

        console.log("recipeData:", recipeData);
        const recipe = await RecipeService.create(recipeData);
        console.log("recette créée:", recipe);
        req.flash("success", "Recette ajoutée !");
        res.redirect("/recipes");
    } catch (error) {
        console.log("ERREUR création recette:", error.message);
        req.flash("error", error.message);
        res.redirect("/recipes");
    }
}

    async showCreateForm(req, res) {
    try {
        res.render("pages/recipes/new");
    } catch (error) {
        req.flash("error", error.message);
        res.redirect("/recipes");
    }
}

    /**
   * Met à jour une recette existante
   */
    async update(req, res) {
    try {
        const recipeId = req.params.id;

        const quantities = [].concat(req.body.ingredient_quantity || []);
        const units      = [].concat(req.body.ingredient_unit || []);
        const names      = [].concat(req.body.ingredient_name || []);
        const ingredients = names.map((name, i) => ({
            quantity: quantities[i] ? parseFloat(quantities[i]) : null,
            unit:     units[i] || null,
            name:     name.trim()
        }));

        const steps = [].concat(req.body.step || []).map((s, i) => ({
            step_number: i + 1,
            instruction: s.trim()
        }));

        const recipeData = {
            categoryId:      req.body.category_id,
            title:           req.body.title,
            description:     req.body.description,
            ingredient:      ingredients,
            step:            steps,
            preparationTime: req.body.preparation_time,
            serving:         req.body.serving,
            difficulty:      req.body.difficulty,
            picture:         req.body.picture,
            typeDiet:        req.body.type_diet,
            dietReligious:   req.body.diet_religious || null,
            typeFlavor:      req.body.type_flavor,
        };

        await RecipeService.update(recipeId, recipeData);
        req.flash("success", "Recette mise à jour !");
        res.redirect(`/recipes/${recipeId}`);
    } catch (error) {
        req.flash("error", error.message);
        res.redirect("/users");
    }
}
async showEditForm(req, res) {
    try {
        console.log("showEditForm id:", req.params.id);
        const recipe = await RecipeService.getById(req.params.id);
        console.log("recipe:", recipe);
        const categories = await CategoryRepository.findAll();
        res.render("pages/recipes/edit", { recipe, categories });
    } catch (error) {
        console.log("ERREUR showEditForm:", error.message);
        req.flash("error", error.message);
        res.redirect("/users");
    }
}
    /**
   * Supprime une recette
   */
    async delete(req, res) {
    try {
        const userId = req.session.userId;
        const recipeId = req.params.id;

        await RecipeService.delete(recipeId, userId);

        req.flash("success", "Recette supprimée !");
        res.redirect("/users");
    } catch (error) {
        req.flash("error", error.message);
        res.redirect("/users");
    }
    }
}

export default new RecipeController();