import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../config/api_constants.dart';
import '../config/http_overide.dart';
import '../models/user/user.dart';

class UserService {
  UserService() {
    HttpOverrides.global = MyHttpOverrides();
  }

  Future<User?> getUser(int id) async {
    try {
      var url =
          Uri.parse('${ApiConstants.baseUrl}${ApiConstants.usersEndpoint}/id');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        User user = User.fromJson(jsonDecode(response.body));
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
}
