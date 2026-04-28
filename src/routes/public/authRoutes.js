"use strict";
import { Router } from "express";
import AuthController from "../../controllers/auth/AuthController.js";
import { doubleCsrfProtection, authLimiter } from "../../config/security.js";

const router = Router();

router.get("/auth/register", AuthController.showRegister);
router.post("/auth/register", doubleCsrfProtection, AuthController.handleRegister);

router.get("/auth/login", AuthController.showLogin);
router.post("/auth/login", (req, res, next) => {
    console.log("body._csrf:", req.body._csrf);
    console.log("cookie csrf:", req.cookies.csrf);
    next();
}, authLimiter, doubleCsrfProtection, AuthController.handleLogin);

router.post("/auth/logout", AuthController.logout); 
console.log(">>> authRoutes chargé ✅");
export default router;
