"use strict";
import { Router } from "express";
import AuthController from "../../controllers/auth/AuthController.js";
import { doubleCsrfProtection } from "../../config/security.js";

const router = Router();

router.get("/auth/register", AuthController.showRegister);
router.post("/auth/register", AuthController.handleRegister);
// router.post("/auth/register", doubleCsrfProtection, AuthController.handleRegister);

router.get("/auth/login", AuthController.showLogin);
router.post("/auth/login", AuthController.handleLogin);
// router.post("/auth/login", doubleCsrfProtection, AuthController.handleLogin);

router.post("/auth/logout", AuthController.logout);
console.log(">>> authRoutes chargé ✅");
export default router;
