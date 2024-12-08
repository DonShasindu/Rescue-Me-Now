class Expense {
  final String ownerUsername;
  final String petId;
  final String donorUsername;
  final String date;
  final double food;
  final double medicine;
  final double money;

  Expense({
    required this.ownerUsername,
    required this.petId,
    required this.donorUsername,
    required this.date,
    required this.food,
    required this.medicine,
    required this.money,
  });

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      ownerUsername: json['ownerUsername'],
      petId: json['petId'].toString(),
      donorUsername: json['donorUsername'],
      date: json['date'],
      food: double.parse(json['food'].toString()) ?? 0.0,
      medicine: double.parse(json['medicine'].toString()) ?? 0.0,
      money: double.parse(json['money'].toString()) ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ownerUsername': ownerUsername,
      'petId': petId,
      'donorUsername': donorUsername,
      'date': date,
      'food': food,
      'medicine': medicine,
      'money': money,
    };
  }
}
