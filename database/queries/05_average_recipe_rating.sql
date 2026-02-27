SELECT
    r.title,
    ROUND(AVG(rt.score), 2) AS average_rating,
    COUNT(rt.id_rating) AS total_votes
FROM recipes AS r
LEFT JOIN ratings as rt
    ON r.id_recipe = rt.recipe_id
GROUP BY r.id_recipe
ORDER BY average_rating DESC NULLS LAST;
