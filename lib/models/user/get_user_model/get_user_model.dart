import 'package:json_annotation/json_annotation.dart';

part 'get_user_model.g.dart';

@JsonSerializable()
class GetUserModel {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  bool? registrationValidated;
  int? roleId;

  GetUserModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.registrationValidated,
    this.roleId,
  });

  factory GetUserModel.fromJson(Map<String, dynamic> json) {
    return _$GetUserModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetUserModelToJson(this);
}
