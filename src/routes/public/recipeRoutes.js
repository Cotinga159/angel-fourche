"use strict";

import { Router } from "express";
import RecipeController from "../../controllers/RecipeController.js";

const router = Router();

router.get("/recipes", RecipeController.index);



export default router;
