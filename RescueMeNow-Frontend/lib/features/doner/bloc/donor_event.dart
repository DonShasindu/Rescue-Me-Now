import 'package:rescue_me_now/features/doner/data/model/adoption.dart';
import 'package:rescue_me_now/features/doner/data/model/donation.dart';
import 'package:rescue_me_now/features/doner/data/model/donor.dart';

sealed class DonorEvent {}

class GetAllPublishedPetsEvent extends DonorEvent {
  final bool status;
  final bool isModel;
  final String? type;

  GetAllPublishedPetsEvent({
    required this.status,
    required this.isModel,
    this.type,
  });
}

class DonationEvent extends DonorEvent {
  final Donation donation;

  DonationEvent({
    required this.donation,
  });
}

class GetDonationsEvent extends DonorEvent {
  final String username;
  final String donorUsername;

  GetDonationsEvent({
    required this.username,
    required this.donorUsername,
  });
}

class FilterPetsEvent extends DonorEvent {
  final String filter;

  FilterPetsEvent({
    required this.filter,
  });
}

class AdoptPetEvent extends DonorEvent {
  final Adoption adoption;

  AdoptPetEvent({
    required this.adoption,
  });
}

class GetIsAdoptionEvent extends DonorEvent {
  final String petId;
  final String donorUsername;

  GetIsAdoptionEvent({
    required this.petId,
    required this.donorUsername,
  });
}

class GetTotalDonationsEvent extends DonorEvent {
  final String username;

  GetTotalDonationsEvent({
    required this.username,
  });
}

class FilterPetsCategoryEvent extends DonorEvent {
  final String category;

  FilterPetsCategoryEvent({
    required this.category,
  });
}

class FilterPetsOrgEvent extends DonorEvent {
  final String org;

  FilterPetsOrgEvent({
    required this.org,
  });
}

class EditProfileEvent extends DonorEvent {
  final Donor donor;

  EditProfileEvent({
    required this.donor,
  });
}
