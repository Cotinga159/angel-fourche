"use strict";

import { z } from "zod";

/**
 * Schéma pour créer un commentaire
 */
export const createCommentSchema = z.object({
    userId: z.string().uuid({ message: "Identifiant utilisateur invalide" }),
    recipeId: z.string().uuid({ message: "Identifiant recette invalide" }),
    content: z.string().min(1, "Le commentaire ne peut pas être vide").max(2000, "Le commentaire est trop long"),
});

/**
 * Schéma pour mettre à jour un commentaire
 * - ici le contenu seulement est modifiable
 */
export const updateCommentSchema = z.object({
    content: z.string().min(1, "Le commentaire ne peut pas être vide").max(2000, "Le commentaire est trop long"),
});

/* ---------- Helpers exportés ---------- */
export const schemas = {
    create: createCommentSchema,
    update: updateCommentSchema,
};