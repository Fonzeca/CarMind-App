import 'package:carmind_app/api/api.dart';

abstract class RouteInfo {
  String? type;
  String? fromDate;
  String? toDate;
  String? fromHour;
  String? toHour;

  RouteInfo();

  factory RouteInfo.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('latitud')) {
      return RouteStop.fromJson(json);
    } else {
      return RouteTravel.fromJson(json);
    }
  }
}
