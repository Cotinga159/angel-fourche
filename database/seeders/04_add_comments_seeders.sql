TRUNCATE TABLE comments CASCADE;

SET CLIENT_ENCODING TO 'UTF8';

INSERT INTO 
comments (id_comment, user_id, recipe_id, content)
VALUES (
    'ef51bf0c-0985-4d84-ba02-e89c3f864acd',
    'db937cac-d99d-4b0d-bd4b-6e23438589ba',
    'e798f2a7-af70-4c6c-b165-d1d83e85b25c',
    'C est trop sucrée, je ne recommanderai pas.'
),
(
    'c0a1b2c3-d4e5-f678-9abc-def012345601',
    'cbaacdb3-0798-4235-9272-733e22615f2e',
    'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
    'Recette parfaite ! Mes enfants ont adoré, la cannelle donne un goût incroyable.'
),
(
    'c0a1b2c3-d4e5-f678-9abc-def012345602',
    'd31e431c-6f6e-4cc6-861b-6d9095ed5e4e',
    'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
    'Très bonne tarte, j''ai ajouté un peu de vanille et c''était divin.'
),
(
    'c0a1b2c3-d4e5-f678-9abc-def012345603',
    '471cec1e-1b52-4c9e-bd13-8810ee672ef4',
    'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
    'Simple et délicieux, exactement comme chez ma grand-mère !'
),

-- Poulet rôti
(
    'c0a1b2c3-d4e5-f678-9abc-def012345604',
    'db937cac-d99d-4b0d-bd4b-6e23438589ba',
    'b2c3d4e5-f6a7-8901-bcde-f12345678901',
    'Le poulet était juteux et bien doré, toute la famille s''est régalée !'
),
(
    'c0a1b2c3-d4e5-f678-9abc-def012345605',
    '355cecd9-598f-42ce-854c-ee5ce64b23e7',
    'b2c3d4e5-f6a7-8901-bcde-f12345678901',
    'J''arrose toutes les 15 minutes et la peau est vraiment croustillante, super recette.'
),
(
    'c0a1b2c3-d4e5-f678-9abc-def012345606',
    'cbaacdb3-0798-4235-9272-733e22615f2e',
    'b2c3d4e5-f6a7-8901-bcde-f12345678901',
    'Bon mais je trouve que ça manque un peu de sel, à adapter selon les goûts.'
),

-- Soupe à l'oignon
(
    'c0a1b2c3-d4e5-f678-9abc-def012345607',
    '471cec1e-1b52-4c9e-bd13-8810ee672ef4',
    'c3d4e5f6-a7b8-9012-cdef-123456789012',
    'Parfaite pour l''hiver ! Les oignons bien caramélisés font toute la différence.'
),
(
    'c0a1b2c3-d4e5-f678-9abc-def012345608',
    '1c35e3af-2370-4bb1-bfdd-544ee2247e38',
    'c3d4e5f6-a7b8-9012-cdef-123456789012',
    'J''ai utilisé du bouillon de légumes à la place du bœuf, tout aussi savoureux.'
),

-- Crêpes
(
    'c0a1b2c3-d4e5-f678-9abc-def012345609',
    'd31e431c-6f6e-4cc6-861b-6d9095ed5e4e',
    'd4e5f6a7-b8c9-0123-defa-234567890123',
    'Recette au top ! Le temps de repos d''une heure est vraiment important, ne le sautez pas.'
),
(
    'c0a1b2c3-d4e5-f678-9abc-def012345610',
    'db937cac-d99d-4b0d-bd4b-6e23438589ba',
    'd4e5f6a7-b8c9-0123-defa-234567890123',
    'Légères et fines comme il faut, avec du Nutella c''est un régal !'
),
(
    'c0a1b2c3-d4e5-f678-9abc-def012345611',
    '4f972169-fe76-4dec-ae3f-1896e460471f',
    'd4e5f6a7-b8c9-0123-defa-234567890123',
    'J''ai remplacé le rhum par de la fleur d''oranger, mes enfants ont adoré.'
),

-- Ratatouille
(
    'c0a1b2c3-d4e5-f678-9abc-def012345612',
    '830a9585-0f66-4d6e-9023-d1151343471d',
    'e5f6a7b8-c9d0-1234-efab-345678901234',
    'Un classique indémodable ! Je la prépare chaque été avec les légumes du jardin.'
),
(
    'c0a1b2c3-d4e5-f678-9abc-def012345613',
    'cbaacdb3-0798-4235-9272-733e22615f2e',
    'e5f6a7b8-c9d0-1234-efab-345678901234',
    'Très bon plat, j''ai ajouté des courgettes jaunes pour la couleur.'
),
(
    'c0a1b2c3-d4e5-f678-9abc-def012345614',
    '471cec1e-1b52-4c9e-bd13-8810ee672ef4',
    'e5f6a7b8-c9d0-1234-efab-345678901234',
    'Recette simple et savoureuse, idéale pour manger des légumes sans s''en rendre compte !'
);