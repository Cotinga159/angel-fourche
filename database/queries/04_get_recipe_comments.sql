SELECT
    r.title,
    c.content,
    u.name_user AS auteur_commentaire,
    c.created_at
FROM comments AS c
JOIN recipes AS r
    ON c.recipe_id = r.id_recipe
JOIN users AS u
    ON c.user_id = u.id_user
ORDER BY c.created_at DESC;