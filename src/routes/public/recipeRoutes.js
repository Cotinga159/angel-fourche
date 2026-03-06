"use strict";

import { Router } from "express";
import RecipeController from "../../controllers/RecipeController.js";
import { requireAuth } from "../../middlewares/authMiddleware.js";

const router = Router();

/**
 * Routes PUBLIQUES pour les Recettes
 *
 * Aucune authentification nécessaire
 */

/**
 * 🏠 Liste des recettes (par défaut, toutes les recettes avec leur note et/ou favoris)
 * GET /recipes
 */
router.get("/", RecipeController.index);

/**
 * 🔎 Détail d'une recette (affichage complet avec commentaires)
 * GET /recipes/:id
 */
router.get("/:id", RecipeController.show);

export default router;