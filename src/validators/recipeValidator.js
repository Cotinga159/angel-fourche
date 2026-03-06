"use strict";

import { z } from "zod";

/**
 * Validation des Recettes
 */

export const schemas = {
    create: z.object({
    title: z
        .string()
        .trim()
        .min(3, "Le titre doit contenir au moins 3 caractères")
        .max(255, "Le titre ne peut pas dépasser 255 caractères"),

    description: z
        .string()
        .trim()
        .min(10, "La description doit contenir au moins 10 caractères"),

    preparation_time: z
        .number()
        .int("Le temps doit être un entier")
        .positive("Le temps doit être positif"),

    servings: z
        .number()
        .int("Le nombre de portions doit être un entier")
        .positive("Le nombre de portions doit être positif"),

    difficulty: z.enum(["facile", "moyen", "difficile"], {
        errorMap: () => ({ message: "Difficulté invalide" }),
    }),

    picture: z.url("URL invalide").optional().or(z.literal("")),

    type_diet: z.boolean().default(false),

    diet_religious: z.boolean().default(false),

    type_flavor: z.boolean().default(false),
    }),

    update: z.object({
    title: z.string().trim().min(3).max(255),
    description: z.string().trim().min(10),
    preparation_time: z.number().int().positive(),
    servings: z.number().int().positive(),
    difficulty: z.enum(["easy", "medium", "hard"]),
    picture: z.url().optional().or(z.literal("")),
    type_diet: z.boolean().default(false),
    diet_religious: z.boolean().default(false),
    type_flavor: z.boolean().default(false),
    }),
};