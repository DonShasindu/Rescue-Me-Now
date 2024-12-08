class Adoption {
  final String ownerUsername;
  final String petId;
  final String donorUsername;

  Adoption({
    required this.ownerUsername,
    required this.petId,
    required this.donorUsername,
  });

  factory Adoption.fromJson(Map<String, dynamic> json) {
    return Adoption(
      ownerUsername: json['ownerUsername'],
      petId: json['petId'],
      donorUsername: json['donorUsername'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ownerUsername': ownerUsername,
      'petId': petId,
      'donorUsername': donorUsername,
    };
  }
}
