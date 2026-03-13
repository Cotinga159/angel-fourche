"use strict";
import { Router } from "express";
import FavoriteController from "../../controllers/FavoriteController.js";
import { requireAuth } from "../../middlewares/authMiddleware.js";

const router = Router();

router.post("/:recipeId", requireAuth, FavoriteController.toggle);

export default router;