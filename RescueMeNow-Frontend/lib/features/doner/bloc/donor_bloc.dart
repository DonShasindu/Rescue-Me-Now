import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rescue_me_now/features/doner/data/repository/donor_repository.dart';

import '../../pet-owner/data/model/pet.dart';
import '../../vet/data/repository/pet_repository.dart';
import 'donor_event.dart';
import 'donor_state.dart';

class DonorBloc extends Bloc<DonorEvent, DonorState> {
  PetRepository petRepository = PetRepository();
  DonorRepository donorRepository = DonorRepository();
  DonorBloc() : super(DonorState.initialState()) {
    on<GetAllPublishedPetsEvent>(_getAllPets);
    on<DonationEvent>(_donate);
    on<GetDonationsEvent>(_getDonations);
    on<FilterPetsEvent>(_filterPets);
    on<AdoptPetEvent>(_adoptPet);
    on<GetIsAdoptionEvent>(_getIsAdoption);
    on<GetTotalDonationsEvent>(_getTotalDonations);
    on<FilterPetsCategoryEvent>(_filterPetsByCategory);
    on<FilterPetsOrgEvent>(_filterPetsByOrganization);
    on<EditProfileEvent>(_editProfile);
  }

  Future<FutureOr<void>> _getAllPets(
      GetAllPublishedPetsEvent event, Emitter<DonorState> emit) async {
    List<Pet> pets = await petRepository.getVerifiedPet(event.status);
    pets = pets
        .where(
          (pet) =>
              pet.regId != "" &&
              pet.isPublished &&
              pet.category != 'org' &&
              (event.isModel
                  ? pet.label.toLowerCase().contains(event.type!)
                  : true),
        )
        .toList();

    emit(state.clone(pets: pets));
  }

  Future<FutureOr<void>> _donate(
      DonationEvent event, Emitter<DonorState> emit) async {
    await donorRepository.donate(event.donation);
  }

  Future<FutureOr<void>> _getDonations(
      GetDonationsEvent event, Emitter<DonorState> emit) async {
    final donations =
        await donorRepository.getDonations(event.username, event.donorUsername);
    emit(state.clone(
      food: double.parse(donations['food'].toString() ?? '0'),
      medicine: double.parse(donations['medicine'].toString() ?? '0'),
      money: double.parse(donations['money'].toString() ?? '0'),
    ));
  }

  Future<FutureOr<void>> _filterPets(
      FilterPetsEvent event, Emitter<DonorState> emit) async {
    List<Pet> pets = await petRepository.getVerifiedPet(true);

    if (event.filter == "") {
      pets = pets
          .where(
            (pet) =>
                pet.isPublished &&
                pet.isVerified &&
                pet.regId != "" &&
                pet.category != 'org',
          )
          .toList();
    } else {
      pets = pets
          .where(
            (pet) =>
                pet.isPublished &&
                pet.regId != "" &&
                pet.isVerified &&
                pet.category != 'org' &&
                pet.name.toUpperCase().contains(event.filter.toUpperCase()),
          )
          .toList();
    }

    emit(state.clone(pets: pets));
  }

  Future<FutureOr<void>> _filterPetsByCategory(
      FilterPetsCategoryEvent event, Emitter<DonorState> emit) async {
    List<Pet> pets = await petRepository.getVerifiedPet(true);

    if (event.category == '') {
      pets = pets
          .where(
            (pet) =>
                pet.isPublished &&
                pet.regId != "" &&
                pet.isVerified &&
                pet.category != 'cat' &&
                pet.category != 'dog' &&
                pet.category != 'org',
          )
          .toList();
    } else {
      pets = pets
          .where(
            (pet) =>
                pet.isPublished &&
                pet.regId != "" &&
                pet.isVerified &&
                pet.category == event.category,
          )
          .toList();
    }

    emit(state.clone(pets: pets));
  }

  Future<FutureOr<void>> _adoptPet(
      AdoptPetEvent event, Emitter<DonorState> emit) async {
    await donorRepository.adoptPet(event.adoption);
  }

  Future<FutureOr<void>> _getIsAdoption(
      GetIsAdoptionEvent event, Emitter<DonorState> emit) async {
    final adoption = await donorRepository.getIsAdoption(
      event.petId,
      event.donorUsername,
    );
    emit(state.clone(
      isAdopted: adoption['isAdopted'],
    ));
  }

  Future<FutureOr<void>> _getTotalDonations(
      GetTotalDonationsEvent event, Emitter<DonorState> emit) async {
    final donations = await donorRepository.getTotalDonations(event.username);
    emit(state.clone(
      totFood: double.parse(donations['food'].toString() ?? '0'),
      totMedicine: double.parse(donations['medicine'].toString() ?? '0'),
      totMoney: double.parse(donations['money'].toString() ?? '0'),
    ));
  }

  Future<FutureOr<void>> _filterPetsByOrganization(
      FilterPetsOrgEvent event, Emitter<DonorState> emit) async {
    List<Pet> pets = await petRepository.getVerifiedPet(true);

    pets = pets
        .where(
          (pet) =>
              pet.isPublished &&
              pet.regId != "" &&
              pet.isVerified &&
              pet.category == 'org',
        )
        .toList();

    emit(state.clone(pets: pets));
  }

  Future<FutureOr<void>> _editProfile(
      EditProfileEvent event, Emitter<DonorState> emit) async {
    await donorRepository.updateProfile(event.donor);
  }
}
