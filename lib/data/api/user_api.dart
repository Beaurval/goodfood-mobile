import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:goodfood_mobile/data/models/request/create_user_with_role_request.dart';
import 'package:goodfood_mobile/data/models/response/create_user__with_role_response.dart';
import 'package:goodfood_mobile/data/models/request/create_user_request.dart';
import 'package:goodfood_mobile/data/models/response/user_response.dart';
import 'package:riverpod/riverpod.dart';

import '../../core/exceptions/exceptions.dart';
import '../../core/failure.dart';

final userApiProvider = Provider<UserApi>((ref) => UserApi());

class UserApi {
  static const String baseUrl = "http://20.124.42.95/api";
  static const String userEndpoint = "/users";

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

  Future<UserResponse> createUser(
      CreateUserRequest request, String uuid) async {
    CreateUserRequest httpRequest = CreateUserRequest(
        email: request.email,
        firstName: request.firstName,
        lastName: request.lastName,
        phoneNumber: request.phoneNumber,
        password: request.password,
        passwordConfirmation: request.passwordConfirmation,
        uuid: uuid);
    try {
      final response = await Dio().post("$baseUrl$userEndpoint",
          data: jsonEncode(httpRequest.toJson()),
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

  Future<CreateUserWithRoleResponse> createUserWithRole(
      CreateUserWithRoleRequest request) async {
    try {
      final response = await Dio().post("$baseUrl$userEndpoint/roles",
          data: jsonEncode(request.toJson()),
          options: Options(
              headers: {HttpHeaders.contentTypeHeader: "application/json"}));
      if (response.statusCode == 200) {
        return CreateUserWithRoleResponse.fromMap(response.data);
      }
      throw Failure(message: 'Veuillez vérifier vos données');
    } on DioError catch (err) {
      throw Failure(
          message: err.response?.statusMessage ?? 'Something went wrong');
    } on SocketException catch (err) {
      throw const Failure(message: 'Vérifiez votre connextion.');
    }
  }
}
