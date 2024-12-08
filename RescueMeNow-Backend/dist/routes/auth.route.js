"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const auth_controller_1 = require("../controllers/auth.controller");
const router = (0, express_1.Router)();
router.post("/login", auth_controller_1.login);
router.post("/signUp", auth_controller_1.signUp);
router.get("/:contactNumber", auth_controller_1.forgetPasswords);
exports.default = router;
