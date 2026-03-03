"use strict";

import session from "express-session";
import connectPgSession from "connect-pg-simple";
import { pool as pgPool } from "./database.js";
import logger from "./logger.js";

const PgSession = connectPgSession(session);

/**
 * Middleware express-session configuré avec PostgreSQL
 */
export const sessionMiddleware = session({
  secret: process.env.SESSION_SECRET || "CHANGE_ME_IN_PRODUCTION",
  resave: false,
  saveUninitialized: false,
  cookie: {
    secure: process.env.NODE_ENV === "production",
    httpOnly: true,
    sameSite: "lax",
    maxAge: 1000 * 60 * 60 * 24 * 7,
  },
  store: new PgSession({
    pool: pgPool,
    tableName: "user_sessions",
    pruneExpired: true,
    errorLog: (err) => {
      logger.error({ err }, "❌ Erreur store session PostgreSQL");
    },
  }),
});

export const sessionTableConfig = {
  tableName: "user_sessions",
};
