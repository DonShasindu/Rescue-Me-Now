import { Router } from "express";
import {
  dismissBanners,
  donate,
  getDonations,
  getDonationsBanner,
  getDonationsByDonor,
  getDonationsByOwner,
  getDonorsByPetOwner,
  getTotalDonationsOfOwner,
  updateDonor,
} from "../controllers/donate.controller";

const router: Router = Router();

router.post("/", donate);
router.get("/owner", getDonationsByOwner);
router.get("/donor", getDonationsByDonor);
router.get("/day/:username/:donorUsername", getDonations);
router.get("/banner/:username", getDonationsBanner);
router.put("/dismiss/:donorUsername/:ownerUsername", dismissBanners);
router.get("/tot/:username", getTotalDonationsOfOwner);
router.get("/donorsByPet/:username", getDonorsByPetOwner);
router.put("/", updateDonor);

export default router;
