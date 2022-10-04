// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class SignUpState extends Equatable {
  final String email;
  final String password;
  final String passwordConfirm;
  final String firstName;
  final String lastName;
  final String phone;

  const SignUpState({
    required this.email,
    required this.password,
    required this.passwordConfirm,
    required this.firstName,
    required this.lastName,
    required this.phone,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        email,
        password,
        passwordConfirm,
        firstName,
        lastName,
        phone,
      ];
}
