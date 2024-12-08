import { Request, RequestHandler, Response } from "express";
import { forgotPassword, loginUser, signUpUser } from "../services/auth.service";

export const login: RequestHandler = async (
  req: Request,
  res: Response
): Promise<void> => {
    try {
        const userData = await loginUser(req.body.username, req.body.password);
        res.status(200).json(userData);
    }catch (error) {
        res.status(500).json({ error: "Internal Server Error..!" });
    }
};

export const signUp: RequestHandler = async (req: Request, res: Response): Promise<void> => {
  try {
    console.log(req.body);
    
    signUpUser(
        req.body
      );
        res.status(200).json({ message: "User created successfully" });
  } catch (error) {
    res.status(500).json({ error: "Internal Server Error..!" });
  }
};

export const forgetPasswords: RequestHandler = async (
  req: Request,
  res: Response
): Promise<void> => {
    try {
        const password = await forgotPassword(req.params.contactNumber);
        res.status(200).json({ password: password });
    }catch (error) {
        res.status(500).json({ error: "Internal Server Error..!" });
    }
}
