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
exports.getPetsByPublishedStatus = exports.getPetOwners = exports.getPetsByVerification = exports.updatePets = exports.getPetsByUser = exports.addPet = void 0;
const pet_service_1 = require("../services/pet.service");
const addPet = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        yield (0, pet_service_1.createPet)(req.body);
        res.status(200).json({ message: "Pet added successfully" });
    }
    catch (error) {
        res.status(500).json({ error: "Internal Server Error..!" });
    }
});
exports.addPet = addPet;
const getPetsByUser = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const pets = yield (0, pet_service_1.getPetsByUsername)(req.params.username);
        res.status(200).json(pets);
    }
    catch (error) {
        res.status(500).json({ error: "Internal Server Error..!" });
    }
});
exports.getPetsByUser = getPetsByUser;
const updatePets = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        (0, pet_service_1.updatePet)(req.body);
        res.status(200).json(req.body);
    }
    catch (error) {
        res.status(500).json({ error: "Internal Server Error..!" });
    }
});
exports.updatePets = updatePets;
const getPetsByVerification = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const pets = yield (0, pet_service_1.getPetsByStatus)(req.params.status);
        res.status(200).json(pets);
    }
    catch (error) {
        res.status(500).json({ error: "Internal Server Error..!" });
    }
});
exports.getPetsByVerification = getPetsByVerification;
const getPetOwners = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const petOwner = yield (0, pet_service_1.getPetOwnerByUsername)(req.params.username);
        res.status(200).json(petOwner);
    }
    catch (error) {
        res.status(500).json({ error: "Internal Server Error..!" });
    }
});
exports.getPetOwners = getPetOwners;
const getPetsByPublishedStatus = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const petOwner = yield (0, pet_service_1.getPetsByPublishStatus)(req.params.status);
        res.status(200).json(petOwner);
    }
    catch (error) {
        res.status(500).json({ error: "Internal Server Error..!" });
    }
});
exports.getPetsByPublishedStatus = getPetsByPublishedStatus;
