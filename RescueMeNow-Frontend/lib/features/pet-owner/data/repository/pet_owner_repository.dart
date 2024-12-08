import 'dart:async';
import 'dart:convert';

import 'package:rescue_me_now/features/doner/data/model/donation.dart';
import 'package:rescue_me_now/features/doner/data/model/donor.dart';
import 'package:rescue_me_now/features/pet-owner/data/model/expense.dart';
import 'package:rescue_me_now/features/pet-owner/data/model/pet.dart';

import '../../../../core/util/db_util.dart';
import 'package:http/http.dart' as http;

class PetOwnerRepository {
  final baseUrl = DBUtil().baseURL;
  FutureOr<Pet> getPet(
    String username,
  ) async {
    final response = await http.get(
      Uri.parse('${baseUrl}pet/pet/$username'),
    );
    return Pet.fromJson(json.decode(response.body));
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

  FutureOr<List<Donation>> getDonations(
    String username,
  ) async {
    final response = await http.get(
      Uri.parse('${baseUrl}donate/banner/$username'),
    );
    return json
        .decode(response.body)
        .map<Donation>((donation) => Donation.fromJson(donation))
        .toList();
  }

  FutureOr<dynamic> dismissDonations(
    String donorUsername,
    String ownerUsername,
  ) async {
    await http.put(
      Uri.parse(
          '${DBUtil().baseURL}donate/dismiss/$donorUsername/$ownerUsername'),
    );
    return;
  }

  FutureOr<List<Donor>> getDonors(
    String username,
  ) async {
    final response = await http.get(
      Uri.parse('${DBUtil().baseURL}donate/donorsByPet/$username'),
    );
    return json
        .decode(response.body)
        .map<Donor>((donor) => Donor.fromJson(donor))
        .toList();
  }

  FutureOr<List<Expense>> getExpenses(
    String ownerUsername,
    String donorUsername,
  ) async {
    final response = await http.get(
      Uri.parse('${DBUtil().baseURL}expense/$ownerUsername/$donorUsername'),
    );
    return json
        .decode(response.body)
        .map<Expense>((expense) => Expense.fromJson(expense))
        .toList();
  }

  FutureOr<dynamic> addExpense(
    Expense expense,
  ) async {
    await http.post(
      Uri.parse('${DBUtil().baseURL}expense'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(expense.toJson()),
    );
    return;
  }

  FutureOr<Donor> getAdopter(
    String petId,
  ) async {
    final response = await http.get(
      Uri.parse('${DBUtil().baseURL}adopt/adopter/$petId'),
    );
    return Donor.fromJson(json.decode(response.body));
  }
}
