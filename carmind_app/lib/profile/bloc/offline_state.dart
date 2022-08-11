part of 'offline_bloc.dart';

class OfflineState extends Equatable {
  final LoggedUser? loggedUser;
  int? idVehiculoActual;
  List<Vehiculo>? vehiculos;
  List<Evaluacion>? evaluaciones;
  List<LogEvaluacion>? logEvaluaciones;
  List<LogUso> newLogsUso;
  List<LogEvaluacion> newLogEvaluaciones;

  OfflineState(
      {this.loggedUser,
      this.idVehiculoActual,
      this.vehiculos,
      this.evaluaciones,
      this.logEvaluaciones,
      required this.newLogsUso,
      required this.newLogEvaluaciones});

  OfflineState copyWith(
      {LoggedUser? loggedUser,
      int? idVehiculoActual,
      List<Vehiculo>? vehiculos,
      List<Evaluacion>? evaluaciones,
      List<LogEvaluacion>? logEvaluaciones,
      List<LogUso>? newLogsUso,
      List<LogEvaluacion>? newLogEvaluaciones}) {
    return OfflineState(
        loggedUser: loggedUser ?? this.loggedUser,
        idVehiculoActual: idVehiculoActual ?? this.idVehiculoActual,
        vehiculos: vehiculos ?? this.vehiculos,
        evaluaciones: evaluaciones ?? this.evaluaciones,
        logEvaluaciones: logEvaluaciones ?? this.logEvaluaciones,
        newLogsUso: newLogsUso ?? this.newLogsUso,
        newLogEvaluaciones: newLogEvaluaciones ?? this.newLogEvaluaciones);
  }

  @override
  List<Object?> get props => [loggedUser, idVehiculoActual, vehiculos, evaluaciones, logEvaluaciones, newLogsUso, newLogEvaluaciones];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'loggedUser': loggedUser});
    result.addAll({'idVehiculoActual': idVehiculoActual});
    result.addAll({'vehiculos': vehiculos});
    result.addAll({'evaluaciones': evaluaciones});
    result.addAll({'logEvaluaciones': logEvaluaciones});
    result.addAll({'newLogsUso': newLogsUso});
    result.addAll({'newLogEvaluaciones': newLogEvaluaciones});
    return result;
  }

  factory OfflineState.fromMap(Map<String, dynamic> map) {
    return OfflineState(
        loggedUser: LoggedUser.fromJson(map['loggedUser']),
        idVehiculoActual: map['idVehiculoActual']?.toInt(),
        vehiculos: List<Vehiculo>.from(map["vehiculos"].map((x) => Vehiculo.fromJson(x))),
        evaluaciones: List<Evaluacion>.from(map["evaluaciones"].map((x) => Evaluacion.fromJson(x))),
        logEvaluaciones: List<LogEvaluacion>.from(map["logEvaluaciones"].map((x) => LogEvaluacion.fromJson(x))),
        newLogsUso: List<LogUso>.from(map["newLogsUso"].map((x) => LogUso.fromJson(x))),
        newLogEvaluaciones: List<LogEvaluacion>.from(map["newLogEvaluaciones"].map((x) => LogEvaluacion.fromJson(x))));
  }

  String toJson() => json.encode(toMap());

  factory OfflineState.fromJson(String source) => OfflineState.fromMap(json.decode(source));
}
