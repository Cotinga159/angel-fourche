TRUNCATE TABLE recipes CASCADE;

SET CLIENT_ENCODING TO 'UTF8';
INSERT INTO recipes (
    id_recipe, 
    user_id, 
    category_id, 
    title, 
    description, 
    ingredient, 
    step, 
    preparation_time, 
    serving, 
    difficulty, 
    picture, 
    type_diet, 
    diet_religious, 
    type_flavor
)   VALUES
(
    'e798f2a7-af70-4c6c-b165-d1d83e85b25c',
    '830a9585-0f66-4d6e-9023-d1151343471d',
    '1464d31d-6ca3-4d0e-af41-1b1c46b3d271',
    'Oreo Cake',
    'Égayons nos papilles avec un cake aux Oreo, un dessert qui ravira petits et grands avec sa texture moelleuse et son goût chocolaté emblématique. Facile à réaliser, ce cake est idéal pour se faire plaisir sans passer des heures en cuisine. Parfait pour les goûters improvisés ou les desserts du week-end, sa préparation vous encouragera à mettre la main à la pâte avec enthousiasme.',
    '[
        {"quantity":200,"unit":"g","name":"biscuits Oreo"},
        {"quantity":150,"unit":"g","name":"farine"},
        {"quantity":100,"unit":"g","name":"sucre"},
        {"quantity":1,"unit":"tsp","name":"café de poudre à lever"},
        {"quantity":2,"unit":"unit","name":"oeufs"},
        {"quantity":250,"unit":"ml","name":"lait concentré non sucré"},
        {"quantity":100,"unit":"ml","name":"huile végétale"}
    ]'::jsonb,
    '[
        { "step_number": 1, "instruction": "Préchauffez votre four à 180°C." },
        { "step_number": 2, "instruction": "Dans un grand bol, mélangez la farine, le sucre et la poudre à lever jusqu’à homogénéité." },
        { "step_number": 3, "instruction": "Ajoutez les œufs, l’huile végétale et le lait concentré non sucré. Mélangez jusqu’à obtenir une pâte lisse." },
        { "step_number": 4, "instruction": "Incorporez délicatement la moitié des biscuits Oreo grossièrement émiettés dans la pâte." },
        { "step_number": 5, "instruction": "Versez la préparation dans un moule à cake préalablement graissé." },
        { "step_number": 6, "instruction": "Répartissez le reste des Oreo émiettés sur le dessus de la pâte." },
        { "step_number": 7, "instruction": "Enfournez pendant 40 minutes, vérifiez la cuisson avec un couteau. La lame doit ressortir sèche." },
        { "step_number": 8, "instruction": "Laissez refroidir avant de démouler et de déguster." }
    ]'::jsonb,
    '40',
    '4',
    'Facile',
    'https://ffcuisine.fr/wp-content/uploads/2025/04/1745403092-recette-de-cake-aux-oreo-un-dessert-gourmand-et-facile.jpg',
    'végétarien',
    'aucun',
    'sucre'
),
(
    'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
    '830a9585-0f66-4d6e-9023-d1151343471d',
    '1464d31d-6ca3-4d0e-af41-1b1c46b3d271',
    'Tarte aux Pommes Classique',
    'Une tarte aux pommes traditionnelle, dorée et parfumée à la cannelle. Ce dessert intemporel fait le bonheur de toute la famille avec sa pâte croustillante et sa garniture fondante. Simple à préparer, elle embaume la cuisine d''une odeur irrésistible à la sortie du four.',
    '[
        {"quantity":1,"unit":"unit","name":"pâte brisée"},
        {"quantity":4,"unit":"unit","name":"pommes Golden"},
        {"quantity":50,"unit":"g","name":"sucre"},
        {"quantity":1,"unit":"tsp","name":"cannelle en poudre"},
        {"quantity":30,"unit":"g","name":"beurre"},
        {"quantity":2,"unit":"tbsp","name":"confiture d''abricot"}
    ]'::jsonb,
    '[
        {"step_number": 1, "instruction": "Préchauffez le four à 180°C."},
        {"step_number": 2, "instruction": "Étalez la pâte brisée dans un moule à tarte et piquez le fond à la fourchette."},
        {"step_number": 3, "instruction": "Pelez, épépinez et coupez les pommes en fines lamelles."},
        {"step_number": 4, "instruction": "Disposez les lamelles de pommes en rosace sur la pâte."},
        {"step_number": 5, "instruction": "Saupoudrez de sucre et de cannelle, puis répartissez des petits morceaux de beurre."},
        {"step_number": 6, "instruction": "Enfournez 35 minutes jusqu''à ce que la tarte soit bien dorée."},
        {"step_number": 7, "instruction": "À la sortie du four, badigeonnez de confiture d''abricot chauffée pour faire briller."},
        {"step_number": 8, "instruction": "Laissez refroidir avant de servir."}
    ]'::jsonb,
    '35',
    '6',
    'Facile',
    'https://epicesetdelices.fr/wp-content/uploads/2023/03/tarte-aux-pommes-1024x1024.png',
    'végétarien',
    'aucun',
    'sucre'
),

