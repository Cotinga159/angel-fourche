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
)


