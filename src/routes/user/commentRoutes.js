"use strict";

import { Router } from "express";
import CommentController from "../../controllers/CommentController.js";
import { requireAuth } from "../../middlewares/authMiddleware.js";

const router = Router();

/**
 * Routes pour l'utilisateur
 */

// Ajouter un commentaire à une recette
router.post("/:recipeId", requireAuth, CommentController.create);

// Supprimer un commentaire personnel
router.post("/:commentId/delete", requireAuth, CommentController.delete);

export default router;