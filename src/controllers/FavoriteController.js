"use strict";
import FavoriteService from "../services/FavoriteService.js";

class FavoriteController {
    async toggle(req, res) {
    try {
        const userId = req.session.userId;
        const { recipeId } = req.params;
        const added = await FavoriteService.toggle(userId, recipeId);
        
        // Si requête fetch, retourner JSON
        if (req.headers['content-type'] === 'application/json' || 
            req.headers['accept'] === 'application/json') {
            return res.json({ success: true, isFavorite: added });
        }
        
        res.redirect(req.body.redirectTo || `/recipes/${recipeId}`);
    } catch (error) {
        req.flash("error", error.message);
        res.redirect(`/recipes/${req.params.recipeId}`);
    }
}
}

export default new FavoriteController();