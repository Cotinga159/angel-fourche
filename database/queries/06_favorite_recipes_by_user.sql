SELECT
    u.name_user,
    r.title
FROM favorites AS f
JOIN users AS u
    ON f.user_id = u.id_user
JOIN recipes AS r
    ON f.recipe_id = r.id_recipe
ORDER BY u.name_user;

