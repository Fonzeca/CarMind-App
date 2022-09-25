import 'package:carmind_app/api/api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'route_draw.g.dart';

@JsonSerializable()
class RouteDraw {
  double? originLatitude;
  double? originLongitude;
  double? destinationLatitude;
  double? destinationLongitude;
  List<Point>? points;
  String? fromToHour;

  RouteDraw();

  factory RouteDraw.fromJson(Map<String, dynamic> json) => _$RouteDrawFromJson(json);
  Map<String, dynamic> toJson() => _$RouteDrawToJson(this);
}
