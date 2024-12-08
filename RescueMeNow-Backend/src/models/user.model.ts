export default class User {
  constructor(
    public username: string,
    public password: string,
    public role: string
  ) {
    this.username = username;
    this.password = password;
    this.role = role;
  }
}
