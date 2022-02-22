// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluacion_terminada.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvaluacionTerminadaPojo _$EvaluacionTerminadaPojoFromJson(
        Map<String, dynamic> json) =>
    EvaluacionTerminadaPojo()
      ..vehiculo_id = json['vehiculo_id'] as int?
      ..respuestas = (json['respuestas'] as List<dynamic>?)
          ?.map((e) => RespuestaPojo.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$EvaluacionTerminadaPojoToJson(
        EvaluacionTerminadaPojo instance) =>
    <String, dynamic>{
      'vehiculo_id': instance.vehiculo_id,
      'respuestas': instance.respuestas,
    };

RespuestaPojo _$RespuestaPojoFromJson(Map<String, dynamic> json) =>
    RespuestaPojo()
      ..pregunta_id = json['pregunta_id'] as int?
      ..tick_correcto = json['tick_correcto'] as bool?
      ..base64_image = json['base64_image'] as String?
      ..texto = json['texto'] as String?
      ..opciones = (json['opciones'] as List<dynamic>?)
          ?.map((e) => RespuestaOpcionPojo.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$RespuestaPojoToJson(RespuestaPojo instance) =>
    <String, dynamic>{
      'pregunta_id': instance.pregunta_id,
      'tick_correcto': instance.tick_correcto,
      'base64_image': instance.base64_image,
      'texto': instance.texto,
      'opciones': instance.opciones,
    };

RespuestaOpcionPojo _$RespuestaOpcionPojoFromJson(Map<String, dynamic> json) =>
    RespuestaOpcionPojo()
      ..opcion_id = json['opcion_id'] as int?
      ..tick_correcto = json['tick_correcto'] as bool?;

Map<String, dynamic> _$RespuestaOpcionPojoToJson(
        RespuestaOpcionPojo instance) =>
    <String, dynamic>{
      'opcion_id': instance.opcion_id,
      'tick_correcto': instance.tick_correcto,
    };
