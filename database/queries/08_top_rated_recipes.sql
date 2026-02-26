SELECT
    r.id_recipe,
    r.title,
    r.difficulty,
    ROUND(AVG(rt.score), 2) AS moyenne_note,
    COUNT(rt.id_rating) AS nombre_votes
FROM recipes r
LEFT JOIN ratings rt 
    ON r.id_recipe = n.id_recipe
GROUP BY r.id_recipe
ORDER BY moyenne_note DESC NULLS LAST;

