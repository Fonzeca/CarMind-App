import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LogUso extends Equatable {
  final int? vehiculoId;

  final int? usuarioId;

  final String? fechaInicio;

  final String? fechaFin;

  const LogUso({this.vehiculoId, this.fechaFin, this.fechaInicio, this.usuarioId});

  factory LogUso.fromJson(Map<String, dynamic> json) =>
      LogUso(vehiculoId: json['vehiculoId'], fechaInicio: json['fechaInicio'], fechaFin: json['fechaFin'], usuarioId: json['usuarioId']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'vehiculoId': vehiculoId,
        'usuarioId': usuarioId,
        'fechaInicio': fechaInicio,
        'fechaFin': fechaFin,
      };

  LogUso copyWith({String? fechaFin}) {
    return LogUso(
      vehiculoId: vehiculoId,
      usuarioId: usuarioId,
      fechaInicio: fechaInicio,
      fechaFin: fechaFin ?? this.fechaFin,
    );
  }

  @override
  List<Object?> get props => [vehiculoId, usuarioId, fechaInicio, fechaFin];
}
