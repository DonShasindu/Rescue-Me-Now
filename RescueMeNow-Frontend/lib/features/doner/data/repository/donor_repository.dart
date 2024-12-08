import 'dart:async';
import 'dart:convert';

import 'package:rescue_me_now/features/doner/data/model/adoption.dart';
import 'package:rescue_me_now/features/doner/data/model/donation.dart';
import 'package:rescue_me_now/features/doner/data/model/donor.dart';

import '../../../../core/util/db_util.dart';
import 'package:http/http.dart' as http;

class DonorRepository {
  final baseUrl = DBUtil().baseURL;
  FutureOr<dynamic> donate(
    Donation donation,
  ) async {
    await http.post(
      Uri.parse('${baseUrl}donate'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(donation.toJson()),
    );
    return;
  }

  FutureOr<dynamic> getDonations(
    String username,
    String donorUsername,
  ) async {
    final response = await http.get(
      Uri.parse('${baseUrl}donate/day/$username/$donorUsername'),
    );
    return json.decode(response.body);
  }

  FutureOr<dynamic> adoptPet(
    Adoption adoption,
  ) async {
    final response = await http.post(
      Uri.parse('${baseUrl}adopt/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(adoption.toJson()),
    );
    return json.decode(response.body);
  }

  FutureOr<dynamic> getIsAdoption(
    String petId,
    String donorUsername,
  ) async {
    final response = await http.get(
      Uri.parse('${baseUrl}adopt/isAdopted/$petId/$donorUsername'),
    );
    return json.decode(response.body);
  }

  FutureOr<dynamic> getTotalDonations(
    String username,
  ) async {
    final response = await http.get(
      Uri.parse('${baseUrl}donate/tot/$username'),
    );
    return json.decode(response.body);
  }

  FutureOr<dynamic> updateProfile(
    Donor donor,
  ) async {
    final response = await http.put(
      Uri.parse('${baseUrl}donate'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(donor.toJson()),
    );
    return json.decode(response.body);
  }
}
