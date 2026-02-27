CREATE OR REPLACE VIEW v_user_profile_stats AS
SELECT
    u.id_user,
    u.name_user,
    u.email,
    u.role_name,
    u.created_at,
    COUNT(DISTINCT r.id_recipe) AS recipes_count,
    COUNT(DISTINCT c.id_comment) AS comments_count,
    COUNT(DISTINCT f.recipe_id) AS favorites_count
FROM users u
LEFT JOIN recipes r
    ON u.id_user = r.user_id
LEFT JOIN comments c
    ON u.id_user = r.user_id
LEFT JOIN favorites f
    ON u.id_user = f.user_id
GROUP BY u.id_user;