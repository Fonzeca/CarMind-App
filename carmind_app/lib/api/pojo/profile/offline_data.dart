import 'package:json_annotation/json_annotation.dart';

import 'package:carmind_app/api/api.dart';

part 'offline_data.g.dart';

@JsonSerializable()
class OfflineData {
  LoggedUser? loggedUser;
  List<Vehiculo>? vehiculos;
  List<Evaluacion>? evaluaciones;
  List<LogEvaluacion>? logEvaluacion;
  int? idVehiculoActual;

  OfflineData();

  factory OfflineData.fromJson(Map<String, dynamic> json) => _$OfflineDataFromJson(json);
  Map<String, dynamic> toJson() => _$OfflineDataToJson(this);
}
