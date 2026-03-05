"use strict";

import { z } from "zod";

/** Temps de préparation et nombre de portions */
const positiveInt = z.number().int().positive();

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
 * Schéma de création de recette
 */
export const createRecipeSchema = z.object({
    userId: z.string().uuid(),
    categoryId: z.string().uuid(),
    title: z.string().min(3, "Le titre est trop court").max(255, "Le titre est trop long"),
    description: z.string().min(5, "La description est trop courte").max(5000),
    ingredient: z.array(z.any()).min(1, "Il faut au moins un ingrédient"),
    step: z.array(z.any()).min(1, "Il faut au moins une étape"),
    preparationTime: positiveInt,
    serving: positiveInt,
    difficulty: z.enum(["easy", "medium", "hard"]),
    picture: z.string().url().optional(),
    typeDiet: stringToBoolean,
    dietReligious: stringToBoolean,
    typeFlavor: stringToBoolean,
});

/**
 * Schéma de mise à jour de recette
 * - toutes les valeurs sont optionnelles
 */
export const updateRecipeSchema = createRecipeSchema.partial();

/* ---------- Helpers exportés ---------- */
export const schemas = {
    create: createRecipeSchema,
    update: updateRecipeSchema,
};