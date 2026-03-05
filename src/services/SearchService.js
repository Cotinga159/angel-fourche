"use strict";

import RecipeRepository from "../repositories/PgRecipeRepository.js";

class SearchService {

    static async search(userId, term) {
    if (!term || term.trim().length < 2) {
        return [];
    }

    return RecipeRepository.search(userId, term.trim());
    }
}

export default SearchService;