SET CLIENT_ENCODING TO 'UTF8';
CREATE TABLE IF NOT EXISTS ratings (
    id_rating UUID DEFAULT uuidv7() PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES users (id_user) ON DELETE CASCADE,
    recipe_id UUID NOT NULL REFERENCES recipes (id_recipe) ON DELETE CASCADE,
    score INTEGER NOT NULL CHECK (score BETWEEN 1 AND 5),
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE ratings IS 'Notes attribuées par les utilisateurs aux recettes';
COMMENT ON COLUMN ratings.id_rating IS 'Identifiant unique de la note (UUID v7)';
COMMENT ON COLUMN ratings.score IS 'Score de la recette, entier entre 1 et 5';
COMMENT ON COLUMN ratings.user_id IS 'Référence vers l utilisateur auteur de la note';
COMMENT ON COLUMN ratings.recipe_id IS 'Référence vers la recette notée';
COMMENT ON COLUMN ratings.created_at IS 'Date et heure de création de la note';

-- Application du trigger
CREATE TRIGGER set_timestamp_tags BEFORE UPDATE ON ratings FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();