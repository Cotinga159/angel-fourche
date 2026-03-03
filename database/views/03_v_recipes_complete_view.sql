
-- Vue avec auteur, catégorie et note moyenne

CREATE OR REPLACE VIEW v_recipes_complete AS
SELECT
    r.id_recipe,
    r.title,
    r.description,
    r.difficulty,
    r.type_flavor,
    r.type_diet,
    r.diet_religious,
    r.created_at,

    c.name_category AS category,

    u.name_user AS author,

    ROUND(AVG(rt.score), 2) AS average_rating,
    COUNT(rt.id_rating) AS ratings_count

FROM recipes r
LEFT JOIN categories c
    ON r.category_id = c.id_category
LEFT JOIN users u
    ON r.user_id = u.id_user
LEFT JOIN ratings rt
    ON r.id_recipe = rt.recipe_id

GROUP BY
    r.id_recipe,
    c.name_category,
    u.name_user;