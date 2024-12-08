"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const routes_1 = __importDefault(require("./routes"));
const cors_1 = __importDefault(require("cors"));
const body_parser_1 = __importDefault(require("body-parser"));
const app = (0, express_1.default)();
const port = 5000;
app.use((0, cors_1.default)());
// app.use(express.json());
app.use(body_parser_1.default.json({
    limit: '50mb',
}));
app.use('/', routes_1.default);
app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});
