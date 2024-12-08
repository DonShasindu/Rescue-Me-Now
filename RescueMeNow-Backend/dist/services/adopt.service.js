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
exports.getAdopter = exports.isAdopted = exports.addAdopt = void 0;
const firestore_1 = require("firebase/firestore");
const firebase_1 = __importDefault(require("../config/firebase"));
const db = (0, firestore_1.getFirestore)(firebase_1.default);
const addAdopt = (adoptData) => __awaiter(void 0, void 0, void 0, function* () {
    const adopt = (0, firestore_1.doc)(db, "adopts", adoptData.ownerUsername);
    const data = yield (0, firestore_1.getDoc)(adopt);
    if (data.exists()) {
        throw new Error("Adopt already exists");
    }
    else {
        yield (0, firestore_1.addDoc)((0, firestore_1.collection)(db, "adopts"), adoptData);
    }
});
exports.addAdopt = addAdopt;
const isAdopted = (petId, donorUsername) => __awaiter(void 0, void 0, void 0, function* () {
    const adoptionsCollectionRef = (0, firestore_1.collection)(db, "adopts");
    const adoptsQuery = (0, firestore_1.query)(adoptionsCollectionRef, (0, firestore_1.where)("donorUsername", "==", donorUsername), (0, firestore_1.where)("petId", "==", petId));
    const adoptsQuerySnapshot = yield (0, firestore_1.getDocs)(adoptsQuery);
    return adoptsQuerySnapshot.docs.length > 0;
});
exports.isAdopted = isAdopted;
const getAdopter = (petId) => __awaiter(void 0, void 0, void 0, function* () {
    const adoptionsCollectionRef = (0, firestore_1.collection)(db, "adopts");
    const adoptsQuery = (0, firestore_1.query)(adoptionsCollectionRef, (0, firestore_1.where)("petId", "==", petId));
    const adoptsQuerySnapshot = yield (0, firestore_1.getDocs)(adoptsQuery);
    const data = adoptsQuerySnapshot.docs.map((doc) => doc.data());
    if (data.length === 0) {
        return null;
    }
    const donorUsername = data[0].donorUsername;
    const donorCollectionRef = (0, firestore_1.collection)(db, "donors");
    const donorQuery = (0, firestore_1.query)(donorCollectionRef, (0, firestore_1.where)("username", "==", donorUsername));
    const donorQuerySnapshot = yield (0, firestore_1.getDocs)(donorQuery);
    return donorQuerySnapshot.docs[0].data();
});
exports.getAdopter = getAdopter;
