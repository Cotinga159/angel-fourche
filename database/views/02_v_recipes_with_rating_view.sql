CREATE OR REPLACE VIEW v_recipes_with_rating AS
SELECT
    r.id_recipe,
    r.title,
    r.difficulty,
    r.type_flavor,
    r.type_diet,
    r.diet_religious,
    r.created_at,
    ROUND(AVG(n.score), 2) AS average_rating,
    COUNT(rt.id_rating) AS ratings_count
FROM recipes r
LEFT JOIN ratings rt
    ON r.id_recipe = rt.recipe_id
GROUP BY r.id_recipe