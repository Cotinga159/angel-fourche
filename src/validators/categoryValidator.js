"use strict";

import { z } from "zod";

/**
 * Validation des catégories
 */

export const schemas = {
    create: z.object({
    name: z
        .string()
        .trim()
        .min(2, "La catégorie doit contenir au moins 2 caractères")
        .max(50, "La catégorie ne peut pas dépasser 50 caractères")
        .regex(/^[a-zA-Z0-9-_ ]+$/, "Nom de catégorie invalide"),
    }),

    update: z.object({
    name: z
        .string()
        .trim()
        .min(2)
        .max(50)
        .regex(/^[a-zA-Z0-9-_ ]+$/),
    }),
};