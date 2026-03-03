"use strict";


class Rating {
    constructor(data) {

        this.id = data.id_rating;
        this.userId = data.user_id;
        this.recipeId = data.recipe_id;
        this.score = data.score;
        this.createdAt = data.created_at; 
    }

    static fromDatabase(row) {
        return row ? new Rating(row) : null;
    }

    static fromDatabaseList(rows) {
        return rows.map((row) => new Rating(row));
    }

    toJSON() {
        return {
            id: this.id,
            userId: this.userId,
            recipeId: this.recipeId,
            score: this.score,
            createdAt: this.createdAt,
        };
    }

    toString() {
        return JSON.stringify(this.toJSON());
    }
}

export default Rating;