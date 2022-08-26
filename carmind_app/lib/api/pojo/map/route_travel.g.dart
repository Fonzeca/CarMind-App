// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_travel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteTravel _$RouteTravelFromJson(Map<String, dynamic> json) => RouteTravel()
  ..type = json['type'] as String?
  ..date = json['date'] as String?
  ..from = json['from'] as String?
  ..to = json['to'] as String?
  ..km = json['km'] as int?
  ..data = (json['data'] as List<dynamic>?)
      ?.map((e) => Point.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$RouteTravelToJson(RouteTravel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'date': instance.date,
      'from': instance.from,
      'to': instance.to,
      'km': instance.km,
      'data': instance.data,
    };

Point _$PointFromJson(Map<String, dynamic> json) => Point()
  ..latitud = (json['latitud'] as num?)?.toDouble()
  ..longitud = (json['longitud'] as num?)?.toDouble()
  ..speed = (json['speed'] as num?)?.toDouble();

Map<String, dynamic> _$PointToJson(Point instance) => <String, dynamic>{
      'latitud': instance.latitud,
      'longitud': instance.longitud,
      'speed': instance.speed,
    };
