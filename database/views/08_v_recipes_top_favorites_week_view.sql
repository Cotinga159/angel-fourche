-- Vue des recettes les plus mises en favoris cette semaine
CREATE OR REPLACE VIEW v_recipes_top_favorites_week AS
SELECT 
    r.id_recipe,
    r.title,
    r.picture,
    r.difficulty,
    COUNT(f.user_id) AS favorites_count
FROM recipes r
JOIN favorites f ON r.id_recipe = f.recipe_id
WHERE f.created_at >= NOW() - INTERVAL '7 days'
GROUP BY r.id_recipe
ORDER BY favorites_count DESC;