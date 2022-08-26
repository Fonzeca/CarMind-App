import 'package:carmind_app/api/pojo/map/route_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'route_travel.g.dart';

@JsonSerializable()
class RouteTravel extends RouteInfo {
  int? km;
  List<Point>? data;

  RouteTravel();

  factory RouteTravel.fromJson(Map<String, dynamic> json) => _$RouteTravelFromJson(json);
  Map<String, dynamic> toJson() => _$RouteTravelToJson(this);
}

@JsonSerializable()
class Point {
  double? latitud;
  double? longitud;
  double? speed;

  Point();

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);
  Map<String, dynamic> toJson() => _$PointToJson(this);
}
