SET CLIENT_ENCODING TO 'UTF8';

CREATE TABLE IF NOT EXISTS categories (
    id_category UUID DEFAULT uuidv7() PRIMARY KEY,
    name_category CITEXT UNIQUE NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
)

-- Documentation
COMMENT ON TABLE categories IS 'Mots-clés créés par l admin permettant de rangé les recettes en différent groupe';
COMMENT ON COLUMN categories.name_category IS 'Non de la catégorie';

-- Application du trigger
CREATE TRIGGER set_timestamp_tags BEFORE UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();