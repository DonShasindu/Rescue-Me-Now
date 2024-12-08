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
exports.getExpenses = exports.addExpense = void 0;
const expense_service_1 = require("../services/expense.service");
const addExpense = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        yield (0, expense_service_1.addExpenses)(req.body);
        res.status(200).json({ message: "Pet added successfully" });
    }
    catch (error) {
        res.status(500).json({ error: "Internal Server Error..!" });
    }
});
exports.addExpense = addExpense;
const getExpenses = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const expenses = yield (0, expense_service_1.getExpensesByOwnerUsernameAndDonorUsername)(req.params.ownerUsername, req.params.donorUsername);
        res.status(200).json(expenses);
    }
    catch (error) {
        res.status(500).json({ error: "Internal Server Error..!" });
    }
});
exports.getExpenses = getExpenses;
