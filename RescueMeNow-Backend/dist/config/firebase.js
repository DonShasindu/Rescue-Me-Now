"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const app_1 = require("firebase/app");
const firebase_config_1 = require("./firebase.config");
const firebaseApp = (0, app_1.initializeApp)(firebase_config_1.firebaseConfig);
firebaseApp.automaticDataCollectionEnabled = true;
exports.default = firebaseApp;
