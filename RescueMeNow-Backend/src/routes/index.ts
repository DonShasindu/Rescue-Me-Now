import  { Router } from "express";
import authRouter from './auth.route';
import petRouter from './pet.route';
import donateRouter from './donate.route';
import adoptRouter from './adopt.route';
import expenseRouter from './expense.route';

const routes = Router();

const urlPrefix = "/api/v1";

routes.use(`${urlPrefix}/auth`, authRouter);
routes.use(`${urlPrefix}/pet`, petRouter);
routes.use(`${urlPrefix}/donate`, donateRouter);
routes.use(`${urlPrefix}/adopt`, adoptRouter);
routes.use(`${urlPrefix}/expense`, expenseRouter);

export default routes;
