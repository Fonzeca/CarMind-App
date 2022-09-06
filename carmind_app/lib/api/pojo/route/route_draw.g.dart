// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_draw.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteDraw _$RouteDrawFromJson(Map<String, dynamic> json) => RouteDraw()
  ..originLatitude = (json['originLatitude'] as num?)?.toDouble()
  ..originLongitude = (json['originLongitude'] as num?)?.toDouble()
  ..destinationLatitude = (json['destinationLatitude'] as num?)?.toDouble()
  ..destinationLongitude = (json['destinationLongitude'] as num?)?.toDouble()
  ..points = (json['points'] as List<dynamic>?)
      ?.map((e) => Point.fromJson(e as Map<String, dynamic>))
      .toList()
  ..fromToHour = json['fromToHour'] as String?;

Map<String, dynamic> _$RouteDrawToJson(RouteDraw instance) => <String, dynamic>{
      'originLatitude': instance.originLatitude,
      'originLongitude': instance.originLongitude,
      'destinationLatitude': instance.destinationLatitude,
      'destinationLongitude': instance.destinationLongitude,
      'points': instance.points,
      'fromToHour': instance.fromToHour,
    };
