class Pet {
  final String ownerUsername;
  final String regId;
  final String name;
  final int age;
  final int weight;
  final String breed;
  final String gender;
  final int food;
  final int medicine;
  final int money;
  final String description;
  final String image;
  final bool isVerified;
  final bool isPublished;
  final String vaccined;
  final String category;
  final String label;
  final int foodPercentage;
  final int medicinePercentage;
  final int moneyPercentage;

  Pet({
    required this.ownerUsername,
    required this.regId,
    required this.name,
    required this.age,
    required this.weight,
    required this.breed,
    required this.gender,
    required this.food,
    required this.medicine,
    required this.money,
    required this.description,
    required this.image,
    required this.isVerified,
    required this.isPublished,
    required this.vaccined,
    required this.category,
    required this.label,
    required this.foodPercentage,
    required this.medicinePercentage,
    required this.moneyPercentage,
  });

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      ownerUsername: json['ownerUsername'],
      regId: json['regId'],
      name: json['name'],
      age: json['age'],
      weight: json['weight'],
      breed: json['breed'],
      gender: json['gender'],
      food: json['food'],
      medicine: json['medicine'],
      money: json['money'],
      description: json['description'],
      image: json['image'],
      isVerified: json['isVerified'],
      isPublished: json['isPublished'],
      vaccined: json['vaccined'],
      category: json['category'],
      label: json['label'],
      foodPercentage: json['foodPercentage'],
      medicinePercentage: json['medicinePercentage'],
      moneyPercentage: json['moneyPercentage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ownerUsername': ownerUsername,
      'regId': regId,
      'name': name,
      'age': age,
      'weight': weight,
      'breed': breed,
      'gender': gender,
      'food': food,
      'medicine': medicine,
      'money': money,
      'description': description,
      'image': image,
      'isVerified': isVerified,
      'isPublished': isPublished,
      'vaccined': vaccined,
      'category': category,
      'label': label,
      'foodPercentage': foodPercentage,
      'medicinePercentage': medicinePercentage,
      'moneyPercentage': moneyPercentage,
    };
  }
}
