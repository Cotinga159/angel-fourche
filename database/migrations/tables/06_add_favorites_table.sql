SET CLIENT_ENCODING TO 'UTF8';

CREATE TABLE IF NOT EXISTS favorites (
    user_id UUID NOT NULL REFERENCES users(id_user) ON DELETE CASCADE,
    recipe_id UUID NOT NULL REFERENCES recipes(id_recipe) ON DELETE CASCADE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, recipe_id) 
);

COMMENT ON TABLE favorites IS 'Table pivot liant les utilisateurs et leurs recettes favorites';
COMMENT ON COLUMN favorites.user_id IS 'Utilisateur qui a ajouté la recette en favori';
COMMENT ON COLUMN favorites.recipe_id IS 'Recette ajoutée en favori par l utilisateur';