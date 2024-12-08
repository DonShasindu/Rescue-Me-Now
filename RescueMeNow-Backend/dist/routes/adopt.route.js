"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const adopt_controller_1 = require("../controllers/adopt.controller");
const router = (0, express_1.Router)();
router.post("/add", adopt_controller_1.addAdoption);
router.get("/isAdopted/:petId/:donorUsername", adopt_controller_1.isAdoptedPet);
router.get("/adopter/:petId", adopt_controller_1.getAdopterByPetId);
exports.default = router;
