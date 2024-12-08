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
exports.getAdopterByPetId = exports.isAdoptedPet = exports.addAdoption = void 0;
const adopt_service_1 = require("../services/adopt.service");
const addAdoption = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        yield (0, adopt_service_1.addAdopt)(req.body);
        res.status(200).json({ message: "Adopt created successfully" });
    }
    catch (error) {
        res.status(500).json({ error: "Internal Server Error..!" });
    }
});
exports.addAdoption = addAdoption;
const isAdoptedPet = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        console.log(req.params.petId, req.params.donorUsername);
        const isAdopt = yield (0, adopt_service_1.isAdopted)(req.params.petId, req.params.donorUsername);
        res.status(200).json({ isAdopted: isAdopt });
    }
    catch (error) {
        res.status(500).json({ error: "Internal Server Error..!" });
    }
});
exports.isAdoptedPet = isAdoptedPet;
const getAdopterByPetId = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const adopter = yield (0, adopt_service_1.getAdopter)(req.params.petId);
        res.status(200).json(adopter);
    }
    catch (error) {
        res.status(500).json({ error: "Internal Server Error..!" });
    }
});
exports.getAdopterByPetId = getAdopterByPetId;
