"use strict";

import { z } from "zod";

/**
 * Validation des Recettes
 */

// .coerce convertie les number en string

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

    preparationTime: z.coerce
        .number()
        .int("Le temps doit être un entier")
        .positive("Le temps doit être positif"),

    serving: z.coerce
        .number()
        .int("Le nombre de portions doit être un entier")
        .positive("Le nombre de portions doit être positif"),

    difficulty: z.enum(["Facile", "Moyen", "Difficile"], {
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
    preparationTime: z.coerce.number().int().positive(),
    serving: z.coerce.number().int().positive(),
    difficulty: z.enum(["Facile", "Moyen", "Difficile"]),
    picture: z.url().optional().or(z.literal("")),
    typeDiet: z.boolean().default(false),
    dietReligious: z.boolean().default(false),
    typeFlavor: z.boolean().default(false),
    }),
};