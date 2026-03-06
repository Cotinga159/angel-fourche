"use strict";

import { z } from "zod";

/** Mot de passe : minimum */
const passwordMin = 8;

/** Pseudo : caractères simples */
const PSEUDO_REGEX = /^[a-zA-Z0-9._-]+$/;

/**
 * Transforme une valeur string ou bool en vrai booléen
 * Gère : true/false, "true"/"false", "on"/"off", undefined
 */
const stringToBoolean = z
    .union([z.boolean(), z.string()])
    .transform((val) => {
    if (typeof val === "boolean") return val;
    const str = val.toLowerCase();
    return str === "true" || str === "on";
    })
    .optional();

/* ---------- Schemas ---------- */

/**
 * Schéma d'inscription
 */
export const registerSchema = z.object({
    email: z
    .email({ message: "Format d'email invalide" })
    .min(5, { message: "L'email doit contenir au moins 5 caractères" })
    .max(255, { message: "L'email ne peut pas dépasser 255 caractères" }),

    password: z
    .string()
    .min(passwordMin, {
        message: `Le mot de passe doit contenir au moins ${passwordMin} caractères`,
    })
    .max(100, { message: "Le mot de passe est trop long" }),

    pseudo: z
    .string()
    .min(3, { message: "Le pseudo est trop court" })
    .max(50, { message: "Le pseudo est trop long" })
    .regex(PSEUDO_REGEX, {
        message: "Le pseudo ne peut contenir que lettres, chiffres, ., _ et -",
    }),

    gdpr_consent: stringToBoolean,
});

/**
 * Schéma de connexion
 */
export const loginSchema = z.object({
    email: z.email({ message: "Format d'email invalide" }).min(5).max(255),
    password: z.string().min(1, { message: "Mot de passe requis" }),
});

/**
 * Schéma de mise à jour de profil
 * - tous optionnels ; transforme gdpr_consent si envoyé
 */
export const updateProfileSchema = z.object({
    email: z.email({ message: "Format d'email invalide" }).min(5).max(255).optional(),
    password: z.string().min(passwordMin).max(100).optional(),
    name_user: z.string().min(3).max(50).regex(PSEUDO_REGEX).optional(),
    gdpr_consent: stringToBoolean,
});

/* ---------- Helpers exportés (optionnel) ---------- */
export const schemas = {
    register: registerSchema,
    login: loginSchema,
    updateProfile: updateProfileSchema,
};
