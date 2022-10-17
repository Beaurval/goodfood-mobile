import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:goodfood_mobile/config/api_constants.dart';
import 'package:goodfood_mobile/models/user/get_user_model/get_user_model.dart';
import '../config/api_constants.dart';
import 'package:http/http.dart' as http;
import '../config/http_overide.dart';
import '../models/User/create_user_model/create_user_model.dart';

class UserRepository {
  UserRepository() {
    HttpOverrides.global = MyHttpOverrides();
  }

  Future<GetUserModel?> getUserByMail(String mail) async {
    Uri url = Uri.parse(
        "${ApiConstants.baseUrl}${ApiConstants.usersEndpoint}/mail?email=$mail");

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<GetUserModel?> getUserById(int id) async {
    Uri url =
        Uri.parse("${ApiConstants.baseUrl}${ApiConstants.usersEndpoint}/$id");

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<GetUserModel?> createUser(CreateUserModel createUserModel) async {
    try {
      var url =
          Uri.parse('${ApiConstants.baseUrl}${ApiConstants.usersEndpoint}');
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: const JsonEncoder().convert(createUserModel));
      if (response.statusCode == 200) {
        return GetUserModel?.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
