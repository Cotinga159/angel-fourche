"use strict";

import RecipeRepository from "../repositories/PgRecipeRepository.js";
import RecipeService from "../services/RecipeService.js";

class HomeController {

    /**
     * Page d'accueil
     */
    async home(req, res) {
    try {
        const [topFavorites, topRated, topByCategory] = await Promise.all([
            RecipeService.getTopFavoritesWeek(),
            RecipeService.getTopRated(),
            RecipeService.getTopByCategory(),
        ]);

        res.render("pages/home", {
            title: "Angel Fourche – Un lieu de partage",
            user: req.session.userId ?? null,
            topFavorites,
            topRated,
            topByCategory,
        });
    } catch (error) {
        console.error("Erreur HomeController.home:", error);
        res.status(500).send("Erreur serveur");
    }
}
    
}

export default new HomeController();