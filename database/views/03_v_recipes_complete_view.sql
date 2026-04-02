
-- Vue avec auteur, catégorie et note moyenne

CREATE OR REPLACE VIEW v_recipes_complete AS
SELECT 
    r.id_recipe,
    r.user_id,
    r.category_id,
    r.title,
    r.description,
    r.ingredient,
    r.step,
    r.preparation_time,
    r.serving,
    r.difficulty,
    r.picture,
    r.type_flavor,
    r.type_diet,
    r.diet_religious,
    r.created_at,
    r.updated_at,
    c.name_category AS category_name,
    u.name_user AS user_pseudo,
    round(avg(rt.score), 2) AS average_rating,
    count(DISTINCT rt.id_rating) AS ratings_count,
    count(DISTINCT cm.id_comment) AS comments_count,
    count(DISTINCT f.user_id) AS favorites_count
FROM recipes r
LEFT JOIN categories c ON r.category_id = c.id_category
LEFT JOIN users u ON r.user_id = u.id_user
LEFT JOIN ratings rt ON r.id_recipe = rt.recipe_id
LEFT JOIN comments cm ON r.id_recipe = cm.recipe_id
LEFT JOIN favorites f ON r.id_recipe = f.recipe_id
GROUP BY r.id_recipe, c.name_category, u.name_user;