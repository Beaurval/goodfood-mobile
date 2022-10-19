import 'package:equatable/equatable.dart';

class CreateUserRequestWithRole extends Equatable {
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final int? roleId;

  const CreateUserRequestWithRole(
      {required this.email,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.roleId});

  @override
  List<Object?> get props => [email, firstName, lastName, phoneNumber, roleId];

  Map toJson() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'roleId': roleId,
    };
  }
}
