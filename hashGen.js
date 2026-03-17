import { hash, Algorithm } from "@node-rs/argon2";

const ARGON2_OPTIONS = {
    algorithm: Algorithm.Argon2id,
    memoryCost: 65536,
    timeCost: 3,
    parallelism: 4,
};

const h = await hash("Admin123!", ARGON2_OPTIONS);
console.log(h);