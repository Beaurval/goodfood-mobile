import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:goodfood_mobile/models/user/get_user_model/get_user_model.dart';
import 'package:http/http.dart' as http;

import '../config/api_constants.dart';
import '../config/http_overide.dart';
import '../models/User/create_user_model/create_user_model.dart';

class UserService {
  UserService() {
    HttpOverrides.global = MyHttpOverrides();
  }

  Future<GetUserModel?> getUser(int id) async {
    try {
      var url =
          Uri.parse('${ApiConstants.baseUrl}${ApiConstants.usersEndpoint}/id');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        GetUserModel user = GetUserModel.fromJson(jsonDecode(response.body));
        return user;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<bool?> userExistWithMail(String email) async {
    try {
      var url = Uri.parse(
          '${ApiConstants.baseUrl}${ApiConstants.usersEndpoint}/exist?email=$email');
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
        return jsonDecode(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
