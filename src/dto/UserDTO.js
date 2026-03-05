"use strict";

import UserService from "../services/UserService.js";
import { UserDTO } from "../dto/UserDTO.js";

class UserController {

    /**
   * Liste des utilisateurs (admin)
   */
    async index(req, res) {
    const users = await UserService.getAll();

    res.render("pages/users/index", {
        title: "Utilisateurs",
        users: users.map(UserDTO.profile),
    });
    }

    /**
   * Détail utilisateur (admin)
   */
    async show(req, res) {
    const user = await UserService.getById(req.params.id);

    if (!user) {
        return res.status(404).render("pages/errors/404");
    }

    res.render("pages/users/show", {
        title: user.nameUser,
        user: UserDTO.profile(user),
    });
    }
}

export default new UserController();