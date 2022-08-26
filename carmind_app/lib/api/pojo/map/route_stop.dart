import 'package:carmind_app/api/pojo/map/route_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'route_stop.g.dart';

@JsonSerializable()
class RouteStop extends RouteInfo {
  double? latitud;
  double? longitud;

  RouteStop();

  factory RouteStop.fromJson(Map<String, dynamic> json) => _$RouteStopFromJson(json);
  Map<String, dynamic> toJson() => _$RouteStopToJson(this);
}
