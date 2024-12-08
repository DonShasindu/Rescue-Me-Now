import 'dart:async';
import 'dart:convert';

import 'package:rescue_me_now/features/pet-owner/data/model/pet.dart';
import 'package:rescue_me_now/features/pet-owner/data/model/pet_owner.dart';

import '../../../../core/util/db_util.dart';
import 'package:http/http.dart' as http;

class PetRepository {
  final baseUrl = DBUtil().baseURL;

  FutureOr<List<Pet>> getVerifiedPet(
    bool status,
  ) async {
    final response = await http.get(
      Uri.parse('${baseUrl}pet/$status'),
    );
    return response.body.isNotEmpty
        ? List<Pet>.from(json.decode(response.body).map((x) => Pet.fromJson(x)))
        : [];
  }

  FutureOr<Pet> updatePet(
    Pet pet,
  ) async {
    final response = await http.put(
      Uri.parse('${baseUrl}pet/pet'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(pet.toJson()),
    );
    return Pet.fromJson(json.decode(response.body));
  }

  FutureOr<PetOwner> getPetOwner(
    String username,
  ) async {
    final response = await http.get(
      Uri.parse('${baseUrl}pet/owner/$username'),
    );
    return PetOwner.fromJson(json.decode(response.body));
  }
}
