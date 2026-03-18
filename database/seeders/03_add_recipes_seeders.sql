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
    '6a5dee1c-3777-430f-a4a7-b911249bea09',
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
    '6a5dee1c-3777-430f-a4a7-b911249bea09',
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
    'ac94e4f6-4895-47bb-b8e0-88e754052db7',
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
    '605daeb6-5f81-4fe4-9dcd-4c5aac9dfa8a',
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
    '6a5dee1c-3777-430f-a4a7-b911249bea09',
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
    'ac94e4f6-4895-47bb-b8e0-88e754052db7',
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
),

-- Tiramisu
(
    'f3a4b5c6-d7e8-9012-cdef-123456781013',
    '830a9585-0f66-4d6e-9023-d1151343471d',
    '6a5dee1c-3777-430f-a4a7-b911249bea09',
    'Tiramisu Classique',
    'Le tiramisu est un dessert italien irrésistible, avec ses couches de biscuits imbibés de café et sa crème mascarpone légère et onctueuse. Saupoudré de cacao, il est à la fois élégant et gourmand. Un dessert qui fait toujours l''unanimité.',
    '[
        {"quantity":500,"unit":"g","name":"mascarpone"},
        {"quantity":4,"unit":"unit","name":"œufs"},
        {"quantity":100,"unit":"g","name":"sucre"},
        {"quantity":24,"unit":"unit","name":"biscuits à la cuillère"},
        {"quantity":300,"unit":"ml","name":"café fort refroidi"},
        {"quantity":3,"unit":"tbsp","name":"marsala ou amaretto"},
        {"quantity":30,"unit":"g","name":"cacao en poudre non sucré"}
    ]'::jsonb,
    '[
        {"step_number": 1, "instruction": "Séparez les blancs des jaunes d''œufs."},
        {"step_number": 2, "instruction": "Fouettez les jaunes avec le sucre jusqu''à blanchiment, puis incorporez le mascarpone."},
        {"step_number": 3, "instruction": "Montez les blancs en neige ferme et incorporez-les délicatement à la crème mascarpone."},
        {"step_number": 4, "instruction": "Mélangez le café refroidi avec le marsala dans un bol peu profond."},
        {"step_number": 5, "instruction": "Trempez rapidement les biscuits dans le café et disposez-les en couche dans un plat."},
        {"step_number": 6, "instruction": "Étalez la moitié de la crème mascarpone sur les biscuits."},
        {"step_number": 7, "instruction": "Répétez l''opération avec une deuxième couche de biscuits et de crème."},
        {"step_number": 8, "instruction": "Saupoudrez de cacao et réfrigérez au moins 4 heures avant de servir."}
    ]'::jsonb,
    '30', '6', 'Moyen',
    'https://images.ctfassets.net/1p5r6txvlxu4/2AuCQgVaK08nA3Wgm7TJbr/7981b99d4a52359fe5dd1090dd2ec96a/Tiramisu_original.jpg?w=768&h=541&fm=webp&q=100&fit=fill&f=center',
    'végétarien', 'aucun', 'sucre'
),

