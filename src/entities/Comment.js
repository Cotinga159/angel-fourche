"use strict";


class Comment {
    constructor(data) {

        this.id = data.id_comment;
        this.userId = data.user_id;
        this.recipeId = data.recipe_id;
        this.content = data.content;
        this.createdAt = data.created_at;

        // Relations optionnelles si JOIN effectué
        if (data.user_pseudo) {
            this.user = { id: data.user_id, pseudo: data.user_pseudo, email: data.user_email }
        }
    }

    static fromDatabase(row) {
        return row ? new Comment(row) : null;
    }

    static fromDatabaseList(rows) {
        return rows.map((row) => new Comment(row));
    }

    toJSON() {
        return{
            id: this.id,
            userId: this.userId,
            recipeId: this.recipeId,
            content: this.content,
            createdAt: this.createdAt,
        };
    }

    toString() {
        return JSON.stringify(this.toJSON());
    }
}

export default Comment;
