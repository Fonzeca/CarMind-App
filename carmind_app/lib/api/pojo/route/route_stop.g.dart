// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_stop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteStop _$RouteStopFromJson(Map<String, dynamic> json) => RouteStop()
  ..type = json['type'] as String?
  ..fromDate = json['fromDate'] as String?
  ..toDate = json['toDate'] as String?
  ..fromHour = json['fromHour'] as String?
  ..toHour = json['toHour'] as String?
  ..latitud = (json['latitud'] as num?)?.toDouble()
  ..longitud = (json['longitud'] as num?)?.toDouble();

Map<String, dynamic> _$RouteStopToJson(RouteStop instance) => <String, dynamic>{
      'type': instance.type,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
      'fromHour': instance.fromHour,
      'toHour': instance.toHour,
      'latitud': instance.latitud,
      'longitud': instance.longitud,
    };
