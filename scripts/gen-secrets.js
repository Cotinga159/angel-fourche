import crypto from "crypto";
import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";
const __dirname = path.dirname(fileURLToPath(import.meta.url));
const envPath = path.join(__dirname, "..", ".env");
const PROD_MODE = process.argv.includes("--prod");
const secrets = {
SESSION_SECRET: crypto.randomBytes(64).toString("hex"),
CSRF_SECRET: crypto.randomBytes(64).toString("hex"),
DB_PASSWORD: crypto.randomBytes(24).toString("base64url"),
DB_APP_PASSWORD: crypto.randomBytes(24).toString("base64url"),
};
if (PROD_MODE) {
console.log("\nSecrets pour la production :\n");
console.log(" Ne PAS mettre de guillemets autour des valeurs.\n");
for (const [key, value] of Object.entries(secrets)) {
console.log(`${key}=${value}`);
}
process.exit(0);
}
// Mode dev : mise à jour du .env local
if (!fs.existsSync(envPath)) {
console.error("❌ .env introuvable, créez-le depuis .env.example");
process.exit(1);
}
let envContent = fs.readFileSync(envPath, "utf-8");
for (const [key, value] of Object.entries(secrets)) {
const regex = new RegExp(`^${key}=.*$`, "m");

const newLine = `${key}='${value}'`;
if (envContent.match(new RegExp(`^${key}=`, "m"))) {
envContent = envContent.replace(regex, newLine);
} else {
envContent += `\n${newLine}`;
}
}
fs.writeFileSync(envPath, envContent, "utf-8");
console.log("✅ .env mis à jour");