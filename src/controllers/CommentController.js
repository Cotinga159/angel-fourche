"use strict";

import CommentService from "../services/CommentService.js";

class CommentController {

    /**
   * Crée un commentaire pour une recette
   */
    async create(req, res) {
    try {
        const { recipeId, content } = req.body;
        const userId = req.session.userId;

        if (!userId) {
        req.flash("error", "Vous devez être connecté pour commenter");
        return res.redirect("/auth/login");
        }

        await CommentService.addComment({ userId, recipeId, content });

        req.flash("success", "Commentaire ajouté");
        res.redirect(`/recipes/${recipeId}`);

    } catch (error) {
        req.flash("error", error.message);
        res.redirect("back");
    }
    }

    /**
   * Supprime un commentaire
   */
    async delete(req, res) {
    try {
        const { id } = req.params;
        const userId = req.session.userId;

        await CommentService.deleteComment(id, userId);

        req.flash("success", "Commentaire supprimé");
        res.redirect("back");

    } catch (error) {
        req.flash("error", error.message);
        res.redirect("back");
    }
    }
}

export default new CommentController();