import 'package:flutter/material.dart';
import 'package:rescue_me_now/features/doner/data/model/donor.dart';
import 'package:rescue_me_now/features/vet/data/model/vet.dart';

import '../../../pet-owner/data/model/pet_owner.dart';

enum RoleType {
  donor,
  petOwner,
  vet,
  undefined,
}

@immutable
class AuthState {
  final RoleType currentRole;
  final String username;
  final PetOwner? petOwner;
  final Vet? vet;
  final Donor? donor;

  const AuthState({
    required this.currentRole,
    required this.username,
    required this.petOwner,
    required this.vet,
    required this.donor,
  });

  static AuthState initial() => const AuthState(
        currentRole: RoleType.undefined,
        username: '',
        petOwner: null,
        vet: null,
        donor: null,
      );

  AuthState clone({
    String? username,
    RoleType? currentRole,
    PetOwner? petOwner,
    Vet? vet,
    Donor? donor,
  }) {
    return AuthState(
      currentRole: currentRole ?? this.currentRole,
      username: username ?? this.username,
      petOwner: petOwner ?? this.petOwner,
      vet: vet ?? this.vet,
      donor: donor ?? this.donor,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthState &&
        other.currentRole == currentRole &&
        other.username == username &&
        other.petOwner == petOwner &&
        other.vet == vet &&
        other.donor == donor;
  }

  @override
  int get hashCode =>
      currentRole.hashCode ^
      username.hashCode ^
      petOwner.hashCode ^
      vet.hashCode ^
      donor.hashCode;
}
