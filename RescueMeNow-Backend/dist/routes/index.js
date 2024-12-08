"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const auth_route_1 = __importDefault(require("./auth.route"));
const pet_route_1 = __importDefault(require("./pet.route"));
const donate_route_1 = __importDefault(require("./donate.route"));
const adopt_route_1 = __importDefault(require("./adopt.route"));
const expense_route_1 = __importDefault(require("./expense.route"));
const routes = (0, express_1.Router)();
const urlPrefix = "/api/v1";
routes.use(`${urlPrefix}/auth`, auth_route_1.default);
routes.use(`${urlPrefix}/pet`, pet_route_1.default);
routes.use(`${urlPrefix}/donate`, donate_route_1.default);
routes.use(`${urlPrefix}/adopt`, adopt_route_1.default);
routes.use(`${urlPrefix}/expense`, expense_route_1.default);
exports.default = routes;
