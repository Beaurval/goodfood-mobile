import 'package:equatable/equatable.dart';

class UserAccount extends Equatable {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final bool? registrationValidated;
  final int? roleId;

  const UserAccount({
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
}
