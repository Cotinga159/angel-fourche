SET CLIENT_ENCODING TO 'UTF8';

CREATE TABLE IF NOT EXISTS comments (
    id_comment UUID DEFAULT uuidv7() PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES users (id_user) ON DELETE CASCADE,
    recipe_id UUID NOT NULL REFERENCES recipes (id_recipe) ON DELETE CASCADE,
    content TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Application du trigger
CREATE TRIGGER set_timestamp_tags BEFORE UPDATE ON comments FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();