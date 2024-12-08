import { RequestHandler, Request, Response } from "express";
import { addExpenses, getExpensesByOwnerUsernameAndDonorUsername } from "../services/expense.service";

export const addExpense: RequestHandler = async (
    req: Request,
    res: Response
  ): Promise<void> => {
    try {
      await addExpenses(req.body);
      res.status(200).json({ message: "Pet added successfully" });
    } catch (error) {
      res.status(500).json({ error: "Internal Server Error..!" });
    }
  };

  export const getExpenses: RequestHandler = async (
    req: Request,
    res: Response
  ): Promise<void> => {
    try {
      const expenses = await getExpensesByOwnerUsernameAndDonorUsername(req.params.ownerUsername, req.params.donorUsername);
      res.status(200).json(expenses);
    } catch (error) {
      res.status(500).json({ error: "Internal Server Error..!" });
    }
  }
