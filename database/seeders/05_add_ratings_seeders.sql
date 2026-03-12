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
),
(
    'f1a2b3c4-d5e6-7890-fabc-111111111111',
    'db937cac-d99d-4b0d-bd4b-6e23438589ba',
    'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
    '3'
),
(
    'f1a2b3c4-d5e6-7890-fabc-222222222222',
    'db937cac-d99d-4b0d-bd4b-6e23438589ba',
    'b2c3d4e5-f6a7-8901-bcde-f12345678901',
    '4'
),
(
    'f1a2b3c4-d5e6-7890-fabc-333333333333',
    'db937cac-d99d-4b0d-bd4b-6e23438589ba',
    'c3d4e5f6-a7b8-9012-cdef-123456789012',
    '2'
),
(
    'f1a2b3c4-d5e6-7890-fabc-444444444444',
    'db937cac-d99d-4b0d-bd4b-6e23438589ba',
    'd4e5f6a7-b8c9-0123-defa-234567890123',
    '4'
),
(
    'f1a2b3c4-d5e6-7890-fabc-555555555555',
    'db937cac-d99d-4b0d-bd4b-6e23438589ba',
    'e5f6a7b8-c9d0-1234-efab-345678901234',
    '5'
);