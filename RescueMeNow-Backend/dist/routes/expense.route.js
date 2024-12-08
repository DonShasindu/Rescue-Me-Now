"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const expense_controller_1 = require("../controllers/expense.controller");
const router = (0, express_1.Router)();
router.get("/:ownerUsername/:donorUsername", expense_controller_1.getExpenses);
router.post("/", expense_controller_1.addExpense);
exports.default = router;
