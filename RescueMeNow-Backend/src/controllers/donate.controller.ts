import { Request, RequestHandler, Response } from "express";
import {
  createDonation,
  dismissBanner,
  getDonationsBanners,
  getDonationsByDay,
  getDonationsByDonorUsername,
  getDonationsByOwnerUsername,
  getDonorsByDonations,
  getTotalDonationsForPetOwner,
  updateDonors,
} from "../services/donate.service";

export const donate: RequestHandler = async (
  req: Request,
  res: Response
): Promise<void> => {
  try {
    await createDonation(req.body);
    res.status(200).json({ message: "Donation added successfully" });
  } catch (error) {
    res.status(500).json({ error: "Internal Server Error..!" });
  }
};

export const getDonationsByOwner: RequestHandler = async (
  req: Request,
  res: Response
): Promise<void> => {
  try {
    const donations = await getDonationsByOwnerUsername(req.params.username);
    res.status(200).json(donations);
  } catch (error) {
    res.status(500).json({ error: "Internal Server Error..!" });
  }
};

export const getDonationsByDonor: RequestHandler = async (
  req: Request,
  res: Response
): Promise<void> => {
  try {
    const donations = await getDonationsByDonorUsername(req.params.username);
    res.status(200).json(donations);
  } catch (error) {
    res.status(500).json({ error: "Internal Server Error..!" });
  }
};

export const getDonations: RequestHandler = async (
  req: Request,
  res: Response
): Promise<void> => {
  try {
    const donations = await getDonationsByDay(
      req.params.username,
      req.params.donorUsername
    );
    res.status(200).json(donations);
  } catch (error) {
    res.status(500).json({ error: "Internal Server Error..!" });
  }
};

export const getDonationsBanner: RequestHandler = async (
  req: Request,
  res: Response
): Promise<void> => {
  try {
    const donations = await getDonationsBanners(req.params.username);
    res.status(200).json(donations);
  } catch (error) {
    res.status(500).json({ error: "Internal Server Error..!" });
  }
};

export const dismissBanners: RequestHandler = async (
  req: Request,
  res: Response
): Promise<void> => {
  try {
    console.log(req.params.donorUsername);

    await dismissBanner(req.params.donorUsername, req.params.ownerUsername);
    res.status(200).json({ message: "Banner dismissed successfully" });
  } catch (error) {
    res.status(500).json({ error: "Internal Server Error..!" });
  }
};

export const getTotalDonationsOfOwner: RequestHandler = async (
  req: Request,
  res: Response
): Promise<void> => {
  try {
    const donations = await getTotalDonationsForPetOwner(req.params.username);
    res.status(200).json(donations);
  } catch (error) {
    res.status(500).json({ error: "Internal Server Error..!" });
  }
};

export const getDonorsByPetOwner: RequestHandler = async (
  req: Request,
  res: Response
): Promise<void> => {
  try {
    const donors = await getDonorsByDonations(req.params.username);
    res.status(200).json(donors);
  } catch (error) {
    res.status(500).json({ error: "Internal Server Error..!" });
  }
}

export const updateDonor: RequestHandler = async (
  req: Request,
  res: Response
): Promise<void> => {
  try {
    await updateDonors(req.body);
    res.status(200).json({ message: "Donation added successfully" });
  } catch (error) {
    res.status(500).json({ error: "Internal Server Error..!" });
  }
}
