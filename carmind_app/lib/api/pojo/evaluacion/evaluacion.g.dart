// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluacion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Evaluacion _$EvaluacionFromJson(Map<String, dynamic> json) => Evaluacion()
  ..id = json['id'] as int?
  ..vehiculo_id =
      (json['vehiculo_id'] as List<dynamic>?)?.map((e) => e as int).toList()
  ..titulo = json['titulo'] as String?
  ..secciones = (json['secciones'] as List<dynamic>?)
      ?.map((e) => SeccionPojo.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$EvaluacionToJson(Evaluacion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehiculo_id': instance.vehiculo_id,
      'titulo': instance.titulo,
      'secciones': instance.secciones,
    };

SeccionPojo _$SeccionPojoFromJson(Map<String, dynamic> json) => SeccionPojo()
  ..id = json['id'] as int?
  ..nombre = json['nombre'] as String?
  ..index = json['index'] as int?
  ..preguntas = (json['preguntas'] as List<dynamic>?)
      ?.map((e) => PreguntaPojo.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$SeccionPojoToJson(SeccionPojo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'index': instance.index,
      'preguntas': instance.preguntas,
    };

PreguntaPojo _$PreguntaPojoFromJson(Map<String, dynamic> json) => PreguntaPojo()
  ..id = json['id'] as int?
  ..descripcion = json['descripcion'] as String?
  ..index = json['index'] as int?
  ..tipo = json['tipo'] as String?
  ..opciones = (json['opciones'] as List<dynamic>?)
      ?.map((e) => OpcionPojo.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$PreguntaPojoToJson(PreguntaPojo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'descripcion': instance.descripcion,
      'index': instance.index,
      'tipo': instance.tipo,
      'opciones': instance.opciones,
    };

OpcionPojo _$OpcionPojoFromJson(Map<String, dynamic> json) => OpcionPojo()
  ..id = json['id'] as int?
  ..texto = json['texto'] as String?;

Map<String, dynamic> _$OpcionPojoToJson(OpcionPojo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'texto': instance.texto,
    };
