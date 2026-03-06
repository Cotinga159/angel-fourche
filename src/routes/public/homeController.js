"use strict";

import { Router } from "express";
import HomeController from "../../controllers/HomeController.js";

const router = Router();

/**
 * Routes PUBLIQUES (Home / Marketing)
 *
 * Aucune authentification
 * Aucune donnée sensible
 *
 * @see docs/user-stories.md#public-pages
 */

/**
 * 🏠 Page d'accueil
 * GET /
 */
router.get("/", HomeController.home);

export default router;
