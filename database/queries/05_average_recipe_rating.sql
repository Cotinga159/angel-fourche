SELECT
    r.title
    ROUND(AVG(rt.score), 2) AS note_moyenne,
    COUNT(rt.id_rating) AS nombre_votes
FROM recipes AS r
LEFT JOIN ratings as rt
    ON r.id_recipe = rt.recipe_id
GROUP BY r.id_recipe
ORDER BY note_moyenne DESC NULLS LAST;
