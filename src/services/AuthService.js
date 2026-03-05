"use strict";
import UserRepository from "../repositories/PgUserRepository.js";
import { hashPassword, verifyPassword } from "../utils/passwordHelper.js";



class AuthService {

    static async register({ email, password, nameUser, gdprConsent }) {
    if (await UserRepository.existsByEmail(email)) {
        throw new Error("Cet email est déjà utilisé.");
    }

    if (await UserRepository.existsByNameUser(nameUser)) {
        throw new Error("Ce nom d'utilisateur est déjà utilisé.");
    }

    const passwordHash = await hashPassword(password);

    return UserRepository.create({
        email,
        passwordHash,
        name_user: nameUser,
        gdpr_consent: gdprConsent,
    });
    }

        static async login({ email, password }) {
    const user = await UserRepository.findByEmail(email);

    const isValid = await verifyPassword(user.passwordHash, password);

    if (!isValid) {
        throw new Error("Identifiants invalides.");
    }

    return user;
    }
}

export default AuthService;