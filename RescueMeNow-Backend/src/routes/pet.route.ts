import { Router } from "express";
import {
  addPet,
  getPetOwners,
  getPetsByPublishedStatus,
  getPetsByUser,
  getPetsByVerification,
  updatePets,
} from "../controllers/pet.controller";

const router: Router = Router();

router.get("/pet/:username", getPetsByUser);
router.post("/add", addPet);
router.put("/pet", updatePets);
router.get("/:status", getPetsByVerification);
router.get("/owner/:username", getPetOwners);
router.get("publish/:status", getPetsByPublishedStatus);

export default router;
