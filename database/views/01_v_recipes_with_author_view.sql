CREATE OR REPLACE VIEW v_recipes_with_author AS
SELECT
    r.id_recipe,
    r.title,
    r.description,
    r.difficulty,
    r.type_flavor,
    r.type_diet,
    r.diet_religious,
    r.created_at,
    u.id_user,
    u.name_user AS author_name,
    u.email AS author_email
FROM recipes r
JOIN users u
    ON r.user_id = u.id_user;