import 'package:json_annotation/json_annotation.dart';

part 'create_user_model.g.dart';

@JsonSerializable()
class CreateUserModel {
  String? email;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? password;
  String? passwordConfirmation;
  bool? registrationValidated;

  CreateUserModel({
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.password,
    this.passwordConfirmation,
    this.registrationValidated,
  });

  factory CreateUserModel.fromJson(Map<String, dynamic> json) {
    return _$CreateUserModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateUserModelToJson(this);
}
