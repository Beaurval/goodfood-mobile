import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:goodfood_mobile/models/user/get_user_model/get_user_model.dart';
import 'package:goodfood_mobile/repository/user_repository.dart';
import 'package:http/http.dart' as http;
import '../config/api_constants.dart';
import '../config/http_overide.dart';
import '../models/User/create_user_model/create_user_model.dart';
import 'authentication_service.dart';

class UserService {
  var auth = AuthenticationService();
  UserRepository userRepository = UserRepository();

  UserService() {
    HttpOverrides.global = MyHttpOverrides();
  }

  Future<GetUserModel?> signInUser(String mail, String password) async {
    GetUserModel? userExist = await getUserByMail(mail);
    UserCredential? userCredential = await auth.signIn(mail, password);

    if (userCredential == null) {
      return null;
    }

    return getUserByMail(mail);
  }

  Future<GetUserModel?> getUserById(int id) async {
    return userRepository.getUserById(id);
  }

  Future<GetUserModel?> getUserByMail(String mail) async {
    return userRepository.getUserByMail(mail);
  }

  Future<bool> userExistWithMail(String mail) async {
    GetUserModel? user = await getUserByMail(mail);

    return (user == null) ? false : true;
  }

  //Firebase
  Future<GetUserModel?> signUpUser(CreateUserModel createUserModel) async {
    if (createUserModel.email == null || createUserModel.password == null) {
      return null;
    }

    UserCredential? userCredential =
        await auth.signUp(createUserModel.email!, createUserModel.password!);
    if (userCredential == null) {
      return null;
    }

    sendEmailVerification(userCredential.user!);

    var userCreated = await userRepository.createUser(createUserModel);
    if (userCreated == null) {
      return null;
    }

    return userCreated;
  }

  void sendEmailVerification(User user) {
    user.sendEmailVerification();
  }
}
