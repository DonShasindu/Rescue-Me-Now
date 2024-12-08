"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.forgetPasswords = exports.signUp = exports.login = void 0;
const auth_service_1 = require("../services/auth.service");
const login = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const userData = yield (0, auth_service_1.loginUser)(req.body.username, req.body.password);
        res.status(200).json(userData);
    }
    catch (error) {
        res.status(500).json({ error: "Internal Server Error..!" });
    }
});
exports.login = login;
const signUp = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        console.log(req.body);
        (0, auth_service_1.signUpUser)(req.body);
        res.status(200).json({ message: "User created successfully" });
    }
    catch (error) {
        res.status(500).json({ error: "Internal Server Error..!" });
    }
});
exports.signUp = signUp;
const forgetPasswords = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const password = yield (0, auth_service_1.forgotPassword)(req.params.contactNumber);
        res.status(200).json({ password: password });
    }
    catch (error) {
        res.status(500).json({ error: "Internal Server Error..!" });
    }
});
exports.forgetPasswords = forgetPasswords;
