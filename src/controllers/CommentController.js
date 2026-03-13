"use strict";

import CommentService from "../services/CommentService.js";

class CommentController {

    /**
   * Crée un commentaire pour une recette
   */
    async create(req, res) {
    try {
        const recipeId = req.params.recipeId;
        const { content } = req.body;
        const userId = req.session.userId;

        if (!userId) {
        req.flash("error", "Vous devez être connecté pour commenter");
        return res.redirect("/auth/login");
        }

        await CommentService.addComment( userId, recipeId, content );

        req.flash("success", "Commentaire ajouté");
        res.redirect(`/recipes/${recipeId}`);

    } catch (error) {
        req.flash("error", error.message);
        res.redirect(`/recipes/${recipeId}`);
    }
    }

    /**
   * Supprime un commentaire
   */
    async delete(req, res) {
    try {
        const { commentId } = req.params;
        const recipeId = req.body.recipeId;
        const userId = req.session.userId;

        await CommentService.deleteComment(commentId, userId);

        req.flash("success", "Commentaire supprimé");
        res.redirect(`/recipes/${recipeId}`);

    } catch (error) {
        req.flash("error", error.message);
        res.redirect("/recipes");
    }
    }
}

export default new CommentController();