CREATE OR REPLACE VIEW v_recipes_favorites AS
SELECT
    f.id_user,
    u.name_user,
    r.id_recipe,
    r.title,
    r.type_flavor,
    r.difficulty
FROM favorites f
JOIN users u 
    ON f.user_id = u.id_user
JOIN recipes r
    ON f.recipe_id = r.id_recipe;