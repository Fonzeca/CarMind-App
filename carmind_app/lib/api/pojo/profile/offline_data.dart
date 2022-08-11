import 'package:carmind_app/api/api.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class OfflineData {
  final LoggedUser? loggedUser;
  final List<Vehiculo>? vehiculos;
  final List<Evaluacion>? evaluaciones;
  final List<LogEvaluacion>? logEvaluacion;
  final int? idVehiculoActual;

  OfflineData({this.loggedUser, this.vehiculos, this.evaluaciones, this.logEvaluacion, this.idVehiculoActual});

  factory OfflineData.fromJson(Map<String, dynamic> json) => OfflineData(
      loggedUser: json['loggedUser'] == null ? null : LoggedUser.fromJson(json['loggedUser']),
      vehiculos: List<Vehiculo>.from(json["vehiculos"].map((x) => Vehiculo.fromJson(x))),
      evaluaciones: List<Evaluacion>.from(json["evaluaciones"].map((x) => Evaluacion.fromJson(x))),
      logEvaluacion: List<LogEvaluacion>.from(json["logEvaluacion"].map((x) => LogEvaluacion.fromJson(x))),
      idVehiculoActual: json['idVehiculoActual']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'loggedUser': loggedUser,
        'vehiculos': vehiculos,
        'evaluaciones': evaluaciones,
        'logEvaluacion': logEvaluacion,
        'idVehiculoActual': idVehiculoActual,
      };
}
