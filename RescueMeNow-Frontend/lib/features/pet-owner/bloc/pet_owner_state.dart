import 'package:flutter/material.dart';
import 'package:rescue_me_now/features/pet-owner/data/model/expense.dart';
import 'package:rescue_me_now/features/pet-owner/data/model/pet.dart';

import '../../doner/data/model/donation.dart';
import '../../doner/data/model/donor.dart';

@immutable
class PetOwnerState {
  final String username;
  final Pet? pet;
  final List<Donation> donations;
  final List<Donor> donors;
  final List<Expense> expenses;
  final Donor? adopter;

  const PetOwnerState({
    required this.pet,
    required this.username,
    required this.donations,
    required this.donors,
    required this.expenses,
    required this.adopter,
  });

  static PetOwnerState initial() => const PetOwnerState(
        username: '',
        pet: null,
        donations: [],
        donors: [],
        expenses: [],
        adopter: null,
      );

  PetOwnerState clone({
    String? username,
    Pet? pet,
    List<Donation>? donations,
    List<Donor>? donors,
    List<Expense>? expenses,
    Donor? adopter,
  }) {
    return PetOwnerState(
      username: username ?? this.username,
      pet: pet ?? this.pet,
      donations: donations ?? this.donations,
      donors: donors ?? this.donors,
      expenses: expenses ?? this.expenses,
      adopter: adopter ?? this.adopter,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PetOwnerState &&
        other.pet == pet &&
        other.username == username &&
        other.donations == donations &&
        other.donors == donors &&
        other.expenses == expenses &&
        other.adopter == adopter;
  }

  @override
  int get hashCode =>
      pet.hashCode ^
      username.hashCode ^
      donations.hashCode ^
      donors.hashCode ^
      expenses.hashCode ^
      adopter.hashCode;
}