-- Poulet rôti
(
    'b2c3d4e5-f6a7-8901-bcde-f12345678901',
    '830a9585-0f66-4d6e-9023-d1151343471d',
    '1464d31d-6ca3-4d0e-af41-1b1c46b3d271',
    'Poulet Rôti aux Herbes',
    'Un poulet rôti croustillant et juteux, parfumé aux herbes de Provence et à l''ail. Ce grand classique de la cuisine française est idéal pour un repas dominical en famille. La cuisson lente au four garantit une chair tendre et une peau parfaitement dorée.',
    '[
        {"quantity":1,"unit":"unit","name":"poulet entier (1,5 kg)"},
        {"quantity":4,"unit":"unit","name":"gousses d''ail"},
        {"quantity":2,"unit":"tbsp","name":"herbes de Provence"},
        {"quantity":40,"unit":"g","name":"beurre"},
        {"quantity":2,"unit":"tbsp","name":"huile d''olive"},
        {"quantity":1,"unit":"unit","name":"citron"},
        {"quantity":1,"unit":"tsp","name":"sel"},
        {"quantity":1,"unit":"tsp","name":"poivre"}
    ]'::jsonb,
    '[
        {"step_number": 1, "instruction": "Préchauffez le four à 200°C."},
        {"step_number": 2, "instruction": "Mélangez le beurre ramolli avec les herbes de Provence, le sel et le poivre."},
        {"step_number": 3, "instruction": "Glissez le beurre aux herbes sous la peau du poulet et badigeonnez-le d''huile d''olive."},
        {"step_number": 4, "instruction": "Farcissez l''intérieur avec les gousses d''ail et le citron coupé en deux."},
        {"step_number": 5, "instruction": "Placez le poulet dans un plat allant au four et enfournez 1h15."},
        {"step_number": 6, "instruction": "Arrosez régulièrement le poulet avec son jus de cuisson toutes les 20 minutes."},
        {"step_number": 7, "instruction": "Vérifiez la cuisson en piquant la cuisse : le jus doit ressortir clair."},
        {"step_number": 8, "instruction": "Laissez reposer 10 minutes sous papier aluminium avant de découper."}
    ]'::jsonb,
    '75',
    '4',
    'Facile',
    'https://ffcuisine.fr/wp-content/uploads/2025/01/1735460473-poulet-roti-au-four-recette-croustillante-et-savoureuse.jpg',
    'omnivore',
    'aucun',
    'salé'
),

-- Soupe à l'oignon
(
    'c3d4e5f6-a7b8-9012-cdef-123456789012',
    '830a9585-0f66-4d6e-9023-d1151343471d',
    '1464d31d-6ca3-4d0e-af41-1b1c46b3d271',
    'Soupe à l''Oignon Gratinée',
    'La soupe à l''oignon gratinée est un symbole de la cuisine bistrot française. Avec ses oignons lentement caramélisés, son bouillon savoureux et sa croûte de fromage fondu, elle réchauffe le corps et l''âme. Un plat réconfortant parfait pour les soirées hivernales.',
    '[
        {"quantity":6,"unit":"unit","name":"oignons"},
        {"quantity":1,"unit":"L","name":"bouillon de bœuf"},
        {"quantity":200,"unit":"g","name":"gruyère râpé"},
        {"quantity":4,"unit":"unit","name":"tranches de pain de campagne"},
        {"quantity":30,"unit":"g","name":"beurre"},
        {"quantity":2,"unit":"tbsp","name":"huile d''olive"},
        {"quantity":150,"unit":"ml","name":"vin blanc sec"},
        {"quantity":1,"unit":"tsp","name":"sucre"},
        {"quantity":1,"unit":"tsp","name":"sel"},
        {"quantity":1,"unit":"tsp","name":"poivre"}
    ]'::jsonb,
    '[
        {"step_number": 1, "instruction": "Épluchez et émincez finement les oignons."},
        {"step_number": 2, "instruction": "Faites fondre le beurre avec l''huile dans une grande casserole à feu moyen."},
        {"step_number": 3, "instruction": "Ajoutez les oignons et le sucre, faites caraméliser 30 minutes en remuant régulièrement."},
        {"step_number": 4, "instruction": "Déglacez avec le vin blanc et laissez évaporer 2 minutes."},
        {"step_number": 5, "instruction": "Versez le bouillon de bœuf, salez, poivrez et laissez mijoter 20 minutes."},
        {"step_number": 6, "instruction": "Préchauffez le gril du four."},
        {"step_number": 7, "instruction": "Répartissez la soupe dans des bols allant au four, posez une tranche de pain sur chaque bol."},
        {"step_number": 8, "instruction": "Recouvrez généreusement de gruyère râpé et gratinez 5 minutes sous le gril."}
    ]'::jsonb,
    '60',
    '4',
    'Moyen',
    'https://www.toutesrecettes.com/wp-content/uploads/2019/11/Soupe-a-loignon-gratinee-au-four.jpg',
    'végétarien',
    'aucun',
    'salé'
),

