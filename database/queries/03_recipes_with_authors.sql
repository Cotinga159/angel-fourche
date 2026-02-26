SELECT
    r.title,
    r.difficulty,
    u.name_user AS author
FROM recipes AS r
INNER JOIN users AS u
    ON r.user_id = u.id_user;