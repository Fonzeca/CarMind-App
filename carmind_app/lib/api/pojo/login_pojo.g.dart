// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_pojo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenLogin _$TokenLoginFromJson(Map<String, dynamic> json) => TokenLogin()
  ..token = json['token'] as String?
  ..mustChangePassword = json['mustChangePassword'] as bool?;

Map<String, dynamic> _$TokenLoginToJson(TokenLogin instance) =>
    <String, dynamic>{
      'token': instance.token,
      'mustChangePassword': instance.mustChangePassword,
    };
