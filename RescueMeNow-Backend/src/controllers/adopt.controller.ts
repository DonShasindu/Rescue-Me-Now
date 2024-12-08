import { Request, RequestHandler, Response } from "express";
import { addAdopt, getAdopter, isAdopted } from "../services/adopt.service";

export const addAdoption: RequestHandler = async (
  req: Request,
  res: Response
): Promise<void> => {
  try {
    await addAdopt(req.body);
    res.status(200).json({ message: "Adopt created successfully" });
  } catch (error) {
    res.status(500).json({ error: "Internal Server Error..!" });
  }
};

export const isAdoptedPet: RequestHandler = async (
  req: Request,
  res: Response
): Promise<void> => {
  try {
    console.log(req.params.petId, req.params.donorUsername);
    
    const isAdopt = await isAdopted(req.params.petId, req.params.donorUsername);
    res.status(200).json({ isAdopted: isAdopt });
  } catch (error) {
    res.status(500).json({ error: "Internal Server Error..!" });
  }
}

export const getAdopterByPetId: RequestHandler = async (
  req: Request,
  res: Response
): Promise<void> => {
  try {
    const adopter = await getAdopter(req.params.petId);
    res.status(200).json(adopter);
  } catch (error) {
    res.status(500).json({ error: "Internal Server Error..!" });
  }
}
