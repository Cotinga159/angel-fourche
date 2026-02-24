-- Active: 1768295290553@@127.0.0.1@5432@angel_fourche_db_dev

-- ============================================================================
--  TODO ÉTAPE 3-A : EXTENSIONS (à exécuter avec le rôle postgres)
-- ============================================================================

-- Extensions modernes PostgreSQL

CREATE EXTENSION IF NOT EXISTS "citext";
CREATE EXTENSION IF NOT EXISTS "pg_trgm";
CREATE EXTENSION IF NOT EXISTS "btree_gin";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";
