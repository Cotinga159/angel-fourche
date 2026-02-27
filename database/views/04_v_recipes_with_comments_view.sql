CREATE OR REPLACE VIEW v_recipes_with_comments AS
SELECT
    c.id_comment,
    r.id_recipe,
    r.title AS recipe_title,
    u.name_user AS author_comment,
    c.content,
    c.created_at
FROM comments c
JOIN recipes r
    ON c.recipe_id = r.id_recipe
JOIN users u
    ON c.user_id = u.id_user;