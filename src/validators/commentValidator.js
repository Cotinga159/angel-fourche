"use strict";

import { z } from "zod";

/**
 * Validation des commentaires
 */

export const schemas = {
    create: z.object({
    recipe_id: z.uuid("Identifiant de recette invalide"),

    content: z
        .string()
        .trim()
        .min(1, "Le commentaire ne peut pas être vide")
        .max(1000, "Le commentaire est trop long"),
    }),

    update: z.object({
    content: z
        .string()
        .trim()
        .min(1, "Le commentaire ne peut pas être vide")
        .max(1000, "Le commentaire est trop long"),
    }),
};