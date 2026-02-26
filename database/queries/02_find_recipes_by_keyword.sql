SELECT
    title,
    description,
    type_flavor,
    type_diet,
    diet_religious,
    difficulty
FROM recipes
WHERE
    ($1 IS NULL OR type_flavor = $1)
AND ($2 IS NULL OR type_diet = $2)
AND ($3 IS NULL OR diet_religious = $3)
AND ($4 IS NULL OR difficulty = $4)
ORDER BY created_at