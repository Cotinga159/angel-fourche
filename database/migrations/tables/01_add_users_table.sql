SET CLIENT_ENCODING TO 'UTF8';

CREATE TABLE IF NOT EXISTS users (
    id_user UUID DEFAULT uuidv7 () PRIMARY KEY,
    email CITEXT UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    name_user CITEXT UNIQUE NOT NULL,
    role_name role_enum NOT NULL DEFAULT 'member',
    gdpr_consent BOOLEAN NOT NULL DEFAULT FALSE,
    gdpr_consent_date TIMESTAMPTZ,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ,
    CONSTRAINT chk_email_is_valid CHECK ( -- Contraintes métier
        email ~ '^[^@]+@[^@.]+\.[^@]+$'
    )
);

-- Documentation
COMMENT ON TABLE users IS 'Stocke les informations d identification et les préférences des utilisateurs (RGPD compliant)';

COMMENT ON COLUMN users.gdpr_consent IS 'Consentement RGPD obligatoire pour créer un compte';

COMMENT ON COLUMN users.gdpr_consent_date IS 'Date et heure précises du consentement RGPD';

-- Application du trigger
CREATE TRIGGER set_timestamp_users BEFORE UPDATE ON users FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();