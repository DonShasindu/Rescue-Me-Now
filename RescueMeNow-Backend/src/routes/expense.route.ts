import { Router } from "express";
import { addExpense, getExpenses } from "../controllers/expense.controller";

const router: Router = Router();

router.get("/:ownerUsername/:donorUsername", getExpenses);
router.post("/", addExpense);

export default router;

