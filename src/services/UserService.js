"use strict";
import UserRepository from "../repositories/PgUserRepository.js";



class UserService {
    /**
   * Cas métier : récupérer mon profil
   */
    static async getById(userId) {
        return UserRepository.findById(userId);
    }
    /**
   * Cas métier : mettre à jour le profil
   */
    static async updateProfile(userId, data) {
        return UserRepository.update(userId, data);
    }
    /**
   * Cas métier : suppression du compte (RGPD)
   */
    static async deleteAccount(userId) {
        return UserRepository.delete(userId);
    }

    async getProfileStats(userId) {
    return await UserRepository.getProfileStats(userId);
}
}

export default UserService; 