-- Fondant au Chocolat
(
    'f5a6b7c8-d9e0-1234-efab-375678901235',
    '830a9585-0f66-4d6e-9023-d1151343471d',
    '6a5dee1c-3777-430f-a4a7-b911249bea09',
    'Fondant au Chocolat',
    'Le fondant au chocolat est LE dessert des amateurs de chocolat. Avec son cœur coulant et sa croûte légèrement craquante, il est irrésistible. Simple et rapide à préparer, il impressionnera vos convives à coup sûr.',
    '[
        {"quantity":200,"unit":"g","name":"chocolat noir 70%"},
        {"quantity":150,"unit":"g","name":"beurre"},
        {"quantity":150,"unit":"g","name":"sucre"},
        {"quantity":4,"unit":"unit","name":"œufs"},
        {"quantity":50,"unit":"g","name":"farine"},
        {"quantity":1,"unit":"pinch","name":"sel"}
    ]'::jsonb,
    '[
        {"step_number": 1, "instruction": "Préchauffez le four à 200°C et beurrez des ramequins."},
        {"step_number": 2, "instruction": "Faites fondre le chocolat et le beurre au bain-marie."},
        {"step_number": 3, "instruction": "Fouettez les œufs avec le sucre jusqu''à blanchiment."},
        {"step_number": 4, "instruction": "Incorporez le chocolat fondu au mélange œufs-sucre."},
        {"step_number": 5, "instruction": "Ajoutez la farine tamisée et le sel, mélangez délicatement."},
        {"step_number": 6, "instruction": "Versez la préparation dans les ramequins beurrés."},
        {"step_number": 7, "instruction": "Enfournez 10-12 minutes — le centre doit rester légèrement tremblant."},
        {"step_number": 8, "instruction": "Démoulez immédiatement et servez avec une boule de glace vanille."}
    ]'::jsonb,
    '20', '4', 'Moyen',
    'https://perleensucre.com/wp-content/uploads/2019/10/Coeur-coulant-2-2.jpg',
    'végétarien', 'aucun', 'sucre'
),

