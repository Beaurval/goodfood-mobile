import 'package:equatable/equatable.dart';

class CreateUserWithRoleRequest extends Equatable {
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? roleId;

  const CreateUserWithRoleRequest({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    this.roleId,
  });

  @override
  List<Object?> get props => [email, firstName, lastName, phoneNumber];

  Map toJson() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'roleId': roleId
    };
  }
}
