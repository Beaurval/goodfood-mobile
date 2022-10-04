import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:goodfood_mobile/domain/entities/user/user.dart';

class CreateUserRequest extends Equatable {
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? password;
  final String? passwordConfirmation;

  const CreateUserRequest({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.password,
    required this.passwordConfirmation,
  });

  @override
  List<Object?> get props =>
      [email, firstName, lastName, phoneNumber, password, passwordConfirmation];

  Map toJson() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'password': password,
      'passwordConfirmation': passwordConfirmation
    };
  }
}
