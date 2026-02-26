TRUNCATE TABLE users CASCADE;

SET CLIENT_ENCODING TO 'UTF8';

INSERT INTO users (
    id_user,
    email,
    password_hash,
    name_user,
    role_name,
    gdpr_consent,
    gdpr_consent_date
) VALUES
(
    '830a9585-0f66-4d6e-9023-d1151343471d',
    'admin@fourche.com',
    '785yhg5rFRee75éfe',
    'CheatMoon',
    'admin',
    true,
    '2026-02-26 08:36:44'
),
(
    '4f972169-fe76-4dec-ae3f-1896e460471f',
    'admin2@fourche.com',
    'gRRHhr547RGR5egE6efg',
    'JackdanielLion',
    'admin',
    true,
    '2024-06-24 09:45:56'
),
(
    '355cecd9-598f-42ce-854c-ee5ce64b23e7',
    'admin3@fourche.com',
    'EGGgr4rdeeFEF89g5g5F',
    'DogStar',
    'admin',
    true,
    '2025-04-03 13:56:25'
),
(
    '1c35e3af-2370-4bb1-bfdd-544ee2247e38',
    'admin4@fourche.com',
    '2542guhiejhgujeg5rg48e',
    'StormSunrise',
    'admin',
    true,
    '2023-08-05 04:12:12'
);








INSERT INTO users (
    id_user,
    email,
    password_hash,
    name_user,
    role_name,
    gdpr_consent,
    gdpr_consent_date
) VALUES
(
    'cbaacdb3-0798-4235-9272-733e22615f2e',
    'telemachoskhadra@gmail.com',
    'rg4ro74dog4f75re8gb',
    'CyclePain',
    'member',
    true,
    '2026-01-02 07:14:25'
),
(
    'd31e431c-6f6e-4cc6-861b-6d9095ed5e4e',
    'abidemi.purnama@gmail.com',
    'uFfe86fF8g78e4fe7ef',
    'BraveWitcher',
    'member',
    true,
    '2024-08-22 11:25:32'
),
(
    '471cec1e-1b52-4c9e-bd13-8810ee672ef4',
    'miriam.emilia@gmail.com',
    'htg8htGGE758grg',
    'ZeroSale',
    'member',
    true,
    '2025-02-10 14:36:41'
),
(
    'db937cac-d99d-4b0d-bd4b-6e23438589ba',
    'gabriel.burger@gmail.com',
    'sodaBur9er123456',
    'SkyBurger',
    'member',
    true,
    '2025-12-07 01:25:45'
);

