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

        // Relation optionnelles si JOIN ou vue
        if (data.recipes_list) this.recipes = data.recipes_list.map(r => new Recipe(r));
        if (data.favorites_list) this.favorites = data.favorites_list.map(r => Recipe(r));
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
        };
    }

    toString() {
        return JSON.stringify(this.toJSON());
    }
}

export default User;