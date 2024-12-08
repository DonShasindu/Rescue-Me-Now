import 'dart:async';
import 'dart:convert';

import 'package:rescue_me_now/core/util/db_util.dart';
import 'package:http/http.dart' as http;
import 'package:rescue_me_now/features/doner/data/model/donor.dart';
import 'package:rescue_me_now/features/pet-owner/data/model/pet_owner.dart';

class AuthRepository {
  final baseUrl = DBUtil().baseURL;
  FutureOr<dynamic> signInWithEmailAndPassword(
      String username, String password) async {
    Map<String, dynamic> data = {
      'username': username,
      'password': password,
    };
    final response = await http.post(
      Uri.parse('${baseUrl}auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(data),
    );
    return json.decode(response.body);
  }

  FutureOr<dynamic> signUp(
    PetOwner? petOwner,
    Donor? donor,
  ) async {
    Map<String, dynamic> data = {};
    if (petOwner != null) {
      data = petOwner.toJson();
    } else if (donor != null) {
      data = donor.toJson();
    }
    final response = await http.post(
      Uri.parse('${baseUrl}auth/signUp'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(data),
    );
    return json.decode(response.body);
  }

  FutureOr<dynamic> forgetPassword(
    String contactNumber,
  ) async {
    final response = await http.get(
      Uri.parse('${baseUrl}auth/$contactNumber'),
    );
    return json.decode(response.body);
  }
}
