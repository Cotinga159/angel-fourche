"use strict";
import UserRepository from "../repositories/PgUserRepository.js";
import { hashPassword, verifyPassword } from "../utils/passwordHelper.js";



class AuthService {

    static async register({ email, password, passwordConfirm, nameUser, gdprConsent }) {
    if (password !== passwordConfirm) {
        throw new Error("Les mots de passe ne correspondent pas.");
    }

    if (!password || password.length < 8) {
        throw new Error("Le mot de passe doit contenir au moins 8 caractères.");
    }

    const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]).{8,}$/;
    if (!passwordRegex.test(password)) {
        throw new Error("Le mot de passe doit contenir au moins une majuscule, une minuscule, un chiffre et un caractère spécial (!@#$%...).");
    }

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
        nameUser,
        gdprConsent,
    });
}

    static async login({ email, password }) {
        const user = await UserRepository.findByEmailOrUsername(email);
        if (!user) {
            throw new Error("Identifiants invalides.");
        }
        const isValid = await verifyPassword(user.passwordHash, password);
        if (!isValid) {
            throw new Error("Identifiants invalides.");
        }
        return user;
}
}

export default AuthService;