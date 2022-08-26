// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_stop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteStop _$RouteStopFromJson(Map<String, dynamic> json) => RouteStop()
  ..type = json['type'] as String?
  ..date = json['date'] as String?
  ..from = json['from'] as String?
  ..to = json['to'] as String?
  ..latitud = (json['latitud'] as num?)?.toDouble()
  ..longitud = (json['longitud'] as num?)?.toDouble();

Map<String, dynamic> _$RouteStopToJson(RouteStop instance) => <String, dynamic>{
      'type': instance.type,
      'date': instance.date,
      'from': instance.from,
      'to': instance.to,
      'latitud': instance.latitud,
      'longitud': instance.longitud,
    };