-- Crêpes
(
    'd4e5f6a7-b8c9-0123-defa-234567890123',
    '830a9585-0f66-4d6e-9023-d1151343471d',
    '1464d31d-6ca3-4d0e-af41-1b1c46b3d271',
    'Crêpes Bretonnes',
    'Les crêpes bretonnes, fines et légères, sont un incontournable de la cuisine française. Que ce soit pour un goûter, un dessert ou même un brunch, elles se déclinent à l''infini avec des garnitures sucrées ou salées. Cette recette traditionnelle vous garantit des crêpes parfaites à chaque fois.',
    '[
        {"quantity":250,"unit":"g","name":"farine"},
        {"quantity":3,"unit":"unit","name":"œufs"},
        {"quantity":500,"unit":"ml","name":"lait"},
        {"quantity":50,"unit":"g","name":"beurre fondu"},
        {"quantity":1,"unit":"tbsp","name":"sucre"},
        {"quantity":1,"unit":"pinch","name":"sel"},
        {"quantity":1,"unit":"tbsp","name":"rhum brun"}
    ]'::jsonb,
    '[
        {"step_number": 1, "instruction": "Dans un saladier, mélangez la farine, le sucre et le sel."},
        {"step_number": 2, "instruction": "Creusez un puits et ajoutez les œufs battus. Mélangez en incorporant progressivement la farine."},
        {"step_number": 3, "instruction": "Versez le lait petit à petit en fouettant pour éviter les grumeaux."},
        {"step_number": 4, "instruction": "Ajoutez le beurre fondu et le rhum, mélangez bien."},
        {"step_number": 5, "instruction": "Laissez reposer la pâte 1 heure au réfrigérateur."},
        {"step_number": 6, "instruction": "Faites chauffer une poêle légèrement huilée à feu moyen."},
        {"step_number": 7, "instruction": "Versez une petite louche de pâte et répartissez-la en inclinant la poêle."},
        {"step_number": 8, "instruction": "Cuisez 1 minute de chaque côté jusqu''à légère dorure. Répétez pour toutes les crêpes."}
    ]'::jsonb,
    '20',
    '6',
    'Facile',
    'https://img.mesrecettesfaciles.fr/2024-03/crepes-traditionnelles-lei-1200.webp',
    'végétarien',
    'aucun',
    'sucre'
),

-- Ratatouille
(
    'e5f6a7b8-c9d0-1234-efab-345678901234',
    '830a9585-0f66-4d6e-9023-d1151343471d',
    '1464d31d-6ca3-4d0e-af41-1b1c46b3d271',
    'Ratatouille Provençale',
    'La ratatouille provençale est un hymne aux légumes du soleil. Ce plat coloré et savoureux, originaire de Nice, marie courgettes, aubergines, poivrons et tomates dans une symphonie de saveurs méditerranéennes. Un plat végétarien complet qui se déguste chaud ou froid.',
    '[
        {"quantity":2,"unit":"unit","name":"courgettes"},
        {"quantity":1,"unit":"unit","name":"aubergine"},
        {"quantity":2,"unit":"unit","name":"poivrons rouges"},
        {"quantity":4,"unit":"unit","name":"tomates"},
        {"quantity":2,"unit":"unit","name":"oignons"},
        {"quantity":4,"unit":"unit","name":"gousses d''ail"},
        {"quantity":4,"unit":"tbsp","name":"huile d''olive"},
        {"quantity":1,"unit":"unit","name":"bouquet garni"},
        {"quantity":1,"unit":"tsp","name":"herbes de Provence"},
        {"quantity":1,"unit":"tsp","name":"sel"},
        {"quantity":1,"unit":"tsp","name":"poivre"}
    ]'::jsonb,
    '[
        {"step_number": 1, "instruction": "Lavez et coupez tous les légumes en dés de taille similaire."},
        {"step_number": 2, "instruction": "Dans une grande cocotte, faites revenir les oignons et l''ail dans l''huile d''olive 5 minutes."},
        {"step_number": 3, "instruction": "Ajoutez les poivrons et faites cuire 5 minutes supplémentaires."},
        {"step_number": 4, "instruction": "Incorporez l''aubergine et les courgettes, faites revenir 5 minutes."},
        {"step_number": 5, "instruction": "Ajoutez les tomates, le bouquet garni et les herbes de Provence."},
        {"step_number": 6, "instruction": "Salez, poivrez et mélangez délicatement."},
        {"step_number": 7, "instruction": "Couvrez et laissez mijoter 40 minutes à feu doux en remuant de temps en temps."},
        {"step_number": 8, "instruction": "Retirez le bouquet garni et servez chaud ou à température ambiante."}
    ]'::jsonb,
    '60',
    '4',
    'Facile',
    'https://whatsteveeats.com/wp-content/uploads/2020/08/traditional-ratatouille-thumbnail-1-scaled.jpg',
    'vegan',
    'aucun',
    'salé'
);


