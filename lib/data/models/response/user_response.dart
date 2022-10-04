import 'package:equatable/equatable.dart';
import 'package:goodfood_mobile/domain/entities/user/user_account.dart';

class UserResponse extends Equatable {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final bool? registrationValidated;
  final int? roleId;

  const UserResponse({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.registrationValidated,
    required this.roleId,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        firstName,
        lastName,
        phoneNumber,
        registrationValidated,
        roleId,
      ];

  UserAccount toEntity() {
    return UserAccount(
        email: email,
        firstName: firstName,
        id: id,
        lastName: lastName,
        phoneNumber: phoneNumber,
        registrationValidated: registrationValidated,
        roleId: roleId);
  }

  factory UserResponse.fromMap(Map<String, dynamic> map) {
    return UserResponse(
        id: map['id'],
        email: map['email'],
        firstName: map['firstName'],
        lastName: map['lastName'],
        phoneNumber: map['phoneNumber'],
        registrationValidated: map['registrationValidated'],
        roleId: map['roleId']);
  }
}
