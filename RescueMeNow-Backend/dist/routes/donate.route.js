"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const donate_controller_1 = require("../controllers/donate.controller");
const router = (0, express_1.Router)();
router.post("/", donate_controller_1.donate);
router.get("/owner", donate_controller_1.getDonationsByOwner);
router.get("/donor", donate_controller_1.getDonationsByDonor);
router.get("/day/:username/:donorUsername", donate_controller_1.getDonations);
router.get("/banner/:username", donate_controller_1.getDonationsBanner);
router.put("/dismiss/:donorUsername/:ownerUsername", donate_controller_1.dismissBanners);
router.get("/tot/:username", donate_controller_1.getTotalDonationsOfOwner);
router.get("/donorsByPet/:username", donate_controller_1.getDonorsByPetOwner);
router.put("/", donate_controller_1.updateDonor);
exports.default = router;
