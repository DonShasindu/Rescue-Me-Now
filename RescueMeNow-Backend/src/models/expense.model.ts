export default class Expense {
  constructor(
    public ownerUsername: string,
    public petId: string,
    public donorUsername: string,
    public date: string,
    public food: number,
    public medicine: number,
    public money: number
  ) {
    this.ownerUsername = ownerUsername;
    this.petId = petId;
    this.donorUsername = donorUsername;
    this.date = date;
    this.food = food;
    this.medicine = medicine;
    this.money = money;
  }
}
