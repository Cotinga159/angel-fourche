CREATE OR REPLACE VIEW v_recipes_search AS
SELECT
    r.id_recipe,
    r.title,
    r.description,
    r.type_flavor,
    r.type_diet,
    r.diet_religious,
    r.difficulty,
    r.created_at
From recipes r;