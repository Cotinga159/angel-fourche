"use strict";
// src/database/migrations/nukeAll.js
// Version production — supprime tout le schéma applicatif
// La BDD et le user restent intacts (gérés par l'hébergeur)

import { pool } from "../../config/database.js";
import { logger } from "../../config/logger.js";
import fs from "node:fs/promises";
import path from "node:path";
import readline from "node:readline";

const __dirname = import.meta.dirname;
const rootDir = path.join(__dirname, "..", "..", "..");

function askConfirmation(question) {
  const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
  });
  return new Promise((resolve) => {
    rl.question(question, (answer) => {
      rl.close();
      resolve(answer.trim());
    });
  });
}

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

async function executeRaw(sql, description) {
  const client = await pool.connect();
  try {
    logger.info(`➜ ${description}`);
    await client.query(sql);
    logger.info(`✅ Done`);
  } finally {
    client.release();
  }
}

async function nukeAll() {
  console.log(`
\x1b[31m☢️  MEMORIA - NUCLEAR OPTION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Ceci va supprimer :
  ✗ Toutes les vues
  ✗ Tous les triggers & fonctions
  ✗ Toutes les tables (et leurs données)
  ✗ Tous les types énumérés

Ceci NE supprime PAS :
  ✓ La base de données (gérée par l'hébergeur)
  ✓ Le rôle utilisateur (géré par l'hébergeur)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\x1b[0m
  `);

  const confirm = await askConfirmation(
    '\x1b[33mTapez "NUKE" pour confirmer : \x1b[0m',
  );

  if (confirm !== "NUKE") {
    console.log("\x1b[32m✓ Opération annulée. Rien n'a été supprimé.\x1b[0m");
    process.exit(0);
  }

  console.log("\n\x1b[31m🚀 Destruction en cours...\x1b[0m\n");

  // Phase 1 : Vues
  logger.info("📊 Suppression des vues...");
  await executeRaw(
    `DO $$ DECLARE r RECORD;
     BEGIN
       FOR r IN (SELECT viewname FROM pg_views WHERE schemaname = 'public') LOOP
         EXECUTE 'DROP VIEW IF EXISTS public.' || quote_ident(r.viewname) || ' CASCADE';
       END LOOP;
     END $$;`,
    "Drop all views",
  );

  // Phase 2 : Tables
  logger.info("🗄️  Suppression des tables...");
  await executeSqlFile(
    path.join(rootDir, "database/migrations/drop/01_drop_all_tables.sql"),
    "Drop all tables",
  );

  // Phase 3 : Types
  logger.info("🔤 Suppression des types...");
  await executeSqlFile(
    path.join(rootDir, "database/migrations/drop/02_drop_all_types.sql"),
    "Drop all types",
  );

  // Phase 4 : Fonctions & triggers
  logger.info("🛠️  Suppression des fonctions & triggers...");
  await executeRaw(
    `DO $$ DECLARE r RECORD;
     BEGIN
       FOR r IN (
         SELECT routine_name
         FROM information_schema.routines
         WHERE routine_schema = 'public'
         AND routine_type = 'FUNCTION'
         AND routine_name NOT IN (
           SELECT p.proname
           FROM pg_proc p
           JOIN pg_depend d ON d.objid = p.oid
           JOIN pg_extension e ON e.oid = d.refobjid
           WHERE d.deptype = 'e'
         )
       ) LOOP
         EXECUTE 'DROP FUNCTION IF EXISTS public.' || quote_ident(r.routine_name) || ' CASCADE';
       END LOOP;
     END $$;`,
    "Drop user-defined functions & triggers",
  );

  console.log(`
\x1b[32m✨ Destruction complète. La base est vide.\x1b[0m
  `);

  const rebuild = await askConfirmation(
    "\x1b[33mRelancer db:migrate pour tout reconstruire ? (y/N) : \x1b[0m",
  );

  if (rebuild.match(/^[OoYy]$/)) {
    console.log("\n\x1b[34m🔄 Reconstruction en cours...\x1b[0m\n");
    const { default: runAllMigrations } = await import("./runAll.js");
    await runAllMigrations();
  } else {
    console.log(
      "\x1b[34mBase laissée vide. Lancez npm run db:migrate quand vous êtes prêt.\x1b[0m",
    );
  }
}

nukeAll()
  .catch((err) => {
    logger.fatal({ err }, "💥 NUKE FAILED");
    process.exit(1);
  })
  .finally(() => {
    pool.end();
  });
