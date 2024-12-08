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
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.getExpensesByOwnerUsernameAndDonorUsername = exports.addExpenses = void 0;
const firestore_1 = require("firebase/firestore");
const firebase_1 = __importDefault(require("../config/firebase"));
const db = (0, firestore_1.getFirestore)(firebase_1.default);
const addExpenses = (expenseData) => __awaiter(void 0, void 0, void 0, function* () {
    const expenseCollectionRef = (0, firestore_1.collection)(db, "expenses");
    const expenseDoc = yield (0, firestore_1.addDoc)(expenseCollectionRef, expenseData);
    return expenseDoc;
});
exports.addExpenses = addExpenses;
const getExpensesByOwnerUsernameAndDonorUsername = (username, donorUsername) => __awaiter(void 0, void 0, void 0, function* () {
    const expensesCollectionRef = (0, firestore_1.collection)(db, "expenses");
    const expensesQuery = (0, firestore_1.query)(expensesCollectionRef, (0, firestore_1.where)("ownerUsername", "==", username), (0, firestore_1.where)("donorUsername", "==", donorUsername));
    const expensesQuerySnapshot = yield (0, firestore_1.getDocs)(expensesQuery);
    return expensesQuerySnapshot.docs.map((doc) => doc.data());
});
exports.getExpensesByOwnerUsernameAndDonorUsername = getExpensesByOwnerUsernameAndDonorUsername;
