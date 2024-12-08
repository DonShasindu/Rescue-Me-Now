import { Request, RequestHandler, Response } from "express";
import { createPet, getPetOwnerByUsername, getPetsByPublishStatus, getPetsByStatus, getPetsByUsername, updatePet } from "../services/pet.service";

export const addPet: RequestHandler = async (
  req: Request,
  res: Response
): Promise<void> => {
  try {
    await createPet(req.body);
    res.status(200).json({ message: "Pet added successfully" });
  } catch (error) {
    res.status(500).json({ error: "Internal Server Error..!" });
  }
};

export const getPetsByUser: RequestHandler = async (
  req: Request,
  res: Response
): Promise<void> => {
  try {
    const pets = await getPetsByUsername(req.params.username);    
    res.status(200).json(pets);
  } catch (error) {
    res.status(500).json({ error: "Internal Server Error..!" });
  }
};

export const updatePets: RequestHandler = async (
  req: Request,
  res: Response
): Promise<void> => {
  try {        
    updatePet(req.body);
    res.status(200).json(req.body);
  } catch (error) {
    res.status(500).json({ error: "Internal Server Error..!" });
  }
};

export const getPetsByVerification: RequestHandler = async (
  req: Request,
  res: Response
): Promise<void> => {
  try {
    const pets = await getPetsByStatus(req.params.status);    
    res.status(200).json(pets);
  } catch (error) {
    res.status(500).json({ error: "Internal Server Error..!" });
  }
};

export const getPetOwners: RequestHandler = async (
  req: Request,
  res: Response
): Promise<void> => {
  try {
    const petOwner = await getPetOwnerByUsername(req.params.username);
    res.status(200).json(petOwner);
  } catch (error) {
    res.status(500).json({ error: "Internal Server Error..!" });
  }
}

export const getPetsByPublishedStatus: RequestHandler = async (
  req: Request,
  res: Response
): Promise<void> => {
  try {
    const petOwner = await getPetsByPublishStatus(req.params.status);
    res.status(200).json(petOwner);
  } catch (error) {
    res.status(500).json({ error: "Internal Server Error..!" });
  }
}
