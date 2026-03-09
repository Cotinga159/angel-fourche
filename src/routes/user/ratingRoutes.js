"use strict";

import { Router } from "express";
import RatingController from "../../controllers/RatingController.js";
import { requireAuth } from "../../middlewares/authMiddleware.js"; // Auth middleware pour protéger certaines routes

const router = Router();

/**
 * Routes EVALUATIONS (Ratings)
 */

/**
 * ➕ Ajouter une évaluation pour une recette
 * POST /ratings/:recipeId
 */
router.post("/:recipeId", requireAuth, RatingController.rateRecipe);

/**
 * 🏆 Afficher les évaluations d'une recette (peut être intégré à la page de recette)
 * GET /ratings/:recipeId
 */
// router.get("/:recipeId", RatingController.getRatings);

export default router;