import 'package:json_annotation/json_annotation.dart';

part 'vehicle_info_map.g.dart';

@JsonSerializable()
class VehicleInfoMap {
  double? latitud;
  double? longitud;
  String? nombre;
  bool? en_uso;
  String? usuario_en_uso;
  String? patente;
  String? tipo;
  String? imei;
  bool? engine_status;

  VehicleInfoMap();

  factory VehicleInfoMap.fromJson(Map<String, dynamic> json) => _$VehicleInfoMapFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleInfoMapToJson(this);
}
