import 'package:equatable/equatable.dart';

class CreateUserRequest extends Equatable {
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? password;
  final String? passwordConfirmation;
  final String? roleId;

  const CreateUserRequest({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    this.password,
    this.roleId,
    this.passwordConfirmation,
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
