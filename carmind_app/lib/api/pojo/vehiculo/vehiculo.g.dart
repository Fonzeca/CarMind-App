// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehiculo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vehiculo _$VehiculoFromJson(Map<String, dynamic> json) => Vehiculo()
  ..id = json['id'] as int?
  ..nombre = json['nombre'] as String?
  ..en_uso = json['en_uso'] as bool?
  ..color = json['color'] as String?
  ..marca = json['marca'] as String?
  ..modelo = json['modelo'] as String?
  ..linea = json['linea'] as String?
  ..patente = json['patente'] as String?
  ..pendientes = (json['pendientes'] as List<dynamic>?)
      ?.map((e) => EvaluacionesPendientes.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$VehiculoToJson(Vehiculo instance) => <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'en_uso': instance.en_uso,
      'color': instance.color,
      'marca': instance.marca,
      'modelo': instance.modelo,
      'linea': instance.linea,
      'patente': instance.patente,
      'pendientes': instance.pendientes,
    };

EvaluacionesPendientes _$EvaluacionesPendientesFromJson(
        Map<String, dynamic> json) =>
    EvaluacionesPendientes()
      ..id = json['id'] as int?
      ..titulo = json['titulo'] as String?
      ..pendiente = json['pendiente'] as bool?
      ..vencimiento = json['vencimiento'] as int?;

Map<String, dynamic> _$EvaluacionesPendientesToJson(
        EvaluacionesPendientes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titulo': instance.titulo,
      'pendiente': instance.pendiente,
      'vencimiento': instance.vencimiento,
    };
