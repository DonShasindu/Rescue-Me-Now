import '../../pet-owner/data/model/pet.dart';

sealed class VetEvent {}

class GetAllPetsEvent extends VetEvent {
  final bool status;

  GetAllPetsEvent({
    required this.status,
  });
}

class UpdatePetEvent extends VetEvent {
  final Pet pet;

  UpdatePetEvent({
    required this.pet,
  });
}

class GetPetOwnerEvent extends VetEvent {
  final String username;

  GetPetOwnerEvent({
    required this.username,
  });
}
