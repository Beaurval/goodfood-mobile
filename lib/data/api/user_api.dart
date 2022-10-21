import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:goodfood_mobile/data/api/config_api.dart';
import 'package:goodfood_mobile/data/models/request/create_user_request.dart';
import 'package:goodfood_mobile/data/models/response/user_response.dart';
import 'package:riverpod/riverpod.dart';

import 'package:goodfood_mobile/core/exceptions/exceptions.dart';
import 'package:goodfood_mobile/core/failure.dart';

final userApiProvider = Provider<UserApi>((ref) => UserApi());

class UserApi {
  static const String baseUrl = ConfigApi.baseUrl;
  static const String userEndpoint = ConfigApi.usersEndpoint;

  Future<List<UserResponse>> getUsers() async {
    try {
      final response = await Dio().get("$baseUrl$userEndpoint");
      //récupère la réponse
      if (response.statusCode == 200) {
        final results = List<Map<String, dynamic>>.from(response.data);
        if (results.isNotEmpty) {
          return results.map((e) => UserResponse.fromMap(e)).toList();
        }
      }

      return [];
    } on DioError catch (err) {
      throw Failure(
          message: err.response?.statusMessage ?? 'Something went wrong');
    } on SocketException catch (err) {
      throw const Failure(message: 'Please check your connexion.');
    }
  }

  Future<UserResponse> createUser(CreateUserRequest request) async {
    try {
      final response = await Dio().post("$baseUrl$userEndpoint",
          data: jsonEncode(request.toJson()),
          options: Options(
              headers: {HttpHeaders.contentTypeHeader: "application/json"}));
      if (response.statusCode == 200) {
        return UserResponse.fromMap(response.data);
      }
      throw ServerException();
    } on DioError catch (err) {
      throw Failure(
          message: err.response?.statusMessage ?? 'Something went wrong');
    } on SocketException catch (err) {
      throw const Failure(message: 'Please check your connexion.');
    }
  }
}
