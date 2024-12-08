import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rescue_me_now/features/pet-owner/data/model/pet_owner.dart';
import 'package:rescue_me_now/features/vet/bloc/vet_event.dart';
import 'package:rescue_me_now/features/vet/bloc/vet_state.dart';
import 'package:rescue_me_now/features/vet/data/repository/pet_repository.dart';

import '../../pet-owner/data/model/pet.dart';

class VetBloc extends Bloc<VetEvent, VetState> {
  PetRepository petRepository = PetRepository();
  VetBloc() : super(VetState.initialState()) {
    on<GetAllPetsEvent>(_getAllPets);
    on<UpdatePetEvent>(_updatePet);
    on<GetPetOwnerEvent>(_getPetOwner);
  }

  Future<FutureOr<void>> _getAllPets(
      GetAllPetsEvent event, Emitter<VetState> emit) async {
    List<Pet> pets = await petRepository.getVerifiedPet(event.status);
    pets = pets.where((pet) => pet.regId != "" && pet.category !="org").toList();
    emit(
      state.clone(
        pets: pets,
        publishedPets: pets.where((pet) => pet.isPublished).toList(),
      ),
    );
  }

  Future<FutureOr<void>> _updatePet(
      UpdatePetEvent event, Emitter<VetState> emit) async {
    Pet pet = await petRepository.updatePet(event.pet);
    List<Pet> pets = state.pets;
    pets[pets.indexWhere((element) => element.regId == pet.regId)] = pet;
    emit(state.clone(pets: pets));
  }

  Future<FutureOr<void>> _getPetOwner(
      GetPetOwnerEvent event, Emitter<VetState> emit) async {
    PetOwner owner = await petRepository.getPetOwner(event.username);
    emit(state.clone(petOwner: owner));
  }
}
