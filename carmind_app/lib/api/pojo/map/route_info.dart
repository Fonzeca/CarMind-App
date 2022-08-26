import 'package:carmind_app/api/pojo/map/route_stop.dart';
import 'package:carmind_app/api/pojo/map/route_travel.dart';

abstract class RouteInfo {
  String? type;
  String? date;
  String? from;
  String? to;

  RouteInfo();

  factory RouteInfo.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('latitud')) {
      return RouteStop.fromJson(json);
    } else {
      return RouteTravel.fromJson(json);
    }
  }
}
