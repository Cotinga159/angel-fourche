"use strict";
import UserRepository from "../repositories/PgUserRepository.js";
import { hashPassword, verifyPassword } from "../utils/passwordHelper.js";
import { registerSchema } from "../validators/userValidator.js";


class AuthService {

   static async register(body) {
    const result = registerSchema.safeParse(body);
    if (!result.success) {
        const firstError = result.error.errors[0].message;
        throw new Error(firstError);
    }

    const { email, password, passwordConfirm, nameUser, gdprConsent } = result.data;

    if (password !== passwordConfirm) {
        throw new Error("Les mots de passe ne correspondent pas.");
    }

    if (await UserRepository.existsByEmail(email)) {
        throw new Error("Cet email est déjà utilisé.");
    }

    if (await UserRepository.existsByNameUser(nameUser)) {
        throw new Error("Ce nom d'utilisateur est déjà utilisé.");
    }

    const passwordHash = await hashPassword(password);
    return UserRepository.create({ email, passwordHash, nameUser, gdprConsent });
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