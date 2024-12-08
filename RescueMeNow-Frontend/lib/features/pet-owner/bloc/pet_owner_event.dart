import 'package:rescue_me_now/features/pet-owner/data/model/expense.dart';

import '../data/model/pet.dart';

sealed class PetOwnerEvent {}

class GetPetEvent extends PetOwnerEvent {
  final String username;

  GetPetEvent({
    required this.username,
  });
}

class UpdatePetEvent extends PetOwnerEvent {
  final Pet pet;

  UpdatePetEvent({
    required this.pet,
  });
}

class SetUsernameEvent extends PetOwnerEvent {
  final String username;

  SetUsernameEvent({
    required this.username,
  });
}

class GetDonationsBannerEvent extends PetOwnerEvent {
  final String username;

  GetDonationsBannerEvent({
    required this.username,
  });
}

class DismissDonationBannerEvent extends PetOwnerEvent {
  final String donorUsername;
  final String ownerUsername;

  DismissDonationBannerEvent({
    required this.donorUsername,
    required this.ownerUsername,
  });
}

class GetDonorsEvent extends PetOwnerEvent {
  final String username;

  GetDonorsEvent({
    required this.username,
  });
}

class GetExpensesEvent extends PetOwnerEvent {
  final String ownerUsername;
  final String donorUsername;

  GetExpensesEvent({
    required this.ownerUsername,
    required this.donorUsername,
  });
}

class AddExpenseEvent extends PetOwnerEvent {
  final Expense expense;

  AddExpenseEvent({
    required this.expense,
  });
}

class GetAdopterEvent extends PetOwnerEvent {
  final String petId;

  GetAdopterEvent({
    required this.petId,
  });
}
