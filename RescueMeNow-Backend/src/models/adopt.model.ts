export default class Adopt {
    constructor(
      public ownerUsername: string,
      public petId: string,
      public donorUsername: string,
    ) {
        this.ownerUsername = ownerUsername;
        this.petId = petId;
        this.donorUsername = donorUsername;
    }
  }
