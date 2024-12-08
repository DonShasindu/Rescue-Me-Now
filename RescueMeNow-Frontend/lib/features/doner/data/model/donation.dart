class Donation {
  final String ownerUsername;
  final String donorUsername;
  final String regId;
  final String status;
  final double food;
  final double medicine;
  final double money;
  final String date;
  final bool isDismissed;

  Donation({
    required this.ownerUsername,
    required this.donorUsername,
    required this.regId,
    required this.status,
    required this.food,
    required this.medicine,
    required this.money,
    required this.date,
    required this.isDismissed,
  });

  factory Donation.fromJson(Map<String, dynamic> json) {
    return Donation(
      ownerUsername: json['ownerUsername'],
      donorUsername: json['donorUsername'],
      regId: json['regId'],
      status: json['status'],
      food: double.parse(json['food'].toString() ?? '0'),
      medicine: double.parse(json['medicine'].toString() ?? '0'),
      money: double.parse(json['money'].toString() ?? '0'),
      date: json['date'],
      isDismissed: json['isDismissed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ownerUsername': ownerUsername,
      'donorUsername': donorUsername,
      'regId': regId,
      'status': status,
      'food': food,
      'medicine': medicine,
      'money': money,
      'date': date,
      'isDismissed': isDismissed,
    };
  }
}
