class Vet {
  final String username;
  final String address;
  final String cityName;
  final String contactNumber;
  final String regId;
  final String role;

  Vet({
    required this.username,
    required this.address,
    required this.cityName,
    required this.contactNumber,
    required this.regId,
    required this.role,
  });

  factory Vet.fromJson(Map<String, dynamic> json) {
    return Vet(
      username: json['username'],
      address: json['address'],
      cityName: json['cityName'],
      contactNumber: json['contactNumber'],
      regId: json['regId'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'address': address,
      'cityName': cityName,
      'contactNumber': contactNumber,
      'regId': regId,
      'role': role,
    };
  }
}
