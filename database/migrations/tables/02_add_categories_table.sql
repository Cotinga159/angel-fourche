SET CLIENT_ENCODING TO 'UTF8';

CREATE TABLE IF NOT EXISTS categories (
    id_category UUID DEFAULT uuidv7() PRIMARY KEY,
    name_category CITEXT UNIQUE NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Documentation
COMMENT ON TABLE categories IS 'Mots-cles crees par l admin permettant de range les recettes en different groupe';
COMMENT ON COLUMN categories.name_category IS 'Non de la categorie';

-- Application du trigger
CREATE TRIGGER set_timestamp_tags BEFORE UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();