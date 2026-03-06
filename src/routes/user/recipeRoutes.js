"use strict";

import { Router } from "express";
import RecipeController from "../../controllers/RecipeController.js";
import { requireAuth } from "../../middlewares/authMiddleware.js";

const router = Router();

/**
 * Routes UTILISATEUR (requiert authentification)
 *
 * Création, mise à jour, suppression de recettes
 */

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