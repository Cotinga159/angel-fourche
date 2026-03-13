"use strict";

import AuthService from "../../services/AuthService.js";
import { generateToken } from "../../config/security.js";

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
        // csrfToken:generateToken(req, res),
    });
    }

    /**
   * Traite l'inscription
   */
    async handleRegister(req, res) {

    try {
        await AuthService.register(req.body);

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
        // csrfToken: generateToken(req, res),
    });
    }

    /**
   * Traite la connexion
   */
    async handleLogin(req, res) {
    try {
        const user = await AuthService.login(req.body);
        req.session.userId = user.id;
        req.session.email = user.email;
        req.session.pseudo = user.pseudo;
        req.session.roleName = user.role;
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