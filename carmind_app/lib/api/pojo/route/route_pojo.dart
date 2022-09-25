import 'package:json_annotation/json_annotation.dart';

part 'route_pojo.g.dart';

@JsonSerializable()
class RoutePojo {
  String? imei;
  String? from;
  String? to;

  RoutePojo();

  factory RoutePojo.fromJson(Map<String, dynamic> json) => _$RoutePojoFromJson(json);
  Map<String, dynamic> toJson() => _$RoutePojoToJson(this);
}
