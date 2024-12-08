import 'package:flutter/material.dart';
import 'package:rescue_me_now/features/pet-owner/data/model/pet_owner.dart';

import '../../pet-owner/data/model/pet.dart';

@immutable
class VetState {
  final List<Pet> pets;
  final PetOwner? petOwner;
  final List<Pet> publishedPets;

  const VetState({
    required this.pets,
    required this.petOwner,
    required this.publishedPets,
  });

  static VetState initialState() => const VetState(
        pets: [],
        petOwner: null,
        publishedPets: [],
      );

  VetState clone({
    List<Pet>? pets,
    PetOwner? petOwner,
    List<Pet>? publishedPets,
  }) {
    return VetState(
      pets: pets ?? this.pets,
      petOwner: petOwner ?? this.petOwner,
      publishedPets: publishedPets ?? this.publishedPets,
    );
  }
}
