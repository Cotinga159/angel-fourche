"use strict";

import CategoryService from "../services/CategoryService.js";

class CategoryController {

    /**
   * Afficher une catégorie
   */
    async show(req, res) {
    const category = await CategoryService.getById(req.params.id);

    if (!category) {
        return res.status(404).render("pages/errors/404");
    }

    res.render("pages/categories/show", {
        title: category.nameCategory,
        category,
    });
    }

    /**
   * Ajouter une catégorie
   */
    async create(req, res) {
    try {
        const { nameCategory } = req.body;

        await CategoryService.add(nameCategory);

        req.flash("success", "Catégorie créée avec succès");
        res.redirect("/categories");

    } catch (error) {
        req.flash("error", error.message);
        res.redirect("/categories");
    }
    }

    /**
   * Supprimer une catégorie
   */
    async delete(req, res) {
    try {
        const { id } = req.params;

        await CategoryService.deleteCategory(id);

        req.flash("success", "Catégorie supprimée");
        res.redirect("/categories");

    } catch (error) {
        req.flash("error", error.message);
        res.redirect("/categories");
    }
    }
}

export default new CategoryController();