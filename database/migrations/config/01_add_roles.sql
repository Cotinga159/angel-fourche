-- ============================================================================
-- TODO ÉTAPE 2 (DCL) : SÉCURISATION ET RÔLES (à exécuter avec le rôle postgres)
-- ============================================================================

-- Création du rôle applicatif (SANS mot de passe)
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_catalog.pg_roles WHERE rolname = 'app_angel_fourche'
    ) THEN
        CREATE ROLE app_angel_fourche LOGIN;
    END IF;
END
$$;

GRANT CONNECT ON DATABASE angel_fourche_db_dev TO app_angel_fourche;