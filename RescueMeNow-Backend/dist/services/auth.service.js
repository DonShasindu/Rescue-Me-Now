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
exports.forgotPassword = exports.signUpUser = exports.loginUser = void 0;
const firebase_1 = __importDefault(require("../config/firebase"));
const firestore_1 = require("firebase/firestore");
const db = (0, firestore_1.getFirestore)(firebase_1.default);
const loginUser = (username, password) => __awaiter(void 0, void 0, void 0, function* () {
    const usersCollectionRef = (0, firestore_1.collection)(db, "users");
    const userQuery = (0, firestore_1.query)(usersCollectionRef, (0, firestore_1.where)("username", "==", username));
    const userQuerySnapshot = yield (0, firestore_1.getDocs)(userQuery);
    console.log(userQuerySnapshot.docs[0].data());
    if (!userQuerySnapshot.empty &&
        userQuerySnapshot.docs[0].data().password === password) {
        const data = userQuerySnapshot.docs[0];
        let roleData;
        switch (data.data().role) {
            case "donor":
                const donorDocRef = (0, firestore_1.collection)(db, "donors");
                const donorQuery = (0, firestore_1.query)(donorDocRef, (0, firestore_1.where)("username", "==", username));
                const donorDocSnapshot = yield (0, firestore_1.getDocs)(donorQuery);
                return donorDocSnapshot.docs[0].data();
            case "petOwner":
                const petOwnerDocRef = (0, firestore_1.collection)(db, "petOwners");
                const petOwnerQuery = (0, firestore_1.query)(petOwnerDocRef, (0, firestore_1.where)("username", "==", username));
                const petOwnerDocSnapshot = yield (0, firestore_1.getDocs)(petOwnerQuery);
                return petOwnerDocSnapshot.docs[0].data();
            case "vet":
                const vetDocRef = (0, firestore_1.collection)(db, "vets");
                const vetQuery = (0, firestore_1.query)(vetDocRef, (0, firestore_1.where)("username", "==", username));
                const vetDocSnapshot = yield (0, firestore_1.getDocs)(vetQuery);
                return vetDocSnapshot.docs[0].data();
            default:
                console.log("Invalid role");
                throw new Error("Invalid role");
        }
    }
    else {
        console.log("User not found");
        throw new Error("User not found");
    }
});
exports.loginUser = loginUser;
const signUpUser = (userData) => __awaiter(void 0, void 0, void 0, function* () {
    const user = (0, firestore_1.doc)(db, "users", userData.username);
    const data = yield (0, firestore_1.getDoc)(user);
    if (data.exists()) {
        throw new Error("User already exists");
    }
    else {
        yield (0, firestore_1.addDoc)((0, firestore_1.collection)(db, "users"), {
            username: userData.username,
            password: userData.password,
            role: userData.role,
        });
        switch (userData.role) {
            case "donor":
                yield (0, firestore_1.addDoc)((0, firestore_1.collection)(db, "donors"), {
                    username: userData.username,
                    password: userData.password,
                    address: userData.address,
                    cityName: userData.cityName,
                    contactNumber: userData.contactNumber,
                    donateType: userData.donateType,
                    role: 'donor',
                });
                break;
            case "petOwner":
                yield (0, firestore_1.addDoc)((0, firestore_1.collection)(db, "petOwners"), {
                    username: userData.username,
                    address: userData.address,
                    cityName: userData.cityName,
                    contactNumber: userData.contactNumber,
                    account: userData.account,
                    role: 'petOwner',
                });
                yield (0, firestore_1.addDoc)((0, firestore_1.collection)(db, "pets"), {
                    ownerUsername: userData.username,
                    regId: '',
                    name: '',
                    age: 0,
                    weight: 0,
                    breed: '',
                    gender: '',
                    food: 0,
                    medicine: 0,
                    money: 0,
                    description: '',
                    image: '',
                    isVerified: false,
                    isPublished: false,
                    vaccined: 'no',
                    category: '',
                    label: '',
                    foodPercentage: 0,
                    medicinePercentage: 0,
                    moneyPercentage: 0,
                });
                break;
            case "vet":
                yield (0, firestore_1.addDoc)((0, firestore_1.collection)(db, "vets"), {
                    username: userData.username,
                    address: "",
                    cityName: "",
                    phoneNumber: "",
                    vetName: "",
                    vetType: "",
                    vetAge: 0,
                    vetGender: "",
                    vetBreed: "",
                    vetWeight: 0,
                    role: 'vet',
                });
                break;
            default:
                throw new Error("Invalid role");
        }
    }
});
exports.signUpUser = signUpUser;
const forgotPassword = (contactNumber) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const donorsCollectionRef = (0, firestore_1.collection)(db, "donors");
        const donorQuery = (0, firestore_1.query)(donorsCollectionRef, (0, firestore_1.where)("contactNumber", "==", contactNumber));
        const donorQuerySnapshot = yield (0, firestore_1.getDocs)(donorQuery);
        if (!donorQuerySnapshot.empty) {
            return donorQuerySnapshot.docs[0].data().password;
        }
        else {
            const petOwnersCollectionRef = (0, firestore_1.collection)(db, "petOwners");
            const petOwnerQuery = (0, firestore_1.query)(petOwnersCollectionRef, (0, firestore_1.where)("contactNumber", "==", contactNumber));
            const petOwnerQuerySnapshot = yield (0, firestore_1.getDocs)(petOwnerQuery);
            if (!petOwnerQuerySnapshot.empty) {
                return petOwnerQuerySnapshot.docs[0].data().password;
            }
            else {
                const vetsCollectionRef = (0, firestore_1.collection)(db, "vets");
                const vetQuery = (0, firestore_1.query)(vetsCollectionRef, (0, firestore_1.where)("contactNumber", "==", contactNumber));
                const vetQuerySnapshot = yield (0, firestore_1.getDocs)(vetQuery);
                if (!vetQuerySnapshot.empty) {
                    return vetQuerySnapshot.docs[0].data().password;
                }
                else {
                    return "User not found";
                }
            }
        }
    }
    catch (e) {
        console.log(e);
    }
});
exports.forgotPassword = forgotPassword;