-- Tacos al Pastor (Mexicain)
(
    'f1a2b3c4-d5e6-7890-abcd-ef1234567891',
    '830a9585-0f66-4d6e-9023-d1151343471d',
    'ac94e4f6-4895-47bb-b8e0-88e754052db7',
    'Tacos al Pastor',
    'Les tacos al pastor sont un symbole de la street food mexicaine. La viande de porc marinée aux épices et aux ananas, cuite lentement, se glisse dans des tortillas chaudes garnies de coriandre et d''oignon. Un explosion de saveurs fumées et acidulées.',
    '[
        {"quantity":800,"unit":"g","name":"porc (épaule)"},
        {"quantity":3,"unit":"unit","name":"piments guajillo séchés"},
        {"quantity":1,"unit":"unit","name":"ananas"},
        {"quantity":3,"unit":"unit","name":"gousses d''ail"},
        {"quantity":1,"unit":"tsp","name":"cumin"},
        {"quantity":1,"unit":"tsp","name":"origan"},
        {"quantity":2,"unit":"tbsp","name":"vinaigre blanc"},
        {"quantity":12,"unit":"unit","name":"tortillas de maïs"},
        {"quantity":1,"unit":"unit","name":"oignon blanc"},
        {"quantity":1,"unit":"unit","name":"bouquet de coriandre"}
    ]'::jsonb,
    '[
        {"step_number": 1, "instruction": "Réhydratez les piments guajillo 20 minutes dans de l''eau chaude."},
        {"step_number": 2, "instruction": "Mixez les piments avec l''ail, le cumin, l''origan, le vinaigre et du jus d''ananas."},
        {"step_number": 3, "instruction": "Coupez le porc en tranches fines et faites mariner 4 heures dans la sauce."},
        {"step_number": 4, "instruction": "Faites cuire le porc dans une poêle bien chaude en plusieurs fois."},
        {"step_number": 5, "instruction": "Ajoutez des dés d''ananas en fin de cuisson et laissez caraméliser 2 minutes."},
        {"step_number": 6, "instruction": "Chauffez les tortillas dans une poêle sèche."},
        {"step_number": 7, "instruction": "Garnissez chaque tortilla de viande, d''oignon émincé et de coriandre fraîche."},
        {"step_number": 8, "instruction": "Servez avec des quartiers de citron vert."}
    ]'::jsonb,
    '45', '4', 'Moyen',
    'https://kudocook.com/wp-content/uploads/2025/03/67d6c75b01211.jpg',
    'omnivore', 'aucun', 'salé'
),
-- Ramen (Japonais)
(
    'f2a3b4c5-d6e7-8901-bcde-f12345678902',
    '830a9585-0f66-4d6e-9023-d1151343471d',
    'ac94e4f6-4895-47bb-b8e0-88e754052db7',
    'Ramen Tonkotsu',
    'Le ramen tonkotsu est un incontournable de la cuisine japonaise. Son bouillon crémeux et riche, obtenu après des heures de cuisson d''os de porc, est une véritable ode à la patience et au savoir-faire. Servi avec des nouilles, un œuf mollet et du porc fondant.',
    '[
        {"quantity":400,"unit":"g","name":"nouilles ramen"},
        {"quantity":500,"unit":"g","name":"poitrine de porc"},
        {"quantity":2,"unit":"unit","name":"œufs"},
        {"quantity":4,"unit":"tbsp","name":"sauce soja"},
        {"quantity":2,"unit":"tbsp","name":"mirin"},
        {"quantity":1,"unit":"L","name":"bouillon de porc"},
        {"quantity":4,"unit":"unit","name":"feuilles de nori"},
        {"quantity":2,"unit":"unit","name":"oignons verts"},
        {"quantity":100,"unit":"g","name":"pousses de bambou"},
        {"quantity":2,"unit":"tbsp","name":"pâte de sésame"}
    ]'::jsonb,
    '[
        {"step_number": 1, "instruction": "Faites mariner la poitrine de porc dans la sauce soja et le mirin 2 heures."},
        {"step_number": 2, "instruction": "Roulez la poitrine en cylindre, ficelez-la et faites-la cuire 2 heures dans le bouillon."},
        {"step_number": 3, "instruction": "Faites cuire les œufs 6 minutes pour un cœur mollet, puis faites-les mariner dans la sauce soja."},
        {"step_number": 4, "instruction": "Chauffez le bouillon, ajoutez la pâte de sésame et rectifiez l''assaisonnement."},
        {"step_number": 5, "instruction": "Faites cuire les nouilles selon les instructions du paquet."},
        {"step_number": 6, "instruction": "Coupez le porc en tranches épaisses."},
        {"step_number": 7, "instruction": "Répartissez les nouilles dans des bols, versez le bouillon chaud."},
        {"step_number": 8, "instruction": "Garnissez de tranches de porc, d''un demi-œuf, de nori, de bambou et d''oignons verts."}
    ]'::jsonb,
    '180', '4', 'Difficile',
    'https://i0.wp.com/christinapotvin.com/wp-content/uploads/2021/09/miniature-youtube-2.jpg?resize=1080%2C675&ssl=1',
    'omnivore', 'aucun', 'salé'
),
-- Butter Chicken (Indien)
(
    'f3a4b5c6-d7e8-9012-cdef-123456789013',
    '830a9585-0f66-4d6e-9023-d1151343471d',
    'ac94e4f6-4895-47bb-b8e0-88e754052db7',
    'Butter Chicken',
    'Le butter chicken, ou murgh makhani, est l''un des plats indiens les plus appréciés dans le monde. Le poulet tendre mariné au yaourt et aux épices mijote dans une sauce tomate crémeuse et parfumée au beurre. Un plat savoureux et réconfortant.',
    '[
        {"quantity":800,"unit":"g","name":"poulet (cuisses désossées)"},
        {"quantity":200,"unit":"ml","name":"yaourt nature"},
        {"quantity":2,"unit":"tsp","name":"garam masala"},
        {"quantity":2,"unit":"tsp","name":"curcuma"},
        {"quantity":400,"unit":"g","name":"tomates concassées"},
        {"quantity":200,"unit":"ml","name":"crème fraîche"},
        {"quantity":50,"unit":"g","name":"beurre"},
        {"quantity":3,"unit":"unit","name":"gousses d''ail"},
        {"quantity":2,"unit":"tsp","name":"gingembre frais râpé"},
        {"quantity":1,"unit":"tsp","name":"piment de Cayenne"}
    ]'::jsonb,
    '[
        {"step_number": 1, "instruction": "Mélangez le yaourt avec la moitié des épices, l''ail et le gingembre. Faites mariner le poulet 2 heures."},
        {"step_number": 2, "instruction": "Faites griller le poulet au four à 220°C pendant 20 minutes."},
        {"step_number": 3, "instruction": "Dans une casserole, faites fondre le beurre et faites revenir l''ail et le gingembre restants."},
        {"step_number": 4, "instruction": "Ajoutez les tomates concassées et le reste des épices, laissez mijoter 15 minutes."},
        {"step_number": 5, "instruction": "Mixez la sauce pour la rendre lisse et crémeuse."},
        {"step_number": 6, "instruction": "Incorporez la crème fraîche et faites chauffer à feu doux."},
        {"step_number": 7, "instruction": "Ajoutez le poulet grillé dans la sauce et laissez mijoter 10 minutes."},
        {"step_number": 8, "instruction": "Servez avec du riz basmati et du naan."}
    ]'::jsonb,
    '50', '4', 'Moyen',
    'https://sugarspunrun.com/wp-content/uploads/2025/04/Butter-chicken-1-of-1.jpg',
    'omnivore', 'aucun', 'salé'
),
-- Cazuela (Chilien)
(
    'f4a5b6c7-d8e9-0123-defa-234567890124',
    '830a9585-0f66-4d6e-9023-d1151343471d',
    'ac94e4f6-4895-47bb-b8e0-88e754052db7',
    'Cazuela Chilienne',
    'La cazuela est le plat réconfortant par excellence au Chili. Ce ragoût généreux mêle viande de bœuf, légumes et épices dans un bouillon savoureux. Servi dans un grand bol fumant, il rassemble toute la famille autour de la table.',
    '[
        {"quantity":800,"unit":"g","name":"bœuf à braiser"},
        {"quantity":4,"unit":"unit","name":"pommes de terre"},
        {"quantity":2,"unit":"unit","name":"carottes"},
        {"quantity":1,"unit":"unit","name":"épi de maïs"},
        {"quantity":200,"unit":"g","name":"potiron"},
        {"quantity":1,"unit":"unit","name":"oignon"},
        {"quantity":3,"unit":"unit","name":"gousses d''ail"},
        {"quantity":1,"unit":"tsp","name":"cumin"},
        {"quantity":1,"unit":"tsp","name":"paprika"},
        {"quantity":1,"unit":"unit","name":"bouquet de coriandre"}
    ]'::jsonb,
    '[
        {"step_number": 1, "instruction": "Coupez le bœuf en gros morceaux et faites-les dorer dans une grande marmite."},
        {"step_number": 2, "instruction": "Ajoutez l''oignon émincé et l''ail, faites revenir 3 minutes."},
        {"step_number": 3, "instruction": "Ajoutez le cumin, le paprika, salez et poivrez."},
        {"step_number": 4, "instruction": "Couvrez d''eau à hauteur et laissez mijoter 1 heure."},
        {"step_number": 5, "instruction": "Ajoutez les carottes en rondelles, le potiron en cubes et l''épi de maïs coupé en tronçons."},
        {"step_number": 6, "instruction": "Ajoutez les pommes de terre pelées entières 30 minutes plus tard."},
        {"step_number": 7, "instruction": "Laissez mijoter encore 30 minutes jusqu''à ce que tous les légumes soient tendres."},
        {"step_number": 8, "instruction": "Servez dans de grands bols avec de la coriandre fraîche ciselée."}
    ]'::jsonb,
    '120', '4', 'Facile',
    'https://www.youtotallygotthis.com/wp-content/uploads/2017/05/Cazuela-Feature-Image.jpg',
    'omnivore', 'aucun', 'salé'
),
-- Couscous Tunisien
(
    'f5a6b7c8-d9e0-1234-efab-345678901235',
    '830a9585-0f66-4d6e-9023-d1151343471d',
    'ac94e4f6-4895-47bb-b8e0-88e754052db7',
    'Couscous Tunisien',
    'Le couscous tunisien se distingue par sa sauce rouge épicée et parfumée au harissa. La semoule fine et légère absorbe un bouillon généreux enrichi de légumes et d''agneau fondant. Un plat festif et convivial qui réunit toute la famille.',
    '[
        {"quantity":500,"unit":"g","name":"semoule fine"},
        {"quantity":600,"unit":"g","name":"agneau (épaule)"},
        {"quantity":2,"unit":"unit","name":"carottes"},
        {"quantity":2,"unit":"unit","name":"courgettes"},
        {"quantity":200,"unit":"g","name":"pois chiches cuits"},
        {"quantity":2,"unit":"tbsp","name":"harissa"},
        {"quantity":2,"unit":"tbsp","name":"concentré de tomate"},
        {"quantity":1,"unit":"tsp","name":"cumin"},
        {"quantity":1,"unit":"tsp","name":"coriandre moulue"},
        {"quantity":3,"unit":"tbsp","name":"huile d''olive"}
    ]'::jsonb,
    '[
        {"step_number": 1, "instruction": "Faites dorer les morceaux d''agneau dans l''huile d''olive."},
        {"step_number": 2, "instruction": "Ajoutez le concentré de tomate, la harissa, le cumin et la coriandre."},
        {"step_number": 3, "instruction": "Couvrez d''eau et laissez mijoter 45 minutes."},
        {"step_number": 4, "instruction": "Ajoutez les carottes en tronçons et poursuivez 15 minutes."},
        {"step_number": 5, "instruction": "Ajoutez les courgettes en rondelles et les pois chiches, cuisez encore 15 minutes."},
        {"step_number": 6, "instruction": "Préparez la semoule en versant du bouillon chaud dessus, couvrez 5 minutes."},
        {"step_number": 7, "instruction": "Égrainez la semoule à la fourchette avec un peu d''huile d''olive."},
        {"step_number": 8, "instruction": "Servez la semoule dans un grand plat avec la viande, les légumes et le bouillon à part."}
    ]'::jsonb,
    '90', '6', 'Moyen',
    'https://www.lequotidien.com.tn/images/2021/08/couscous_agneau.jpg',
    'omnivore', 'halal', 'salé'
),
-- Romazava (Madagascar)
(
    'f6a7b8c9-d0e1-2345-fabc-456789012346',
    '830a9585-0f66-4d6e-9023-d1151343471d',
    'ac94e4f6-4895-47bb-b8e0-88e754052db7',
    'Romazava Malgache',
    'Le romazava est le plat national de Madagascar. Ce bouillon parfumé à base de viande de bœuf et de brèdes — feuilles de légumes locaux — est simple mais profondément savoureux. Servi avec du riz blanc, il incarne toute la générosité de la cuisine malgache.',
    '[
        {"quantity":600,"unit":"g","name":"bœuf (paleron)"},
        {"quantity":200,"unit":"g","name":"brèdes mafana (ou épinards)"},
        {"quantity":200,"unit":"g","name":"brèdes morelle (ou blettes)"},
        {"quantity":2,"unit":"unit","name":"tomates"},
        {"quantity":1,"unit":"unit","name":"oignon"},
        {"quantity":3,"unit":"unit","name":"gousses d''ail"},
        {"quantity":1,"unit":"tsp","name":"gingembre frais râpé"},
        {"quantity":2,"unit":"tbsp","name":"huile neutre"},
        {"quantity":1,"unit":"tsp","name":"sel"},
        {"quantity":400,"unit":"g","name":"riz blanc"}
    ]'::jsonb,
    '[
        {"step_number": 1, "instruction": "Coupez le bœuf en cubes et faites-le dorer dans l''huile chaude."},
        {"step_number": 2, "instruction": "Ajoutez l''oignon émincé, l''ail et le gingembre, faites revenir 3 minutes."},
        {"step_number": 3, "instruction": "Ajoutez les tomates coupées en dés et laissez compoter 5 minutes."},
        {"step_number": 4, "instruction": "Couvrez d''eau à hauteur et laissez mijoter 1 heure à feu doux."},
        {"step_number": 5, "instruction": "Ajoutez les brèdes mafana et laissez cuire 10 minutes."},
        {"step_number": 6, "instruction": "Ajoutez les brèdes morelle et poursuivez 5 minutes."},
        {"step_number": 7, "instruction": "Rectifiez l''assaisonnement en sel."},
        {"step_number": 8, "instruction": "Servez le romazava dans des bols avec du riz blanc cuit à part."}
    ]'::jsonb,
    '80', '4', 'Facile',
    'https://t4.ftcdn.net/jpg/15/92/02/43/360_F_1592024342_14MBaAyuuFtuvyBXQIcThb2or4wlMf0v.jpg',
    'omnivore', 'aucun', 'salé'
),
-- Boeuf Wellington
(
    'f1a2b3c4-e111-4c6c-b165-d1d83e85c111',
    'cbaacdb3-0798-4235-9272-733e22615f2e',
    'ac94e4f6-4895-47bb-b8e0-88e754052db7',
    'Boeuf Wellington',
    'Un grand classique de la cuisine gastronomique avec une cuisson précise et un montage délicat.',
    '[
        {"quantity":500,"unit":"g","name":"filet de boeuf"},
        {"quantity":250,"unit":"g","name":"champignons"},
        {"quantity":1,"unit":"unit","name":"pâte feuilletée"},
        {"quantity":6,"unit":"slice","name":"jambon cru"},
        {"quantity":1,"unit":"unit","name":"oeuf"},
        {"quantity":1,"unit":"tbsp","name":"moutarde"}
    ]'::jsonb,
    '[
        {"step_number":1,"instruction":"Saisir le filet de boeuf sur toutes ses faces."},
        {"step_number":2,"instruction":"Préparer une duxelles de champignons."},
        {"step_number":3,"instruction":"Enrouler le boeuf avec le jambon et la duxelles."},
        {"step_number":4,"instruction":"Envelopper dans la pâte feuilletée."},
        {"step_number":5,"instruction":"Dorer à l’oeuf et cuire au four à 200°C pendant 25 minutes."}
    ]'::jsonb,
    '90',
    '4',
    'Difficile',
    'https://www.toutesrecettes.net/wp-content/uploads/2019/12/Boeuf-Wellington-et-ses-pommes-de-terre-roties.jpg',
    'omnivore',
    'aucun',
    'salé'
),
-- Macarons à la framboise
(
    'f1a2b3c4-e222-4c6c-b165-d1d83e85c222',
    'd31e431c-6f6e-4cc6-861b-6d9095ed5e4e',
    '6a5dee1c-3777-430f-a4a7-b911249bea09',
    'Macarons à la framboise',
    'Une pâtisserie française délicate nécessitant précision et technique.',
    '[
        {"quantity":100,"unit":"g","name":"poudre d’amandes"},
        {"quantity":100,"unit":"g","name":"sucre glace"},
        {"quantity":80,"unit":"g","name":"blancs d’oeufs"},
        {"quantity":100,"unit":"g","name":"sucre"},
        {"quantity":150,"unit":"g","name":"framboises"}
    ]'::jsonb,
    '[
        {"step_number":1,"instruction":"Tamisez la poudre d’amandes et le sucre glace."},
        {"step_number":2,"instruction":"Montez les blancs en neige avec le sucre."},
        {"step_number":3,"instruction":"Macaronnez délicatement la préparation."},
        {"step_number":4,"instruction":"Dressez les coques et laissez croûter 30 minutes."},
        {"step_number":5,"instruction":"Cuire à 150°C pendant 12 minutes."},
        {"step_number":6,"instruction":"Garnir avec une ganache à la framboise."}
    ]'::jsonb,
    '120',
    '6',
    'Difficile',
    'https://assets.afcdn.com/recipe/20160502/16428_w1024h1024c1cx2000cy3000.webp',
    'végétarien',
    'aucun',
    'sucre'
),
-- Poulet Curry
(
    'a1b2c3d4-e444-4c6c-b165-d1d83e85b444',
    'db937cac-d99d-4b0d-bd4b-6e23438589ba',
    'ac94e4f6-4895-47bb-b8e0-88e754052db7',
    'Poulet au Curry',
    'Un plat parfumé et épicé qui apporte une touche exotique à votre table.',
    '[
        {"quantity":200,"unit":"g","name":"poulet"},
        {"quantity":1,"unit":"unit","name":"oignon"},
        {"quantity":200,"unit":"ml","name":"lait de coco"},
        {"quantity":1,"unit":"tbsp","name":"curry"},
        {"quantity":1,"unit":"tbsp","name":"huile"}
    ]'::jsonb,
    '[
        {"step_number":1,"instruction":"Faites revenir l’oignon émincé dans l’huile."},
        {"step_number":2,"instruction":"Ajoutez le poulet et faites dorer."},
        {"step_number":3,"instruction":"Ajoutez le curry et mélangez."},
        {"step_number":4,"instruction":"Versez le lait de coco et laissez mijoter 15 minutes."}
    ]'::jsonb,
    '30',
    '3',
    'Moyen',
    'https://img.cuisineaz.com/1200x675/2013/12/20/i33528-riz-au-curry.jpg',
    'omnivore',
    'halal',
    'salé'
),
-- Soufflé au fromage
(
    'f1a2b3c4-e444-4c6c-b165-d1d83e85c444',
    'db937cac-d99d-4b0d-bd4b-6e23438589ba',
    '1464d31d-6ca3-4d0e-af41-1b1c46b3d271',
    'Soufflé au fromage',
    'Une recette technique qui demande précision pour obtenir une texture aérienne parfaite.',
    '[
        {"quantity":50,"unit":"g","name":"beurre"},
        {"quantity":50,"unit":"g","name":"farine"},
        {"quantity":300,"unit":"ml","name":"lait"},
        {"quantity":100,"unit":"g","name":"fromage râpé"},
        {"quantity":4,"unit":"unit","name":"oeufs"}
    ]'::jsonb,
    '[
        {"step_number":1,"instruction":"Préparer une béchamel."},
        {"step_number":2,"instruction":"Ajouter le fromage et les jaunes d’oeufs."},
        {"step_number":3,"instruction":"Monter les blancs en neige."},
        {"step_number":4,"instruction":"Incorporer délicatement les blancs."},
        {"step_number":5,"instruction":"Cuire immédiatement au four sans ouvrir la porte."}
    ]'::jsonb,
    '60',
    '4',
    'Difficile',
    'https://assets.tmecosys.com/image/upload/t_web_rdp_recipe_584x480/img/recipe/ras/Assets/9954ddb7-2537-45de-bf1b-077db5c2d0a9/Derivates/e763096b-b55b-4b2f-916f-fea24d635e0d.jpg',
    'végétarien',
    'aucun',
    'salé'
),
-- Pasta Carbonara
(
    'a1b2c3d4-e111-4c6c-b165-d1d83e85b111',
    'cbaacdb3-0798-4235-9272-733e22615f2e',
    'ac94e4f6-4895-47bb-b8e0-88e754052db7',
    'Pâtes Carbonara',
    'Un grand classique italien crémeux et savoureux, parfait pour un repas rapide et réconfortant.',
    '[
        {"quantity":200,"unit":"g","name":"spaghetti"},
        {"quantity":100,"unit":"g","name":"lardons"},
        {"quantity":2,"unit":"unit","name":"oeufs"},
        {"quantity":50,"unit":"g","name":"parmesan"},
        {"quantity":1,"unit":"pinch","name":"poivre"}
    ]'::jsonb,
    '[
        {"step_number":1,"instruction":"Faites cuire les pâtes dans de l’eau bouillante salée."},
        {"step_number":2,"instruction":"Faites revenir les lardons dans une poêle."},
        {"step_number":3,"instruction":"Mélangez les œufs et le parmesan."},
        {"step_number":4,"instruction":"Ajoutez les pâtes aux lardons hors du feu."},
        {"step_number":5,"instruction":"Incorporez le mélange œufs/fromage et mélangez rapidement."}
    ]'::jsonb,
    '20',
    '2',
    'Facile',
    'https://littlespoonfarm.com/wp-content/uploads/2024/07/Pasta-Carbonara-Recipe.jpg',
    'omnivore',
    'aucun',
    'salé'
)
