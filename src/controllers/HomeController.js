"use strict";

class HomeController {

    /**
   *  Page d'accueil
   */
    async home(req, res) {
    res.render("pages/home", {
        title: "Angel Fourche – Un lieu de partage",
        user: req.session.userId ?? null,
    });
    }
}

export default new HomeController()
