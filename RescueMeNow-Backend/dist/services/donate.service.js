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
exports.updateDonors = exports.getDonorsByDonations = exports.getTotalDonationsForPetOwner = exports.dismissBanner = exports.getDonationsBanners = exports.getDonationsByDay = exports.getDonationsByDonorUsername = exports.getDonationsByOwnerUsername = exports.createDonation = void 0;
const firebase_1 = __importDefault(require("../config/firebase"));
const firestore_1 = require("firebase/firestore");
const db = (0, firestore_1.getFirestore)(firebase_1.default);
const createDonation = (donationData) => __awaiter(void 0, void 0, void 0, function* () {
    const donationDocRef = (0, firestore_1.collection)(db, "donations");
    const donationDoc = yield (0, firestore_1.addDoc)(donationDocRef, donationData);
    return donationDoc;
});
exports.createDonation = createDonation;
const getDonationsByOwnerUsername = (username) => __awaiter(void 0, void 0, void 0, function* () {
    const donationsCollectionRef = (0, firestore_1.collection)(db, "donations");
    const donationsQuery = (0, firestore_1.query)(donationsCollectionRef, (0, firestore_1.where)("ownerUsername", "==", username));
    const donationsQuerySnapshot = yield (0, firestore_1.getDocs)(donationsQuery);
    return donationsQuerySnapshot.docs.map((doc) => doc.data());
});
exports.getDonationsByOwnerUsername = getDonationsByOwnerUsername;
const getDonationsByDonorUsername = (username) => __awaiter(void 0, void 0, void 0, function* () {
    const donationsCollectionRef = (0, firestore_1.collection)(db, "donations");
    const donationsQuery = (0, firestore_1.query)(donationsCollectionRef, (0, firestore_1.where)("ownerUsername", "==", username));
    const donationsQuerySnapshot = yield (0, firestore_1.getDocs)(donationsQuery);
    return donationsQuerySnapshot.docs.map((doc) => doc.data());
});
exports.getDonationsByDonorUsername = getDonationsByDonorUsername;
const getDonationsByDay = (username, donorUsername) => __awaiter(void 0, void 0, void 0, function* () {
    const donationsCollectionRef = (0, firestore_1.collection)(db, "donations");
    const donationsQuery = (0, firestore_1.query)(donationsCollectionRef, (0, firestore_1.where)("ownerUsername", "==", username), (0, firestore_1.where)("donorUsername", "==", donorUsername));
    const donationsQuerySnapshot = yield (0, firestore_1.getDocs)(donationsQuery);
    const docs = donationsQuerySnapshot.docs.map((doc) => doc.data());
    let total = { food: 0, medicine: 0, money: 0 };
    try {
        console.log(docs.length);
        for (let i = 0; i < docs.length; i++) {
            console.log(docs[i]);
            total.food += docs[i].food;
            total.medicine += docs[i].medicine;
            total.money += docs[i].money;
        }
    }
    catch (e) {
        console.log(e);
    }
    return total;
});
exports.getDonationsByDay = getDonationsByDay;
const getDonationsBanners = (username) => __awaiter(void 0, void 0, void 0, function* () {
    const donationsCollectionRef = (0, firestore_1.collection)(db, "donations");
    const donationsQuery = (0, firestore_1.query)(donationsCollectionRef, (0, firestore_1.where)("ownerUsername", "==", username), (0, firestore_1.where)("isDismissed", "==", false));
    const donationsQuerySnapshot = yield (0, firestore_1.getDocs)(donationsQuery);
    const docs = donationsQuerySnapshot.docs.map((doc) => doc.data());
    return docs;
});
exports.getDonationsBanners = getDonationsBanners;
const dismissBanner = (donorUsername, ownerUsername) => __awaiter(void 0, void 0, void 0, function* () {
    const donationsCollectionRef = (0, firestore_1.collection)(db, "donations");
    const donationsQuery = (0, firestore_1.query)(donationsCollectionRef, (0, firestore_1.where)("donorUsername", "==", donorUsername), (0, firestore_1.where)("ownerUsername", "==", ownerUsername), (0, firestore_1.where)("isDismissed", "==", false));
    const donationsQuerySnapshot = yield (0, firestore_1.getDocs)(donationsQuery);
    const bannerDoc = (0, firestore_1.doc)(db, "donations", donationsQuerySnapshot.docs[0].id);
    console.log(donationsQuerySnapshot.docs[0].data());
    yield (0, firestore_1.updateDoc)(bannerDoc, Object.assign(Object.assign({}, donationsQuerySnapshot.docs[0].data()), { isDismissed: true }));
    return;
});
exports.dismissBanner = dismissBanner;
const getTotalDonationsForPetOwner = (username) => __awaiter(void 0, void 0, void 0, function* () {
    const donationsCollectionRef = (0, firestore_1.collection)(db, "donations");
    const donationsQuery = (0, firestore_1.query)(donationsCollectionRef, (0, firestore_1.where)("ownerUsername", "==", username));
    const donationsQuerySnapshot = yield (0, firestore_1.getDocs)(donationsQuery);
    const docs = donationsQuerySnapshot.docs.map((doc) => doc.data());
    let total = { food: 0, medicine: 0, money: 0 };
    try {
        for (let i = 0; i < docs.length; i++) {
            total.food += docs[i].food;
            total.medicine += docs[i].medicine;
            total.money += docs[i].money;
        }
    }
    catch (e) {
        console.log(e);
    }
    return total;
});
exports.getTotalDonationsForPetOwner = getTotalDonationsForPetOwner;
const getDonorsByDonations = (username) => __awaiter(void 0, void 0, void 0, function* () {
    const donationsCollectionRef = (0, firestore_1.collection)(db, "donations");
    const donationsQuery = (0, firestore_1.query)(donationsCollectionRef, (0, firestore_1.where)("ownerUsername", "==", username));
    const donationsQuerySnapshot = yield (0, firestore_1.getDocs)(donationsQuery);
    const docs = donationsQuerySnapshot.docs.map((doc) => doc.data());
    let donorUsernames = [];
    let donors = [];
    try {
        for (let i = 0; i < docs.length; i++) {
            donorUsernames.push(docs[i].donorUsername);
        }
    }
    catch (e) {
        console.log(e);
    }
    donorUsernames = [...new Set(donorUsernames)];
    for (let i = 0; i < donorUsernames.length; i++) {
        const donorCollectionRef = (0, firestore_1.collection)(db, "donors");
        const donorQuery = (0, firestore_1.query)(donorCollectionRef, (0, firestore_1.where)("username", "==", donorUsernames[i]));
        const donorQuerySnapshot = yield (0, firestore_1.getDocs)(donorQuery);
        donors.push(donorQuerySnapshot.docs[0].data());
    }
    console.log(donors);
    return donors;
});
exports.getDonorsByDonations = getDonorsByDonations;
const updateDonors = (donor) => __awaiter(void 0, void 0, void 0, function* () {
    const donationsCollectionRef = (0, firestore_1.collection)(db, "donors");
    const donationsQuery = (0, firestore_1.query)(donationsCollectionRef, (0, firestore_1.where)("username", "==", donor.username));
    const donationsQuerySnapshot = yield (0, firestore_1.getDocs)(donationsQuery);
    const donationDoc = (0, firestore_1.doc)(db, "donors", donationsQuerySnapshot.docs[0].id);
    yield (0, firestore_1.updateDoc)(donationDoc, donor);
    const userCollectionRef = (0, firestore_1.collection)(db, "users");
    const userQuery = (0, firestore_1.query)(userCollectionRef, (0, firestore_1.where)("username", "==", donor.username));
    const userQuerySnapshot = yield (0, firestore_1.getDocs)(userQuery);
    const userDoc = (0, firestore_1.doc)(db, "users", userQuerySnapshot.docs[0].id);
    const newUser = { username: donor.username, password: donor.password, role: "donor" };
    yield (0, firestore_1.updateDoc)(userDoc, newUser);
    return;
});
exports.updateDonors = updateDonors;
