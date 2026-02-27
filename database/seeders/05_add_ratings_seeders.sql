TRUNCATE TABLE ratings CASCADE;

SET CLIENT_ENCODING TO 'UTF8';

INSERT INTO ratings (
    id_rating,
    user_id,
    recipe_id,
    score
) VALUES
(
    '342fc797-2d6b-4103-b0a2-9ab248ba16d8',
    'db937cac-d99d-4b0d-bd4b-6e23438589ba',
    'e798f2a7-af70-4c6c-b165-d1d83e85b25c',
    '1'
)