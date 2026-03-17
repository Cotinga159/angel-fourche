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
    '$argon2id$v=19$m=65536,t=3,p=4$WuI9KbLGnjvAIyPFk+QR3Q$Hc9aJ7Fcka1x0oSLNQ3h0wRDsZwMfC2kJzddb7O6U78',
    'CheatMoon',
    'admin',
    true,
    '2026-02-26 08:36:44'
),
(
    '4f972169-fe76-4dec-ae3f-1896e460471f',
    'admin2@fourche.com',
    '$argon2id$v=19$m=65536,t=3,p=4$gjdJvFsWzcumv91Co3wZRg$Az7ATJFdgb9RziGaUXV917416sbs/0EUDZ5VYPBuT6c',
    'JackdanielLion',
    'admin',
    true,
    '2024-06-24 09:45:56'
),
(
    '355cecd9-598f-42ce-854c-ee5ce64b23e7',
    'admin3@fourche.com',
    '$argon2id$v=19$m=65536,t=3,p=4$MC2z1dh5S1+D3HDgMktmsw$lRPHhm7a7YuOBdMQIDYA7e4YmKPW7qsSgdQ63cIp9XA',
    'DogStar',
    'admin',
    true,
    '2025-04-03 13:56:25'
),
(
    '1c35e3af-2370-4bb1-bfdd-544ee2247e38',
    'admin4@fourche.com',
    '$argon2id$v=19$m=65536,t=3,p=4$DJo8EcD0soc1z9P9LMX41w$UugWTOnXeNv16ZqeSLqnJ3PuNQhaqIIdXpZBQTh1JEU',
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
    '$argon2id$v=19$m=65536,t=3,p=4$kFQhIO+IPtmFKLV8hFJRdg$y4ChUXk3dBq0vIBmcor7r8EHNXPSFKORKimP9HYVAnY',
    'CyclePain',
    'member',
    true,
    '2026-01-02 07:14:25'
),
(
    'd31e431c-6f6e-4cc6-861b-6d9095ed5e4e',
    'abidemi.purnama@gmail.com',
    '$argon2id$v=19$m=65536,t=3,p=4$vjcEGQAUa5+BE6RxTe8eJg$s0Ojkf1A7csY2zPsyheFGit0uy7fW/ZZmVyTu8vw+Fk',
    'BraveWitcher',
    'member',
    true,
    '2024-08-22 11:25:32'
),
(
    '471cec1e-1b52-4c9e-bd13-8810ee672ef4',
    'miriam.emilia@gmail.com',
    '$argon2id$v=19$m=65536,t=3,p=4$6QJvZtAttqDKM6ub2Z3q6g$b7YVSeZCN9981CuPLj3l+RcuuG5xXn144knWTiYL2vM',
    'ZeroSale',
    'member',
    true,
    '2025-02-10 14:36:41'
),
(
    'db937cac-d99d-4b0d-bd4b-6e23438589ba',
    'gabriel.burger@gmail.com',
    '$argon2id$v=19$m=65536,t=3,p=4$m4n44IW2blb8XXJplzAYNA$67CpJwfa2rked0H5RxuS7SZo1AmyYUPwFLhr5SmNQxg',
    'SkyBurger',
    'member',
    true,
    '2025-12-07 01:25:45'
);

