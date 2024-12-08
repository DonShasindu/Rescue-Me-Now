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
exports.getPetsByPublishStatus = exports.getPetOwnerByUsername = exports.getPetsByStatus = exports.updatePet = exports.getPetsByUsername = exports.createPet = void 0;
const firebase_1 = __importDefault(require("../config/firebase"));
const firestore_1 = require("firebase/firestore");
const axios_1 = __importDefault(require("axios"));
const db = (0, firestore_1.getFirestore)(firebase_1.default);
const createPet = (petData) => __awaiter(void 0, void 0, void 0, function* () {
    const petDocRef = (0, firestore_1.collection)(db, "pets");
    const petDoc = yield (0, firestore_1.addDoc)(petDocRef, petData);
    return petDoc;
});
exports.createPet = createPet;
const getPetsByUsername = (username) => __awaiter(void 0, void 0, void 0, function* () {
    const petsCollectionRef = (0, firestore_1.collection)(db, "pets");
    const petsQuery = (0, firestore_1.query)(petsCollectionRef, (0, firestore_1.where)("ownerUsername", "==", username));
    const petsQuerySnapshot = yield (0, firestore_1.getDocs)(petsQuery);
    return petsQuerySnapshot.docs[0].data();
});
exports.getPetsByUsername = getPetsByUsername;
const updatePet = (petData) => __awaiter(void 0, void 0, void 0, function* () {
    /// ***************************  model implementation  ************************
    // let label = "";
    // axios.post("http://localhost:5000/pet", /* Pass Your Model Inputs */).then((res) => {
    //   label = res.data.label; // Get the label from the response
    // }).catch((err) => {
    //   console.log(err);
    // });
    // petData.label = label; // Set the label to the petData
    /// ***************************  model implementation  ************************
    console.log("come");
    let label = "";
    const payload = {
        Age: 40,
        Medicines: 90,
        Food: 90,
        Monitory: 2,
        Breed: 'Mixed Breed',
        Sex: 'Female',
        "Vaccinations Status": 'Yes'
    };
    const url = 'http://127.0.0.1:9090/predict';
    yield axios_1.default.post(url, payload, {
        headers: {
            'Content-Type': 'application/json'
        }
    })
        .then(response => {
        label = response.data.Predictions;
        console.log('Response:', response.data);
    })
        .catch(error => {
        console.error('Error:', error);
    });
    petData.label = label;
    console.log(petData.label);
    const petsCollectionRef = (0, firestore_1.collection)(db, "pets");
    const petsQuery = (0, firestore_1.query)(petsCollectionRef, (0, firestore_1.where)("ownerUsername", "==", petData.ownerUsername));
    const petsQuerySnapshot = yield (0, firestore_1.getDocs)(petsQuery);
    const petDoc = (0, firestore_1.doc)(db, "pets", petsQuerySnapshot.docs[0].id);
    const data = yield (0, firestore_1.updateDoc)(petDoc, petData);
    return data;
    return label;
});
exports.updatePet = updatePet;
const getPetsByStatus = (status) => __awaiter(void 0, void 0, void 0, function* () {
    const petsCollectionRef = (0, firestore_1.collection)(db, "pets");
    const petsQuery = (0, firestore_1.query)(petsCollectionRef, (0, firestore_1.where)("isVerified", "==", status == "true" ? true : false));
    const petsQuerySnapshot = yield (0, firestore_1.getDocs)(petsQuery);
    console.log(petsQuerySnapshot.docs.map((doc) => doc.data()));
    if (petsQuerySnapshot.docs.length == 0) {
        return [];
    }
    return petsQuerySnapshot.docs.map((doc) => doc.data());
});
exports.getPetsByStatus = getPetsByStatus;
const getPetOwnerByUsername = (username) => __awaiter(void 0, void 0, void 0, function* () {
    const petsCollectionRef = (0, firestore_1.collection)(db, "petOwners");
    const petsQuery = (0, firestore_1.query)(petsCollectionRef, (0, firestore_1.where)("username", "==", username));
    const petsQuerySnapshot = yield (0, firestore_1.getDocs)(petsQuery);
    return petsQuerySnapshot.docs[0].data();
});
exports.getPetOwnerByUsername = getPetOwnerByUsername;
const getPetsByPublishStatus = (status) => __awaiter(void 0, void 0, void 0, function* () {
    const petsCollectionRef = (0, firestore_1.collection)(db, "pets");
    const petsQuery = (0, firestore_1.query)(petsCollectionRef, (0, firestore_1.where)("isVerified", "==", status == "true" ? true : false), (0, firestore_1.where)("isPublished", "==", status == "true" ? true : false));
    const petsQuerySnapshot = yield (0, firestore_1.getDocs)(petsQuery);
    console.log(petsQuerySnapshot.docs.map((doc) => doc.data()));
    return petsQuerySnapshot.docs.map((doc) => doc.data());
});
exports.getPetsByPublishStatus = getPetsByPublishStatus;
