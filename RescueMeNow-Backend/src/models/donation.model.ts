export default class Donation {
  constructor(
    public ownerUsername: string,
    public donorUsername: string,
    public regId: string,
    public status: string,
    public food: number,
    public medicine: number,
    public money: number,
    public date: string,
    public isDismissed: boolean
  ) {
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
