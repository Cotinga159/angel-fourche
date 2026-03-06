// routes/admin/recipeRoutes.js
"use strict";

import { Router } from "express";
import RecipeController from "../../controllers/RecipeController.js";
import { requireAdmin } from "../../middlewares/authMiddleware.js";

const router = Router();

/**
 * Routes Recettes (Admin)
 *
 * Nécessite un utilisateur ayant un rôle d'administrateur
 */

// S'assurer que l'utilisateur est un administrateur pour ces routes
router.use(requireAdmin);

/**
 * 🗑️ Suppression d'une recette par un admin
 * DELETE /admin/recipes/:id
 */
router.delete("/recipes/:id", RecipeController.adminDelete);

/**
 * 👀 Liste de toutes les recettes
 * GET /admin/recipes
 */
router.get("/recipes", RecipeController.adminIndex);

export default router;