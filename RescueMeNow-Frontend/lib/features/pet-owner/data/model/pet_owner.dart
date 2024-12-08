class PetOwner {
  final String username;
  final String password;
  final String address;
  final String cityName;
  final String contactNumber;
  final String account;
  final String role;

  PetOwner({
    required this.username,
    required this.password,
    required this.address,
    required this.cityName,
    required this.contactNumber,
    required this.account,
    this.role = 'petOwner',
  });

  factory PetOwner.fromJson(Map<String, dynamic> json) {
    return PetOwner(
      username: json['username'],
      password: json['password'] ?? '',
      address: json['address'],
      cityName: json['cityName'],
      contactNumber: json['contactNumber'],
      account: json['account'],
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
      'account': account,
      'role': role,
    };
  }
}
