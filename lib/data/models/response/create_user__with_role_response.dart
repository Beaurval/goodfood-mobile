import 'package:equatable/equatable.dart';

class CreateUserWithRoleResponse extends Equatable {
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? password;
  final String? phoneNumber;
  final int? roleId;

  const CreateUserWithRoleResponse(
      {required this.email,
      required this.firstName,
      required this.lastName,
      this.password,
      required this.phoneNumber,
      required this.roleId});

  @override
  List<Object?> get props =>
      [email, firstName, lastName, phoneNumber, roleId, password];

  factory CreateUserWithRoleResponse.fromMap(Map<String, dynamic> map) {
    return CreateUserWithRoleResponse(
        email: map['email'],
        firstName: map['firstName'],
        lastName: map['lastName'],
        password: map['password'],
        phoneNumber: map['phoneNumber'],
        roleId: map['roleId']);
  }
}
