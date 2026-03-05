"use strict";

import UserRepository from "../repositories/PgUserRepository.js";
import RecipeRepository from "../repositories/PgRecipeRepository.js";
import CommentRepository from "../repositories/PgCommentRepository.js";


/**
 * Service pour exporter les données d’un utilisateur (RGPD / profil)
 */
class UserExportService {
    static async export(userId) {
        const [user, recipes, comments] = await Promise.all([
        UserRepository.findById(userId),
        RecipeRepository.findByUserId(userId),
        CommentRepository.findByUserId(userId),
        ]);

        if (!user) return null;

        return {
        user: user.toJSON(),
        recipes,
        comments,
        exportDate: new Date().toISOString(),
        };
    }
    }

export default UserExportService;