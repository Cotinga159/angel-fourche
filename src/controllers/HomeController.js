"use strict";

import RecipeRepository from "../repositories/PgRecipeRepository.js";

class HomeController {

    /**
     * Page d'accueil
     */
    async home(req, res) {
        try {
            // Récupère les 5 dernières recettes avec tous les détails
            const recipes = await RecipeRepository.findAllComplete();
console.log("Recettes reçues :", JSON.stringify(recipes, null, 2));
console.log("Ingredient[0] :", recipes[0]?.ingredient);
console.log("Step[0] :", recipes[0]?.step);
            res.render("pages/home", {
                title: "Angel Fourche – Un lieu de partage",
                user: req.session.userId ?? null,
                recipes, // ← on envoie toutes les recettes au template
            });
        } catch (error) {
            console.error("Erreur HomeController.home:", error);
            res.status(500).send("Erreur serveur");
        }
    }
}

export default new HomeController();