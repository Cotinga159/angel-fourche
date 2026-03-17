
-- Vue optimisé pour les recherches
DROP VIEW v_recipes_search;
CREATE OR REPLACE VIEW v_recipes_search AS
SELECT
    r.id_recipe,
    r.title,
    r.description,
    r.picture,
    r.type_flavor,
    r.type_diet,
    r.diet_religious,
    r.difficulty,
    r.created_at,
    ROUND(AVG(ra.score), 1) AS average_rating,
    COUNT(ra.id_rating)     AS ratings_count
FROM recipes r
LEFT JOIN ratings ra ON r.id_recipe = ra.recipe_id
GROUP BY r.id_recipe;