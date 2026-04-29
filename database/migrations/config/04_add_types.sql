SET CLIENT_ENCODING TO 'UTF8';

DO $$ BEGIN
    CREATE TYPE role_enum AS ENUM('admin', 'member');
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

COMMENT ON TYPE role_enum IS 'Rôles des utilisateurs pour la gestion des droits Access Controle level (ACL)';

