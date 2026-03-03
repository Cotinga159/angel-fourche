"use strict";


class Recipe {
    constructor(data) {

        this.id = data.id_recipe;
        this.userId = data.user_id;
        this.categoryId = data.category_id;
        this.title = data.title;
        this.description = data.description;
        this.ingredient = data.ingredient;
        this.step = data.step;
        this.preparationTime = data.preparation_time;
        this.serving = data.serving;
        this.difficulty = data.difficulty;
        this.picture = data.picture;
        this.typeDiet = data.type_diet;
        this.dietReligious = data.diet_religious;
        this.typeFlavor = data.type_flavor;
        this.createdAt = data.created_at;
        this.updatedAt = data.updated_at;

        // Counts depuis vues
        if (data.comments_count !== undefined) {
            this.commentsCount = parseInt(data.comments_count, 10);
        }
        if (data.favorites_count !== undefined) {
            this.favoritesCount = parseInt(data.favorites_count, 10);
        }
        if (data.average_rating !== undefined) {
            this.averageRating = parseFloat(data.average_rating);
        }


        // Relations optionnelles
        if (data.user_pseudo) {
            this.author = { id: data.user_id, pseudo: data.user_pseudo, email: data.user_email };
        }
        if (data.category_name) { 
            this.category = { id: data.category_id, name: data.category_name};
        }
        if (data.comments_list) {
            this.comments = data.comments_list.map(c => new Comment(c));
        }
    }

    static fromDatabase(row) {
        return row ? new Recipe(row) : null;
    }

    static fromDatabaseList(rows) {
        return rows.map((row) => new Recipe(row));
    }

    toJSON() {
        return {
            id: this.id,
            userId: this.userId,
            categoryId: this.categoryId,
            title: this.title,
            description: this.description,
            ingredient: this.ingredient,
            step: this.step,
            preparationTime: this.preparationTime,
            serving: this.serving,
            difficulty: this.difficulty,
            picture: this.picture,
            typeDiet: this.typeDiet,
            dietReligious: this.dietReligious,
            ...(this.commentsCount !== undefined && { commentsCount: this.commentsCount }),
            ...(this.favoritesCount !== undefined && { favoritesCount: this.favoritesCount }),
        }
    }

    toString() {
        return JSON.stringify(this.toJSON());
    }
}

export default Recipe;