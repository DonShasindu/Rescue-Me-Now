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
exports.updateDonor = exports.getDonorsByPetOwner = exports.getTotalDonationsOfOwner = exports.dismissBanners = exports.getDonationsBanner = exports.getDonations = exports.getDonationsByDonor = exports.getDonationsByOwner = exports.donate = void 0;
const donate_service_1 = require("../services/donate.service");
const donate = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        yield (0, donate_service_1.createDonation)(req.body);
        res.status(200).json({ message: "Donation added successfully" });
    }
    catch (error) {
        res.status(500).json({ error: "Internal Server Error..!" });
    }
});
exports.donate = donate;
const getDonationsByOwner = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const donations = yield (0, donate_service_1.getDonationsByOwnerUsername)(req.params.username);
        res.status(200).json(donations);
    }
    catch (error) {
        res.status(500).json({ error: "Internal Server Error..!" });
    }
});
exports.getDonationsByOwner = getDonationsByOwner;
const getDonationsByDonor = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const donations = yield (0, donate_service_1.getDonationsByDonorUsername)(req.params.username);
        res.status(200).json(donations);
    }
    catch (error) {
        res.status(500).json({ error: "Internal Server Error..!" });
    }
});
exports.getDonationsByDonor = getDonationsByDonor;
const getDonations = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const donations = yield (0, donate_service_1.getDonationsByDay)(req.params.username, req.params.donorUsername);
        res.status(200).json(donations);
    }
    catch (error) {
        res.status(500).json({ error: "Internal Server Error..!" });
    }
});
exports.getDonations = getDonations;
const getDonationsBanner = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const donations = yield (0, donate_service_1.getDonationsBanners)(req.params.username);
        res.status(200).json(donations);
    }
    catch (error) {
        res.status(500).json({ error: "Internal Server Error..!" });
    }
});
exports.getDonationsBanner = getDonationsBanner;
const dismissBanners = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        console.log(req.params.donorUsername);
        yield (0, donate_service_1.dismissBanner)(req.params.donorUsername, req.params.ownerUsername);
        res.status(200).json({ message: "Banner dismissed successfully" });
    }
    catch (error) {
        res.status(500).json({ error: "Internal Server Error..!" });
    }
});
exports.dismissBanners = dismissBanners;
const getTotalDonationsOfOwner = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const donations = yield (0, donate_service_1.getTotalDonationsForPetOwner)(req.params.username);
        res.status(200).json(donations);
    }
    catch (error) {
        res.status(500).json({ error: "Internal Server Error..!" });
    }
});
exports.getTotalDonationsOfOwner = getTotalDonationsOfOwner;
const getDonorsByPetOwner = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const donors = yield (0, donate_service_1.getDonorsByDonations)(req.params.username);
        res.status(200).json(donors);
    }
    catch (error) {
        res.status(500).json({ error: "Internal Server Error..!" });
    }
});
exports.getDonorsByPetOwner = getDonorsByPetOwner;
const updateDonor = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        yield (0, donate_service_1.updateDonors)(req.body);
        res.status(200).json({ message: "Donation added successfully" });
    }
    catch (error) {
        res.status(500).json({ error: "Internal Server Error..!" });
    }
});
exports.updateDonor = updateDonor;
