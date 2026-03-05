"use strict";

import { z } from "zod";

/**
 * Schéma pour créer ou mettre à jour une catégorie
 */
export const categorySchema = z.object({
    name: z
    .string()
    .min(1, { message: "Le nom de la catégorie ne peut pas être vide" })
    .max(50, { message: "Le nom de la catégorie est trop long" }),
});

/* ---------- Helpers exportés ---------- */
export const schemas = {
    create: categorySchema,
    update: categorySchema,
};