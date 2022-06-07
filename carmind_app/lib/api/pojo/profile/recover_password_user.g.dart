// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recover_password_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecoverPasswordUserPojo _$RecoverPasswordUserPojoFromJson(
        Map<String, dynamic> json) =>
    RecoverPasswordUserPojo()
      ..email = json['email'] as String?
      ..token = json['token'] as String?
      ..newPassword = json['newPassword'] as String?;

Map<String, dynamic> _$RecoverPasswordUserPojoToJson(
        RecoverPasswordUserPojo instance) =>
    <String, dynamic>{
      'email': instance.email,
      'token': instance.token,
      'newPassword': instance.newPassword,
    };
