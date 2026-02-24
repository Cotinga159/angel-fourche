📘 Cahier des Charges
Plateforme de Partage de Recettes de Cuisine
1. Présentation du projet
1.1 Contexte

Dans le cadre d’un stage, il est demandé de développer une plateforme web et mobileL permettant aux utilisateurs de partager et découvrir des recettes de cuisine.

J’ai décidé de créer Angel-Fourche afin d’offrir une plateforme dédiée au partage de recettes de cuisine.

L’objectif est de permettre aux passionnés de cuisine de transmettre leurs recettes, qu’elles soient récentes, traditionnelles ou transmises de génération en génération.

Ce projet vise à valoriser le patrimoine culinaire familial et à créer un espace d’échange convivial où chacun peut découvrir, partager et préserver des recettes authentiques.

1.2 Objectif

Développer une application permettant :

- La création de comptes utilisateurs

- La publication de recettes

- La consultation et la recherche de recettes

- L’interaction via commentaires et évaluations

Le projet n’a pas vocation à être commercialisé. Il s’agit d’un prototype fonctionnel.

2. Description générale
2.1 Public cible

- Étudiants

- Amateurs de cuisine

- Toute personne souhaitant partager ou découvrir des recettes

2.2 Périmètre du projet

Le projet comprend :

- Un site web responsive

- Une base de données

- Un système d’authentification

- Un espace utilisateur

3. Fonctionnalités principales
3.1 Gestion des utilisateurs

- Inscription

- Connexion / Déconnexion

- Modification du profil

- Suppression du compte

3.2 Gestion des recettes

Un utilisateur connecté peut :

- Ajouter une recette

- Modifier sa recette

- Supprimer sa recette

- Ajouter une image

Renseigner :

- Titre

- Description

- Ingrédients

- Étapes de préparation

- Temps de préparation

- Difficulté

3.3 Consultation des recettes

- Liste des recettes

- Affichage détaillé d’une recette

- Recherche par mot-clé

- Filtrage simple (ex : difficulté)

3.4 Interaction

- Ajouter une recette en favoris

- Commenter une recette

- Noter une recette (sur 5)

4. Exigences fonctionnelles

- L’utilisateur doit pouvoir s’inscrire avec email et mot de passe

- Les recettes doivent être liées à un auteur

- Seul l’auteur peut modifier ou supprimer sa recette

- Les utilisateurs non connectés peuvent consulter les recettes

- Les utilisateurs connectés peuvent interagir

5. Exigences non fonctionnelles
5.1 Performance

- Temps de chargement raisonnable

- Navigation fluide

5.2 Sécurité

- Mots de passe cryptés

- Protection contre accès non autorisé aux données

5.3 Ergonomie

- Interface simple et intuitive

- Design responsive (adapté mobile)

6. Architecture technique (exemple)
Frontend

- HTML / CSS / JavaScript
ou

- React

Backend

- Node.js + Express


Base de données

- PostgreSQL

7. Modélisation des données (simplifiée)


👨‍🦲 Table utilisateurs

 - id_utilisateur

 - nom

 - email

 - mot_de_passe

 - role

 - consentement_rgpd

 - date_consentement

 - date_inscription

 - date_modification


🥗 Table recettes

 - id_recette

 - id_utilisateur

 - id_categorie

 - titre

 - description

 - ingredient

 - etape

 - duree_preparation

 - niveau_difficulte

 - photo

 - date_creation

 - date_modification



💭 Table commentaires

 - id_commentaire

 - id_utilisateur

 - id_recette

 - contenu

 - date_creation



💗 Table pivot faroites

 - id_utilisateur

 - id_recette


🧮 Table categories

 - id_categorie

 - nom

 - date_creation

📋 Table notes

 - id_note

 - score

 - id_utilisateur

 - id_recette

 - date_creation

8. Planning prévisionnel
Phase	Durée estimée

Rédaction cahier des charges             1 semaine

Commencer par la base de données         1 semaine
Schéma conceptuel MLD MCD ...
Création des tables 
Views + jointure de table

MVC
Authentification => google auth ?       2 semaines

front-end                               2 semaines

site quasiment fini 
review de code                          1 semaine
diapositives 
rapport 

On bloc une version                     1 semaine
fonctionnelle de l'application     