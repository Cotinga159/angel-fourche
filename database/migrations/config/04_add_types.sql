SET CLIENT_ENCODING TO 'UTF8';

CREATE TYPE role_enum AS ENUM(
    'admin',
    'member'
);

COMMENT ON TYPE role_enum IS 'Rôles des utilisateurs pour la gestion des droits Access Controle level (ACL)';

