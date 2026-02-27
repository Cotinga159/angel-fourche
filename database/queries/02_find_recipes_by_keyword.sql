SELECT
    title,
    description,
    type_flavor,
    type_diet,
    diet_religious,
    difficulty
FROM recipes
WHERE
    ('sucré' IS NULL OR type_flavor = 'sucré')
AND ('vegetarien' IS NULL OR type_diet = 'vegetarien')
AND ('aucun' IS NULL OR diet_religious = 'aucun')
AND ('moyen' IS NULL OR difficulty = 'moyen')
ORDER BY created_at;