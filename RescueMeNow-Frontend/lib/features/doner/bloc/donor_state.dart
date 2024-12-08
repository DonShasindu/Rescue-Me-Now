import 'package:flutter/material.dart';
import 'package:rescue_me_now/features/doner/data/model/adoption.dart';

import '../../pet-owner/data/model/pet.dart';

@immutable
class DonorState {
  final List<Pet> pets;
  final double food;
  final double medicine;
  final double money;
  final Adoption? adoption;
  final bool isAdopted;
  final double totFood;
  final double totMedicine;
  final double totMoney;

  const DonorState({
    required this.pets,
    required this.food,
    required this.medicine,
    required this.money,
    required this.adoption,
    required this.isAdopted,
    required this.totFood,
    required this.totMedicine,
    required this.totMoney,
  });

  static DonorState initialState() => const DonorState(
        pets: [],
        food: 0,
        medicine: 0,
        money: 0,
        adoption: null,
        isAdopted: false,
        totFood: 0,
        totMedicine: 0,
        totMoney: 0,
      );

  DonorState clone({
    List<Pet>? pets,
    double? food,
    double? medicine,
    double? money,
    Adoption? adoption,
    bool? isAdopted,
    double? totFood,
    double? totMedicine,
    double? totMoney,
  }) {
    return DonorState(
      pets: pets ?? this.pets,
      food: food ?? this.food,
      medicine: medicine ?? this.medicine,
      money: money ?? this.money,
      adoption: adoption ?? this.adoption,
      isAdopted: isAdopted ?? this.isAdopted,
      totFood: totFood ?? this.totFood,
      totMedicine: totMedicine ?? this.totMedicine,
      totMoney: totMoney ?? this.totMoney,
    );
  }
}
