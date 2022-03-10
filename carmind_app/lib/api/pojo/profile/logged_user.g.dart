// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoggedUser _$LoggedUserFromJson(Map<String, dynamic> json) => LoggedUser()
  ..id = json['id'] as int?
  ..nombre = json['nombre'] as String?
  ..apellido = json['apellido'] as String?
  ..email = json['username'] as String?
  ..dni = json['dni'] as String?
  ..empresa = json['empresa'] as int?
  ..administrador = json['administrador'] as bool?;

Map<String, dynamic> _$LoggedUserToJson(LoggedUser instance) => <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'apellido': instance.apellido,
      'email': instance.email,
      'dni': instance.dni,
      'empresa': instance.empresa,
      'administrador': instance.administrador,
    };
