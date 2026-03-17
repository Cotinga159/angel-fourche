SET CLIENT_ENCODING TO 'UTF8';

CREATE TABLE IF NOT EXISTS recipes (
    id_recipe UUID DEFAULT uuidv7() PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES users (id_user) ON DELETE CASCADE,
    category_id UUID NOT NULL REFERENCES categories (id_category) ON DELETE SET NULL,
    title CITEXT NOT NULL,
    description TEXT NOT NULL,
    ingredient JSONB NOT NULL,
    step JSONB NOT NULL,
    preparation_time INTEGER,
    serving INTEGER,
    difficulty VARCHAR(20) CHECK (difficulty IN ('Facile', 'Moyen', 'Difficile')),
    picture VARCHAR(255),
    type_diet VARCHAR(20),
    diet_religious VARCHAR(20),
    type_flavor VARCHAR(20),
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ
);

-- Documentation table recipes
COMMENT ON TABLE recipes IS 'Recettes partagées par les utilisateurs, incluant ingrédients, étapes, temps, difficulté, type de régime, régime religieux et type de saveur';
COMMENT ON COLUMN recipes.id_recipe IS 'Identifiant unique de la recette (UUID v7)';
COMMENT ON COLUMN recipes.user_id IS 'Référence vers l utilisateur auteur de la recette';
COMMENT ON COLUMN recipes.category_id IS 'Référence vers la catégorie de la recette';
COMMENT ON COLUMN recipes.title IS 'Titre de la recette, insensible à la casse via CITEXT';
COMMENT ON COLUMN recipes.description IS 'Description générale de la recette';
COMMENT ON COLUMN recipes.ingredient IS 'Liste des ingrédients avec quantité et unité (format JSONB)';
COMMENT ON COLUMN recipes.step IS 'Liste des étapes numérotées pour réaliser la recette (format JSONB)';
COMMENT ON COLUMN recipes.preparation_time IS 'Durée de préparation en minutes';
COMMENT ON COLUMN recipes.serving IS 'Nombre de personnes prévues pour la recette';
COMMENT ON COLUMN recipes.difficulty IS 'Niveau de difficulté : Facile, Moyen ou Difficile';
COMMENT ON COLUMN recipes.picture IS 'URL ou chemin de l image associée à la recette';
COMMENT ON COLUMN recipes.type_diet IS 'Type de régime alimentaire : omnivore, vegetarien, vegan, pescetarien...';
COMMENT ON COLUMN recipes.diet_religious IS 'Régime religieux : halal, casher ou aucun';
COMMENT ON COLUMN recipes.type_flavor IS 'Type de saveur : sucré, salé ou amer';
COMMENT ON COLUMN recipes.created_at IS 'Date et heure de création de la recette (TIMESTAMPTZ)';
COMMENT ON COLUMN recipes.updated_at IS 'Date et heure de dernière modification de la recette (TIMESTAMPTZ)';

-- Application du trigger
CREATE TRIGGER set_timestamp_tags BEFORE UPDATE ON recipes FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();
