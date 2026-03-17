"use strict";


class User {
    constructor(data) {
        this.id = data.id_user;
        this.email = data.email;
        this.passwordHash = data.password_hash;
        this.nameUser = data.name_user;
        this.roleName = data.role_name;
        this.gdprConsent = data.gdpr_consent;
        this.gdprConsentDate = data.gdpr_consent_date;
        this.createdAt = data.created_at;
        this.updatedAt = data.updated_at;

        // Statistiques (si agrégation effectuée)
        if (data.recipes_count !== undefined) {
            this.recipesCount = parseInt(data.recipes_count, 10);
        }
        if (data.favorites_count !== undefined) {
            this.favoritesCount = parseInt(data.favorites_count, 10);
        }

        if (data.comments_count !== undefined) {
        this.commentsCount = parseInt(data.comments_count, 10);
        }

        if (data.ratings_count !== undefined) {
        this.ratingsCount = parseInt(data.ratings_count, 10);
        }

    }

    static fromDatabase(row) {
        return row ? new User(row) : null;
    }

    static fromDatabaseList(rows) {
        return rows.map((row) => new User(row));
    }

    toJSON() {
        return {
            id: this.id,
            email: this.email,
            nameUser: this.nameUser,
            roleName: this.roleName,
            gdprConsent: this.gdprConsent,
            createdAt: this.createdAt,
            updatedAt: this.updatedAt,

            ...(this.recipesCount !== undefined && { recipesCount: this.recipesCount }),
            ...(this.favoritesCount !== undefined && { favoritesCount: this.favoritesCount }),
            ...(this.commentsCount !== undefined && { commentsCount: this.commentsCount }),
            ...(this.ratingsCount !== undefined && { ratingsCount: this.ratingsCount }),
        };
    }

    toString() {
        return JSON.stringify(this.toJSON());
    }
}

export default User;