"use strict";

import AuthService from "../../services/AuthService.js";

/**
 * AuthController
 *
 * Gestion HTTP de l'authentification
 *
 * @see docs/user-stories.md#auth
 */
class AuthController {
    /**
   * Affiche la page d'inscription
   */
    async showRegister(req, res) {
    if (req.session.userId) {
        return res.redirect("/recipes");
    }

    res.render("pages/auth/register", {
        title: "Inscription - Angel Fourche",
        csrfToken: req.csrfToken(),
    });
    }

    /**
   * Traite l'inscription
   */
    async handleRegister(req, res) {
    try {
        await AuthService.register(req.body);
        // console.log("🔥 REGISTER HIT", req.body);

        req.flash("success", "Compte créé avec succès ✅");
        res.redirect("/auth/login");
    } catch (error) {
        req.flash("error", error.message);
        res.redirect("/auth/register");
    }   
    }

    /**
   * Affiche la page de connexion
   */
    async showLogin(req, res) {
    if (req.session.userId) {
        return res.redirect("/recipes");
    }

    res.render("pages/auth/login", {
        title: "Connexion - Angel Fourche",
        csrfToken: req.csrfToken(),
    });
    }

    /**
   * Traite la connexion
   */
    async handleLogin(req, res) {
    try {
        const user = await AuthService.login(req.body);

        req.session.userId = user.id;
        req.flash("success", `Bienvenue ${user.pseudo} 👋`);

        res.redirect("/recipes");
    } catch (error) {
        req.flash("error", error.message);
        res.redirect("/auth/login");
    }
    }

    /**
   * Déconnexion
   */
    async logout(req, res) {
    req.session.destroy(() => {
        res.redirect("/auth/login");
    });
    }
}

export default new AuthController();