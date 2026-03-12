"use strict";

import { Router } from "express";

// 🌍 Public
import homeRoutes from "./public/homeController.js"; // Page d'accueil et autres pages publiques
import recipeRoutes from "./public/recipeRoutes.js"; // Routes pour les recettes accessibles au public

// 🔐 Auth & compte
import authRoutes from "./public/authRoutes.js"; // Routes d'authentification (connexion, inscription)
import profileRoutes from "./user/profileRoutes.js"; // Routes pour l'édition du profil utilisateur

// 📦 Métier (User)
import recipeUserRoutes from "./user/recipeRoutes.js"; // Routes pour les recettes de l'utilisateur (ajouter, modifier, supprimer)
import commentUserRoutes from "./user/commentRoutes.js"; // Routes pour les commentaires de l'utilisateur (ajouter, supprimer)
import ratingRoutes from "./user/ratingRoutes.js"; // Routes pour la gestion des évaluations (notes) des recettes

// 📊 Admin
import recipeAdminRoutes from "./admin/recipeRoutes.js"; // Routes pour la gestion des recettes par l'admin
import commentAdminRoutes from "./admin/commentRoutes.js"; // Routes pour la gestion des commentaires par l'admin
import categoryAdminRoutes from "./admin/categoryRoutes.js"; // Routes pour la gestion des catégories par l'admin

const router = Router();

/**
 * Router principal de l'application
 *
 * Ce fichier :
 * - centralise toutes les routes
 * - définit les zones (public / auth / user / admin)
 * - ne contient AUCUNE logique métier
 */

// ==================
// 🌍 ROUTES PUBLIQUES
// ==================
router.use(homeRoutes); // Page d'accueil
router.use(recipeRoutes); // Routes pour les recettes visibles au public

// ==================
// 🔐 AUTHENTIFICATION
// ==================
router.use(authRoutes); // Routes d'authentification (connexion, inscription)
router.use(profileRoutes); // Routes pour gérer les profils utilisateurs

// ==================
// 📦 MÉTIER (Utilisateur)
// ==================
router.use(recipeUserRoutes); // Routes pour la gestion des recettes des utilisateurs
router.use("/comments", commentUserRoutes); // Routes pour la gestion des commentaires des utilisateurs
router.use(ratingRoutes); // Routes pour les évaluations des recettes

// ==================
// 📊 ADMIN
// ==================
router.use("/admin/recipes", recipeAdminRoutes); // Routes pour l'admin - gestion des recettes
router.use("/admin/comments", commentAdminRoutes); // Routes pour l'admin - gestion des commentaires
router.use("/admin/categories", categoryAdminRoutes); // Routes pour l'admin - gestion des catégories

export default router;