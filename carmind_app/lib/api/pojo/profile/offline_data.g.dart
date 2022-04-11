// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfflineData _$OfflineDataFromJson(Map<String, dynamic> json) => OfflineData()
  ..loggedUser = json['loggedUser'] == null
      ? null
      : LoggedUser.fromJson(json['loggedUser'] as Map<String, dynamic>)
  ..vehiculos = (json['vehiculos'] as List<dynamic>?)
      ?.map((e) => Vehiculo.fromJson(e as Map<String, dynamic>))
      .toList()
  ..evaluaciones = (json['evaluaciones'] as List<dynamic>?)
      ?.map((e) => Evaluacion.fromJson(e as Map<String, dynamic>))
      .toList()
  ..logEvaluacion = (json['logEvaluacion'] as List<dynamic>?)
      ?.map((e) => LogEvaluacion.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$OfflineDataToJson(OfflineData instance) =>
    <String, dynamic>{
      'loggedUser': instance.loggedUser,
      'vehiculos': instance.vehiculos,
      'evaluaciones': instance.evaluaciones,
      'logEvaluacion': instance.logEvaluacion,
    };
