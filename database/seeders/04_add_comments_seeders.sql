TRUNCATE TABLE comments CASCADE;

SET CLIENT_ENCODING TO 'UTF8';

INSERT INTO 
comments (id_comment, user_id, recipe_id, content)
VALUES (
    'ef51bf0c-0985-4d84-ba02-e89c3f864acd',
    'db937cac-d99d-4b0d-bd4b-6e23438589ba',
    'e798f2a7-af70-4c6c-b165-d1d83e85b25c',
    'C est trop sucrée, je ne recommanderai pas.'
)