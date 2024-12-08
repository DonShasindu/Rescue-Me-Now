import { Router } from "express";
import { forgetPasswords, login, signUp } from "../controllers/auth.controller";

const router: Router = Router();

router.post("/login", login);
router.post("/signUp", signUp);
router.get("/:contactNumber", forgetPasswords);

export default router;
