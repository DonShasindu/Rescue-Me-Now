class Donor {
  final String username;
  final String password;
  final String address;
  final String cityName;
  final String contactNumber;
  final String donateType;
  final String role;

  Donor({
    required this.username,
    required this.password,
    required this.address,
    required this.cityName,
    required this.contactNumber,
    required this.donateType,
    this.role = 'donor',
  });

  factory Donor.fromJson(Map<String, dynamic> json) {
    return Donor(
      username: json['username'],
      password: json['password'],
      address: json['address'],
      cityName: json['cityName'],
      contactNumber: json['contactNumber'],
      donateType: json['donateType'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'address': address,
      'cityName': cityName,
      'contactNumber': contactNumber,
      'donateType': donateType,
      'role': role,
    };
  }
}
