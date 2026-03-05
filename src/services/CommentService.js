"use strict";
import CommentRepository from "../repositories/PgCommentRepository.js";

class CommentService {

    // Récupérer un commentaire par ID
    static async getById(commentId) {
        return CommentRepository.findById(commentId);
    }

    // Créer un commentaire
    static async add(userId, recipeId, content) {
        if (!content || content.trim() === "") {
            throw new Error("Le contenu ne peut pas être vide");
        }
        return CommentRepository.create({
            userId,
            recipeId,
            content: content.trim(),
        });
    }

    // Supprimer un commentaire par ID
    static async delete(commentId) {
        return CommentRepository.delete(commentId);
    }

    // Supprimer tous les commentaires liés à une recette
    static async deleteByRecipe(recipeId) {
        return CommentRepository.deleteByRecipe(recipeId);
    }

    // Compter les commentaires d'une recette
    static async countByRecipe(recipeId) {
        return CommentRepository.countByRecipeId(recipeId);
    }
}

export default CommentService;