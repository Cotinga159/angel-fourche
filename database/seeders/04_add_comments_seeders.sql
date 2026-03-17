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
),
-- Tacos al Pastor
(
    'c1a2b3c4-d5e6-f789-abcd-ef1234567801',
    'cbaacdb3-0798-4235-9272-733e22615f2e',
    'f1a2b3c4-d5e6-7890-abcd-ef1234567891',
    'Incroyable ! L''ananas caramélisé avec la viande épicée, c''est une combinaison parfaite.'
),
(
    'c1a2b3c4-d5e6-f789-abcd-ef1234567802',
    'd31e431c-6f6e-4cc6-861b-6d9095ed5e4e',
    'f1a2b3c4-d5e6-7890-abcd-ef1234567891',
    'J''ai eu du mal à trouver les piments guajillo mais ça valait vraiment le détour !'
),
(
    'c1a2b3c4-d5e6-f789-abcd-ef1234567803',
    '471cec1e-1b52-4c9e-bd13-8810ee672ef4',
    'f1a2b3c4-d5e6-7890-abcd-ef1234567891',
    'Authentique et savoureux, j''ai ajouté de la salsa verde et c''était parfait.'
),
-- Ramen Tonkotsu
(
    'c1a2b3c4-d5e6-f789-abcd-ef1234567804',
    'db937cac-d99d-4b0d-bd4b-6e23438589ba',
    'f2a3b4c5-d6e7-8901-bcde-f12345678902',
    'Long à préparer mais le résultat est bluffant, on se croirait dans un vrai restaurant japonais !'
),
(
    'c1a2b3c4-d5e6-f789-abcd-ef1234567805',
    '355cecd9-598f-42ce-854c-ee5ce64b23e7',
    'f2a3b4c5-d6e7-8901-bcde-f12345678902',
    'Le bouillon est divin. J''ai ajouté un peu de sauce piquante et c''était encore meilleur.'
),
(
    'c1a2b3c4-d5e6-f789-abcd-ef1234567806',
    '1c35e3af-2370-4bb1-bfdd-544ee2247e38',
    'f2a3b4c5-d6e7-8901-bcde-f12345678902',
    'Recette difficile mais tellement gratifiante. L''œuf mariné est la touche qui change tout.'
),
-- Butter Chicken
(
    'c1a2b3c4-d5e6-f789-abcd-ef1234567807',
    '4f972169-fe76-4dec-ae3f-1896e460471f',
    'f3a4b5c6-d7e8-9012-cdef-123456789013',
    'Ma recette préférée ! La sauce est onctueuse et bien épicée, je la refais chaque semaine.'
),
(
    'c1a2b3c4-d5e6-f789-abcd-ef1234567808',
    'cbaacdb3-0798-4235-9272-733e22615f2e',
    'f3a4b5c6-d7e8-9012-cdef-123456789013',
    'J''ai réduit le piment pour les enfants, ils ont adoré avec du riz basmati.'
),
(
    'c1a2b3c4-d5e6-f789-abcd-ef1234567809',
    '471cec1e-1b52-4c9e-bd13-8810ee672ef4',
    'f3a4b5c6-d7e8-9012-cdef-123456789013',
    'Meilleur butter chicken que j''ai jamais mangé, bien meilleur qu''au restaurant !'
),
-- Cazuela Chilienne
(
    'c1a2b3c4-d5e6-f789-abcd-ef1234567810',
    'd31e431c-6f6e-4cc6-861b-6d9095ed5e4e',
    'f4a5b6c7-d8e9-0123-defa-234567890124',
    'Recette réconfortante et généreuse, parfaite pour les soirées d''hiver en famille.'
),
(
    'c1a2b3c4-d5e6-f789-abcd-ef1234567811',
    'db937cac-d99d-4b0d-bd4b-6e23438589ba',
    'f4a5b6c7-d8e9-0123-defa-234567890124',
    'Le maïs dans le bouillon apporte une douceur surprenante, j''adore cette recette !'
),
-- Couscous Tunisien
(
    'c1a2b3c4-d5e6-f789-abcd-ef1234567812',
    '355cecd9-598f-42ce-854c-ee5ce64b23e7',
    'f5a6b7c8-d9e0-1234-efab-345678901235',
    'Exactement comme ma mère le faisait, la harissa donne ce goût authentique incomparable.'
),
(
    'c1a2b3c4-d5e6-f789-abcd-ef1234567813',
    '1c35e3af-2370-4bb1-bfdd-544ee2247e38',
    'f5a6b7c8-d9e0-1234-efab-345678901235',
    'J''ai mis un peu moins de harissa pour les enfants, c''était quand même délicieux.'
),
(
    'c1a2b3c4-d5e6-f789-abcd-ef1234567814',
    '4f972169-fe76-4dec-ae3f-1896e460471f',
    'f5a6b7c8-d9e0-1234-efab-345678901235',
    'La semoule bien égrainée avec du beurre, un régal. Recette fidèle à la tradition.'
),
-- Romazava
(
    'c1a2b3c4-d5e6-f789-abcd-ef1234567815',
    'cbaacdb3-0798-4235-9272-733e22615f2e',
    'f6a7b8c9-d0e1-2345-fabc-456789012346',
    'J''ai remplacé les brèdes par des épinards et des blettes, le résultat était excellent.'
),
(
    'c1a2b3c4-d5e6-f789-abcd-ef1234567816',
    'd31e431c-6f6e-4cc6-861b-6d9095ed5e4e',
    'f6a7b8c9-d0e1-2345-fabc-456789012346',
    'Découverte magnifique ! Simple mais tellement savoureux, le gingembre fait toute la différence.'
),
-- Fondant au Chocolat
(
    'c1a2b3c4-d5e6-f789-abcd-ef1234567817',
    '471cec1e-1b52-4c9e-bd13-8810ee672ef4',
    'f5a6b7c8-d9e0-1234-efab-375678901235',
    'Le cœur coulant est parfait à 11 minutes, avec une boule de glace c''est divin !'
),
(
    'c1a2b3c4-d5e6-f789-abcd-ef1234567818',
    '355cecd9-598f-42ce-854c-ee5ce64b23e7',
    'f5a6b7c8-d9e0-1234-efab-375678901235',
    'J''ai utilisé du chocolat à 85% et c''était encore plus intense, un vrai délice.'
),
-- Tiramisu
(
    'c1a2b3c4-d5e6-f789-abcd-ef1234567819',
    'db937cac-d99d-4b0d-bd4b-6e23438589ba',
    'f3a4b5c6-d7e8-9012-cdef-123456781013',
    'Le meilleur tiramisu que j''ai fait, la texture est légère et le café bien présent.'
),
(
    'c1a2b3c4-d5e6-f789-abcd-ef1234567820',
    '1c35e3af-2370-4bb1-bfdd-544ee2247e38',
    'f3a4b5c6-d7e8-9012-cdef-123456781013',
    'J''ai remplacé le marsala par de l''amaretto, encore meilleur ! Recette parfaite.'
),
(
    'c1a1bf0c-0985-4d84-ba02-e89c3f864a12',
    'cbaacdb3-0798-4235-9272-733e22615f2e',
    'a1b2c3d4-e111-4c6c-b165-d1d83e85b111',
    'Excellentes pâtes, très crémeuses !'
),
(
    'c1a1bf0c-0985-4d84-ba02-e89c3f864a13',
    '471cec1e-1b52-4c9e-bd13-8810ee672ef4',
    'a1b2c3d4-e111-4c6c-b165-d1d83e85b111',
    'Bonne recette mais un peu trop grasse à mon goût.'
),
(
    'c1a1bf0c-0985-4d84-ba02-e89c3f864a14',
    'd31e431c-6f6e-4cc6-861b-6d9095ed5e4e',
    'a1b2c3d4-e444-4c6c-b165-d1d83e85b444',
    'Le curry est parfaitement dosé, j’ai adoré !'
),
(
    'c1a1bf0c-0985-4d84-ba02-e89c3f864a15',
    'cbaacdb3-0798-4235-9272-733e22615f2e',
    'a1b2c3d4-e444-4c6c-b165-d1d83e85b444',
    'Très bon mais manque un peu de piquant.'
);