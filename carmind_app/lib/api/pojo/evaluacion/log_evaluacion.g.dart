// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_evaluacion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogEvaluacion _$LogEvaluacionFromJson(Map<String, dynamic> json) =>
    LogEvaluacion()
      ..logId = json['logId'] as int?
      ..evaluacion_id = json['evaluacion_id'] as int?
      ..nombre_evaluacion = json['nombre_evaluacion'] as String?
      ..fecha = json['fecha'] as String?
      ..vehiculo_id = json['vehiculo_id'] as int?
      ..nombre_vehiculo = json['nombre_vehiculo'] as String?
      ..usuario_id = json['usuario_id'] as int?
      ..nombre_usuario = json['nombre_usuario'] as String?
      ..apellido_usuario = json['apellido_usuario'] as String?;

Map<String, dynamic> _$LogEvaluacionToJson(LogEvaluacion instance) =>
    <String, dynamic>{
      'logId': instance.logId,
      'evaluacion_id': instance.evaluacion_id,
      'nombre_evaluacion': instance.nombre_evaluacion,
      'fecha': instance.fecha,
      'vehiculo_id': instance.vehiculo_id,
      'nombre_vehiculo': instance.nombre_vehiculo,
      'usuario_id': instance.usuario_id,
      'nombre_usuario': instance.nombre_usuario,
      'apellido_usuario': instance.apellido_usuario,
    };
