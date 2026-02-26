SELECT
    r.title,
    c.name_category AS categories,
    r.difficulty
FROM recipes AS r
JOIN categories AS c
    ON r.id_category = c.category_id;

