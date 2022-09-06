// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_info_map.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleInfoMap _$VehicleInfoMapFromJson(Map<String, dynamic> json) =>
    VehicleInfoMap()
      ..latitud = (json['latitud'] as num?)?.toDouble()
      ..longitud = (json['longitud'] as num?)?.toDouble()
      ..nombre = json['nombre'] as String?
      ..en_uso = json['en_uso'] as bool?
      ..usuario_en_uso = json['usuario_en_uso'] as String?
      ..patente = json['patente'] as String?
      ..tipo = json['tipo'] as String?
      ..imei = json['imei'] as String?
      ..engine_status = json['engine_status'] as bool?;

Map<String, dynamic> _$VehicleInfoMapToJson(VehicleInfoMap instance) =>
    <String, dynamic>{
      'latitud': instance.latitud,
      'longitud': instance.longitud,
      'nombre': instance.nombre,
      'en_uso': instance.en_uso,
      'usuario_en_uso': instance.usuario_en_uso,
      'patente': instance.patente,
      'tipo': instance.tipo,
      'imei': instance.imei,
      'engine_status': instance.engine_status,
    };
