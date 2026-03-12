"use strict";

import { Router } from "express";
import RecipeController from "../../controllers/RecipeController.js";

const router = Router();

router.get("/recipes", RecipeController.index);
router.get("/recipes/:id", RecipeController.show);


export default router;
