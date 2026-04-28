"use strict";
// src/config/database.js
import pg from "pg";
import { logger } from "./logger.js";

const { Pool } = pg;

// Vérification de sécurité au démarrage
if (!process.env.DATABASE_URL) {
    const errorMsg =
      "La variable DATABASE_URL est manquante dans le fichier .env ";
    logger.fatal(errorMsg); // Log critique
    throw new Error(errorMsg);
}

export const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  // Nécessaire si la DB est en ligne (Render, Neon, Vercel, Supabase)
  ssl:
    process.env.NODE_ENV === "production"
      ? { rejectUnauthorized: false }
      : false,
  max: 20,
  idleTimeoutMillis: 30000,
});

// Événements du pool pour le monitoring
pool.on("connect", () => {
  logger.debug("🐘 PostgreSQL connected");
});

pool.on("error", (err) => {
  (logger.error({ err }), "❌ Unexpected error on idle database client");
  process.exit(-1); // En cas de perte critique de DB, mieux vaut redémarrer l'app
});

export default pool;
