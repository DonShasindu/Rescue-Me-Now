export default class PetOwner {
  constructor(
    public username: string,
    public password: string,
    public address: string,
    public cityName: string,
    public contactNumber: string,
    public account: string,
    public role: string,
  ) {
    this.username = username;
    this.password = password;
    this.address = address;
    this.cityName = cityName;
    this.contactNumber = contactNumber;
    this.account = account;
    this.role = role;
  }
}
