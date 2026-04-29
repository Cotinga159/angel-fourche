"use strict";
// src/database/migrations/runAll.js
// Version production — pour hébergement PostgreSQL standard (AlwaysData, etc.)
// La BDD et le user sont déjà créés par l'hébergeur
// Pour le dev local, utiliser plutôt npm run db:init (qui appelle scripts/init_db.sh)

import { pool } from "../../config/database.js";
import { logger } from "../../config/logger.js";
import fs from "node:fs/promises";
import path from "node:path";

const __dirname = import.meta.dirname;
const rootDir = path.join(__dirname, "..", "..", "..");

async function executeSqlFile(filePath, description) {
  const client = await pool.connect();
  try {
    logger.info(`➜ ${description}`);
    const sql = await fs.readFile(filePath, "utf8");
    await client.query(sql);
    logger.info(`✅ ${path.basename(filePath)} OK`);
  } finally {
    client.release();
  }
}

async function executeDirectory(dirPath, description) {
  try {
    await fs.access(dirPath);
    logger.info(`📂 ${description}: ${dirPath}`);
    const files = await fs.readdir(dirPath);
    const sqlFiles = files
      .filter((file) => file.endsWith(".sql"))
      .sort((a, b) => a.localeCompare(b, undefined, { numeric: true }));
    for (const file of sqlFiles) {
      await executeSqlFile(path.join(dirPath, file), `Executing ${file}`);
    }
  } catch (err) {
    if (err.code === "ENOENT") {
      logger.info(`⏭️  Dossier ${dirPath} inexistant, ignoré`);
      return;
    }
    throw err;
  }
}

async function runAllMigrations() {
  logger.info("🐼 MEMORIA - Database Initialization (Production)");
  logger.info("ℹ️  La BDD et le user sont déjà créés par l'hébergeur");

  // ============================================
  // Extensions
  // ============================================
  logger.info("🔧 Extensions");
  await executeSqlFile(
    path.join(rootDir, "database/migrations/config/03_add_extensions.sql"),
    "Installing extensions",
  );

  // ============================================
  // Types
  // ============================================
  logger.info("🔤 Types");
  await executeSqlFile(
    path.join(rootDir, "database/migrations/config/04_add_types.sql"),
    "Creating custom types",
  );

  // ============================================
  // Triggers
  // ============================================
  logger.info("🛠️ Triggers");
  await executeDirectory(path.join(rootDir, "database/triggers"), "Triggers");

  // ============================================
  // Tables
  // ============================================
  logger.info("🗄️ Tables");
  await executeDirectory(
    path.join(rootDir, "database/migrations/tables"),
    "Tables",
  );

  // ============================================
  // Views
  // ============================================
  logger.info("📊 Views");
  await executeDirectory(path.join(rootDir, "database/views"), "Views");

  logger.info("✅ Memoria database FULLY ready!");
}

// ============================================
// Auto-exécution UNIQUEMENT si lancé directement
// (pas si importé par nukeAll.js)
// ============================================
const isMainModule = import.meta.url === `file://${process.argv[1]}`;

if (isMainModule) {
  runAllMigrations()
    .catch((err) => {
      logger.fatal("💥 MIGRATIONS FAILED:", err);
      process.exit(1);
    })
    .finally(() => {
      pool.end();
    });
}

export default runAllMigrations;
