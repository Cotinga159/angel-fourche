SELECT
    r.title,
    c.name_category AS categories,
    r.difficulty
FROM recipes AS r
JOIN categories AS c
    ON r.category_id = c.id_category;

