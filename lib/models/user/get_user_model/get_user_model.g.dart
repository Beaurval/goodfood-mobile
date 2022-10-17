// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserModel _$GetUserModelFromJson(Map<String, dynamic> json) => GetUserModel(
      id: json['id'] as int?,
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      registrationValidated: json['registrationValidated'] as bool?,
      roleId: json['roleId'] as int?,
    );

Map<String, dynamic> _$GetUserModelToJson(GetUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phoneNumber': instance.phoneNumber,
      'registrationValidated': instance.registrationValidated,
      'roleId': instance.roleId,
    };
