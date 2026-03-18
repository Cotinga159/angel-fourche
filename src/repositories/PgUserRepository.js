"use strict";

import db from "../config/database.js";
import User from "../entities/User.js";


    class UserRepository {
    /**
   * Retourne un utilisateur par son identifiant (usage interne)
   * ⚠️ Peut contenir password_hash
   *
   * @param {string} id - UUIDv7
   * @returns {Promise<User|null>}
   */
    static async findById(id) {
        const query = /*sql*/ `
            SELECT
            id_user,
            email,
            password_hash,
            name_user,
            role_name,
            gdpr_consent,
            gdpr_consent_date,
            created_at,
            updated_at
        FROM users
        WHERE id_user = $1;
    `;

    const { rows } = await db.query(query, [id]);
    return rows[0] ? new User(rows[0]) : null;
    }

    /**
   * Retourne un utilisateur par email (authentification)
   *
   * @param {string} email
   * @returns {Promise<User|null>}
   */
    static async findByEmail(email) {
        const query = /*sql*/ `
            SELECT
            id_user,
            email,
            password_hash,
            name_user,
            role_name,
            gdpr_consent,
            gdpr_consent_date,
            created_at,
            updated_at
        FROM users
        WHERE LOWER(email) = LOWER($1);
        `;

        const { rows } = await db.query(query, [email]);
        return rows[0] ? new User(rows[0]) : null;
    }


    static async findByEmailOrUsername(identifier) {
    const query = /*sql*/ `
        SELECT
            id_user,
            email,
            password_hash,
            name_user,
            role_name,
            gdpr_consent,
            gdpr_consent_date,
            created_at,
            updated_at
        FROM users
        WHERE LOWER(email) = LOWER($1)
            OR LOWER(name_user) = LOWER($1);
    `;
    const { rows } = await db.query(query, [identifier]);
    return rows[0] ? new User(rows[0]) : null;
}

    /**
   * Profil utilisateur avec statistiques
   * ⚠️ Lecture via vue SQL
   *
   * @param {string} id - UUIDv7
   * @returns {Promise<User|null>}
   * @see database/views/v_user_stats.sql
   */
    static async findProfilWithStats(id) {
        const query = /*sql*/ `
        SELECT *
        FROM v_user_profile_stats
        WHERE id_user = $1;
        `;

        const { rows } = await db.query(query, [id]);
        return rows[0] ? new User(rows[0]) : null;
    }
    /**
   * Vérifie si un email existe
   * @param {string} email
   * @returns {Promise<boolean>}
   */
    static async existsByEmail(email) {
        const query = /*sql*/ `
        SELECT EXISTS (
            SELECT 1 FROM users
            WHERE LOWER(email) = LOWER($1)
        ) AS exists;
        `;

        const { rows } = await db.query(query, [email]);
        return rows[0].exists;
    }
  /**
   * Vérifie si un nom d'utilisateur qui existe
   * @param {string} nameUser
   * @returns {Promise<boolean>}
   */
    static async existsByNameUser(nameUser) {
        const query = /*sql*/ `
        SELECT EXISTS (
            SELECT 1 FROM users
            WHERE LOWER(name_user) = LOWER($1)
        ) AS exists;
        `;

        const { rows } = await db.query(query, [nameUser]);
        return rows[0].exists;
    }

    /**
   * Crée un nouvel utilisateur
   *
   * @param {object} data
   * @returns {Promise<User>}
   */
    static async create(data) {
        const query = /*sql*/ `
        INSERT INTO users (
            email,
            password_hash,
            name_user,
            gdpr_consent
        )
        VALUES ($1, $2, $3, $4)
        RETURNING
            id_user,
            email,
            name_user,
            role_name,
            gdpr_consent,
            gdpr_consent_date,
            created_at,
            updated_at
        `;

        const values = [
            data.email.toLowerCase().trim(),
            data.passwordHash,
            data.nameUser.trim(),
            data.gdprConsent,
        ];

        const { rows } = await db.query(query, values);
        return new User(rows[0]);
    }

    /**
   * Met à jour un utilisateur
   *
   * @param {string} id
   * @param {object} data
   * @returns {Promise<User|null>}
   */
    static async update(id, data) {
        const query = /*sql*/ `
        UPDATE users
        SET
            email = COALESCE($1, email),
            password_hash = COALESCE($2, password_hash),
            name_user = COALESCE($3, name_user),
            updated_at = NOW()
        WHERE id_user = $4
        RETURNING
            id_user,
            email,
            name_user,
            role_name,
            gdpr_consent,
            gdpr_consent_date,
            created_at,
            updated_at
        `;

        const values = [
            data.email?.toLowerCase().trim(),
            data.passwordHash,
            data.nameUser?.trim(),
            id,
        ];

        const { rows } = await db.query(query, values);
        return rows[0] ? new User(rows[0]) : null;
    }
    /**
   * Supprime un utilisateur (RGPD)
   *
   * @param {string} id
   * @returns {Promise<boolean>}
   */
    static async delete(id) {
        const result = await db.query(`DELETE FROM users WHERE id_user = $1`, [
            id,
        ]);

        return result.rowCount > 0;
    }
}

export default UserRepository;
