"use strict";

import { Router } from "express";
import CategoryController from "../../controllers/CategoryController.js";
import { requireAuth } from "../../middlewares/authMiddleware.js"; // Auth middleware pour protéger certaines routes

const router = Router();

/**
 * Routes CATEGORIES
 */

/**
 * 📚 Liste des catégories
 * GET /categories
 */
// router.get("/", CategoryController.index);

/**
 * ➕ Créer une nouvelle catégorie
 * POST /categories/create
 */
router.post("/create", requireAuth, CategoryController.create);

/**
 * 🗑️ Supprimer une catégorie
 * POST /categories/:id/delete
 */
router.post("/:id/delete", requireAuth, CategoryController.delete);

export default router;