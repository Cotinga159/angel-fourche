-- ============================================================================
-- ANGEL-FOURCHE - Base de données principale
-- Version: 1.0.0
-- Date: 2026-02-24
-- Description: Partage de recettes
-- ============================================================================

-- ============================================================================
-- TODO ÉTAPE 1 (DCL/DDL) : CRÉATION DE LA BASE DE DONNÉES (à exécuter avec le rôle postgres)
-- ============================================================================

-- Création de la base avec support UTF8 complet

CREATE DATABASE angel_fourche_db_dev
WITH ENCODING = 'UTF8';

COMMENT ON DATABASE angel_fourche_db_dev IS 'Base de donnée principales du projet Angel-Fourche'