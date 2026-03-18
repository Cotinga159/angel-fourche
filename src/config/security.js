"use strict";

import helmet from "helmet";
import cors from "cors";
import rateLimit from "express-rate-limit";
import cookieParser from "cookie-parser";
import { csrfSync } from "csrf-sync";
import logger from "./logger.js";
import * as csrfSyncModule from "csrf-sync";
console.log("csrf-sync exports:", Object.keys(csrfSyncModule));

const isTestEnv = process.env.NODE_ENV === "test";

// ═══════════════════════════════════════════════════════════════
// FAIL FAST — CSRF SECRET OBLIGATOIRE (sauf en test)
// ═══════════════════════════════════════════════════════════════

if (!isTestEnv && !process.env.CSRF_SECRET) {
    throw new Error("❌ CSRF_SECRET manquant. Ajoute-le dans ton fichier .env");
}

// ═══════════════════════════════════════════════════════════════
// HEADERS DE SÉCURITÉ (Helmet)
// ═══════════════════════════════════════════════════════════════

export const securityHeaders = helmet({
    contentSecurityPolicy: {
        directives: {
            defaultSrc: ["'self'"],
            scriptSrc: ["'self'", "'unsafe-inline'", "https://cdn.jsdelivr.net"],
            styleSrc: ["'self'", "'unsafe-inline'", "https://fonts.googleapis.com"],
            fontSrc: ["'self'", "https://fonts.gstatic.com"],
            imgSrc: ["'self'", "data:", "https:"],
        },
    },
});

// ═══════════════════════════════════════════════════════════════
// CORS
// ═══════════════════════════════════════════════════════════════

export const corsConfig = cors({
    origin: process.env.APP_FRONTEND_URL || "http://localhost:3000",
    credentials: true,
});

// ═══════════════════════════════════════════════════════════════
// RATE LIMITING
// ═══════════════════════════════════════════════════════════════

export const globalLimiter = rateLimit({
    windowMs: 15 * 60 * 1000,
    max: 1000,
    standardHeaders: true,
    legacyHeaders: false,
    skip: (req) => req.ip === "127.0.0.1",
});

export const authLimiter = rateLimit({
    windowMs: 60 * 60 * 1000,
    max: 10,
    message: "Trop de tentatives de connexion. Réessayez plus tard.",
});

// ═══════════════════════════════════════════════════════════════
// CSRF (Synchronised Token Pattern)
// Désactivé en environnement test
// ═══════════════════════════════════════════════════════════════

let generateToken;
let doubleCsrfProtection;

if (!isTestEnv) {
    const csrfSyncInstance = csrfSync({
        getTokenFromRequest: (req) => req.body._csrf,
    });
    console.log("csrfSync instance keys:", Object.keys(csrfSyncInstance));
    generateToken = csrfSyncInstance.generateToken;
    doubleCsrfProtection = csrfSyncInstance.csrfSynchronisedProtection;
} else {
    generateToken = () => "test-token";
    doubleCsrfProtection = (req, res, next) => next();
}

console.log("generateToken type:", typeof generateToken);
export { generateToken, doubleCsrfProtection };

// ═══════════════════════════════════════════════════════════════
// COOKIES
// ═══════════════════════════════════════════════════════════════

export const cookieParserMiddleware = cookieParser();
