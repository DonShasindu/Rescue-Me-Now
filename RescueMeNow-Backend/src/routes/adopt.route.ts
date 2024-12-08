import { Router } from "express";
import {
  addAdoption,
  getAdopterByPetId,
  isAdoptedPet,
} from "../controllers/adopt.controller";

const router: Router = Router();

router.post("/add", addAdoption);
router.get("/isAdopted/:petId/:donorUsername", isAdoptedPet);
router.get("/adopter/:petId", getAdopterByPetId);

export default router;
