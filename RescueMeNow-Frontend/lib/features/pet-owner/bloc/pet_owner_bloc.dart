import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rescue_me_now/features/doner/data/model/donor.dart';
import 'package:rescue_me_now/features/pet-owner/bloc/pet_owner_event.dart';
import 'package:rescue_me_now/features/pet-owner/bloc/pet_owner_state.dart';

import '../data/repository/pet_owner_repository.dart';

class PetOwnerBloc extends Bloc<PetOwnerEvent, PetOwnerState> {
  PetOwnerRepository petOwnerRepository = PetOwnerRepository();
  PetOwnerBloc() : super(PetOwnerState.initial()) {
    on<PetOwnerEvent>(
      (event, emit) async => switch (event) {
        GetPetEvent() => _getPet(event, emit),
        UpdatePetEvent() => _updatePet(event, emit),
        SetUsernameEvent() => _setUsername(event, emit),
        GetDonationsBannerEvent() => _getDonations(event, emit),
        DismissDonationBannerEvent() => _dismissDonation(event, emit),
        GetDonorsEvent() => _getDonors(event, emit),
        GetExpensesEvent() => _getExpenses(event, emit),
        AddExpenseEvent() => _addExpense(event, emit),
        GetAdopterEvent() => _getAdopter(event, emit),
      },
    );
  }

  FutureOr<void> _getPet(GetPetEvent event, Emitter<PetOwnerState> emit) async {
    final pet = await petOwnerRepository.getPet(event.username);
    emit(
      state.clone(
        pet: pet,
      ),
    );
  }

  FutureOr<void> _updatePet(
      UpdatePetEvent event, Emitter<PetOwnerState> emit) async {
    final pet = await petOwnerRepository.updatePet(event.pet);
    emit(
      state.clone(
        pet: pet,
      ),
    );
  }

  FutureOr<void> _setUsername(
      SetUsernameEvent event, Emitter<PetOwnerState> emit) async {
    emit(
      state.clone(
        username: event.username,
      ),
    );
  }

  FutureOr<void> _getDonations(
      GetDonationsBannerEvent event, Emitter<PetOwnerState> emit) async {
    final donations = await petOwnerRepository.getDonations(event.username);
    emit(
      state.clone(
        donations: donations,
      ),
    );
  }

  FutureOr<void> _dismissDonation(
      DismissDonationBannerEvent event, Emitter<PetOwnerState> emit) async {
    await petOwnerRepository.dismissDonations(
      event.donorUsername,
      event.ownerUsername,
    );
    add(GetDonationsBannerEvent(username: event.ownerUsername));
  }

  FutureOr<void> _getDonors(
      GetDonorsEvent event, Emitter<PetOwnerState> emit) async {
    List<Donor> donors = await petOwnerRepository.getDonors(event.username);
    emit(
      state.clone(donors: donors),
    );
  }

  FutureOr<void> _getExpenses(
      GetExpensesEvent event, Emitter<PetOwnerState> emit) async {
    final expenses = await petOwnerRepository.getExpenses(
      event.ownerUsername,
      event.donorUsername,
    );
    emit(
      state.clone(
        expenses: expenses,
      ),
    );
  }

  FutureOr<void> _addExpense(
      AddExpenseEvent event, Emitter<PetOwnerState> emit) async {
    await petOwnerRepository.addExpense(event.expense);
  }

  FutureOr<void> _getAdopter(
      GetAdopterEvent event, Emitter<PetOwnerState> emit) async {
    final adopter = await petOwnerRepository.getAdopter(event.petId);
    emit(
      state.clone(
        adopter: adopter,
      ),
    );
  }
}
