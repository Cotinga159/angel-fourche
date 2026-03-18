CREATE OR REPLACE VIEW v_recipes_top_by_category AS
SELECT DISTINCT ON (r.category_id)
    r.id_recipe,
    r.title,
    r.picture,
    r.difficulty,
    c.name_category,
    ROUND(AVG(ra.score), 1) AS average_rating
FROM recipes r
JOIN categories c ON r.category_id = c.id_category
LEFT JOIN ratings ra ON r.id_recipe = ra.recipe_id
GROUP BY r.id_recipe, c.name_category
ORDER BY r.category_id, average_rating DESC NULLS LAST;