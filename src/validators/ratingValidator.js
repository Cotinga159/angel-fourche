"use strict";

import { z } from "zod";

/**
 * Validation des notes
 */

export const schemas = {
    create: z.object({
    recipe_id: z.uuid("Identifiant de recette invalide"),

    score: z
        .number()
        .int("La note doit être un entier")
        .min(1, "La note minimum est 1")
        .max(5, "La note maximum est 5"),
    }),

    update: z.object({
    score: z
        .number()
        .int()
        .min(1, "La note minimum est 1")
        .max(5, "La note maximum est 5"),
    }),
};