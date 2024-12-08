export default class Donor {
  constructor(
    public username: string,
    public password: string,
    public address: string,
    public cityName: string,
    public contactNumber: string,
    public donateType: number,
    public role: number,
  ) {
    this.username = username;
    this.password = password;
    this.address = address;
    this.cityName = cityName;
    this.contactNumber = contactNumber;
    this.donateType = donateType;
    this.role = role;
  }
}
