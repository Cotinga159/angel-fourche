CREATE OR REPLACE VIEW v_recipes_top_rated AS
SELECT 
    r.id_recipe,
    r.title,
    r.picture,
    r.difficulty,
    ROUND(AVG(ra.score), 1) AS average_rating,
    COUNT(ra.id_rating) AS ratings_count
FROM recipes r
JOIN ratings ra ON r.id_recipe = ra.recipe_id
GROUP BY r.id_recipe
ORDER BY average_rating DESC;