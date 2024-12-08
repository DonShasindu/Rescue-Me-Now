"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
class Donation {
    constructor(ownerUsername, donorUsername, regId, status, food, medicine, money, date, isDismissed) {
        this.ownerUsername = ownerUsername;
        this.donorUsername = donorUsername;
        this.regId = regId;
        this.status = status;
        this.food = food;
        this.medicine = medicine;
        this.money = money;
        this.date = date;
        this.isDismissed = isDismissed;
        this.ownerUsername = ownerUsername;
        this.donorUsername = donorUsername;
        this.regId = regId;
        this.status = status;
        this.date = date;
        this.food = food;
        this.medicine = medicine;
        this.money = money;
        this.isDismissed = isDismissed;
    }
}
exports.default = Donation;
