import 'package:rescue_me_now/features/doner/data/model/donor.dart';
import 'package:rescue_me_now/features/pet-owner/data/model/pet_owner.dart';

sealed class AuthEvent {}

class SignInEvent extends AuthEvent {
  final String username;
  final String password;

  SignInEvent({
    required this.username,
    required this.password,
  });
}

class SignUpEvent extends AuthEvent {
  final PetOwner? petOwner;
  final Donor? donor;

  SignUpEvent({
    this.petOwner,
    this.donor,
  });
}

class ChangeDonorEvent extends AuthEvent {
  final Donor donor;

  ChangeDonorEvent({
    required this.donor,
  });
}

class SignOutEvent extends AuthEvent {}

class ForgetPasswordEvent extends AuthEvent {
  final String contactNumber;

  ForgetPasswordEvent({
    required this.contactNumber,
  });
}
