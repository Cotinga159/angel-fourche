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
),
-- Tacos al Pastor
('a1a2b3c4-d5e6-7890-fabc-111111111201', 'cbaacdb3-0798-4235-9272-733e22615f2e', 'f1a2b3c4-d5e6-7890-abcd-ef1234567891', '5'),
('a1a2b3c4-d5e6-7890-fabc-111111111202', 'd31e431c-6f6e-4cc6-861b-6d9095ed5e4e', 'f1a2b3c4-d5e6-7890-abcd-ef1234567891', '4'),
('a1a2b3c4-d5e6-7890-fabc-111111111203', '471cec1e-1b52-4c9e-bd13-8810ee672ef4', 'f1a2b3c4-d5e6-7890-abcd-ef1234567891', '5'),
-- Ramen Tonkotsu
('a1a2b3c4-d5e6-7890-fabc-111111111204', 'db937cac-d99d-4b0d-bd4b-6e23438589ba', 'f2a3b4c5-d6e7-8901-bcde-f12345678902', '5'),
('a1a2b3c4-d5e6-7890-fabc-111111111205', '355cecd9-598f-42ce-854c-ee5ce64b23e7', 'f2a3b4c5-d6e7-8901-bcde-f12345678902', '4'),
('a1a2b3c4-d5e6-7890-fabc-111111111206', '1c35e3af-2370-4bb1-bfdd-544ee2247e38', 'f2a3b4c5-d6e7-8901-bcde-f12345678902', '5'),
-- Butter Chicken
('a1a2b3c4-d5e6-7890-fabc-111111111207', '4f972169-fe76-4dec-ae3f-1896e460471f', 'f3a4b5c6-d7e8-9012-cdef-123456789013', '5'),
('a1a2b3c4-d5e6-7890-fabc-111111111208', 'cbaacdb3-0798-4235-9272-733e22615f2e', 'f3a4b5c6-d7e8-9012-cdef-123456789013', '4'),
('a1a2b3c4-d5e6-7890-fabc-111111111209', '471cec1e-1b52-4c9e-bd13-8810ee672ef4', 'f3a4b5c6-d7e8-9012-cdef-123456789013', '5'),
-- Cazuela Chilienne
('a1a2b3c4-d5e6-7890-fabc-111111111210', 'd31e431c-6f6e-4cc6-861b-6d9095ed5e4e', 'f4a5b6c7-d8e9-0123-defa-234567890124', '4'),
('a1a2b3c4-d5e6-7890-fabc-111111111211', 'db937cac-d99d-4b0d-bd4b-6e23438589ba', 'f4a5b6c7-d8e9-0123-defa-234567890124', '4'),
-- Couscous Tunisien
('a1a2b3c4-d5e6-7890-fabc-111111111212', '355cecd9-598f-42ce-854c-ee5ce64b23e7', 'f5a6b7c8-d9e0-1234-efab-345678901235', '5'),
('a1a2b3c4-d5e6-7890-fabc-111111111213', '1c35e3af-2370-4bb1-bfdd-544ee2247e38', 'f5a6b7c8-d9e0-1234-efab-345678901235', '4'),
('a1a2b3c4-d5e6-7890-fabc-111111111214', '4f972169-fe76-4dec-ae3f-1896e460471f', 'f5a6b7c8-d9e0-1234-efab-345678901235', '5'),
-- Romazava
('a1a2b3c4-d5e6-7890-fabc-111111111215', 'cbaacdb3-0798-4235-9272-733e22615f2e', 'f6a7b8c9-d0e1-2345-fabc-456789012346', '4'),
('a1a2b3c4-d5e6-7890-fabc-111111111216', 'd31e431c-6f6e-4cc6-861b-6d9095ed5e4e', 'f6a7b8c9-d0e1-2345-fabc-456789012346', '5'),
-- Fondant au Chocolat
('a1a2b3c4-d5e6-7890-fabc-111111111217', '471cec1e-1b52-4c9e-bd13-8810ee672ef4', 'f5a6b7c8-d9e0-1234-efab-375678901235', '5'),
('a1a2b3c4-d5e6-7890-fabc-111111111218', '355cecd9-598f-42ce-854c-ee5ce64b23e7', 'f5a6b7c8-d9e0-1234-efab-375678901235', '5'),
-- Tiramisu
('a1a2b3c4-d5e6-7890-fabc-111111111219', 'db937cac-d99d-4b0d-bd4b-6e23438589ba', 'f3a4b5c6-d7e8-9012-cdef-123456781013', '5'),
('a1a2b3c4-d5e6-7890-fabc-111111111220', '1c35e3af-2370-4bb1-bfdd-544ee2247e38', 'f3a4b5c6-d7e8-9012-cdef-123456781013', '4'),

('61b2c3d4-2d6b-4103-b0a2-9ab248ba1612', 'cbaacdb3-0798-4235-9272-733e22615f2e', 'a1b2c3d4-e111-4c6c-b165-d1d83e85b111', '5'),
(
    '81b2c3d4-2d6b-4103-b0a2-9ab248ba1613',
    '471cec1e-1b52-4c9e-bd13-8810ee672ef4',
    'a1b2c3d4-e111-4c6c-b165-d1d83e85b111',
    '3'
),
(
    '61b2c3d4-2d6b-4103-b0a2-9ab248ba1614',
    'd31e431c-6f6e-4cc6-861b-6d9095ed5e4e',
    'a1b2c3d4-e444-4c6c-b165-d1d83e85b444',
    '5'
),
(
    '61b2c9d4-2d6b-4103-b0a2-9ab248ba1614',
    'd31e431c-6f6e-4cc6-861b-6d9095ed5e4e',
    'f1a2b3c4-e444-4c6c-b165-d1d83e85c444',
    '4'
),
(
    '61b2c7d4-2d6b-4103-b0a2-9ab248ba1614',
    'd31e431c-6f6e-4cc6-861b-6d9095ed5e4e',
    'f1a2b3c4-e222-4c6c-b165-d1d83e85c222',
    '4'
),
(
    '61b2c7d4-2d6b-4103-b0a2-9ab248ba1675',
    'd31e431c-6f6e-4cc6-861b-6d9095ed5e4e',
    'f1a2b3c4-e111-4c6c-b165-d1d83e85c111',
    '5'
),
(
    '11b2c3d4-2d6b-4103-b0a2-9ab248ba1615',
    'cbaacdb3-0798-4235-9272-733e22615f2e',
    'a1b2c3d4-e444-4c6c-b165-d1d83e85b444',
    '4'
);