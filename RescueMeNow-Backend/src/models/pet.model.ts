export default class Pet {
  constructor(
    public ownerUsername: string,
    public regId: string,
    public name: string,
    public age: number,
    public weight: string,
    public breed: string,
    public gender: string,
    public food: number,
    public medicine: number,
    public money: number,
    public description: string,
    public image: string,
    public isVerified: boolean,
    public isPublished: boolean,
    public vaccined: string,
    public category: string,
    public label: string,
    public foodPercentage: number,
    public medicinePercentage: number,
    public moneyPercentage: number,
  
  ) {
    this.ownerUsername = ownerUsername;
    this.regId = regId;
    this.name = name;
    this.age = age;
    this.weight = weight;
    this.breed = breed;
    this.gender = gender;
    this.food = food;
    this.medicine = medicine;
    this.money = money;
    this.description = description;
    this.image = image;
    this.isVerified = isVerified;
    this.isPublished = isPublished;
    this.vaccined = vaccined;
    this.category = category;
    this.label = label;
    this.foodPercentage = foodPercentage;
    this.medicinePercentage = medicinePercentage;
    this.moneyPercentage = moneyPercentage;
  }
}
