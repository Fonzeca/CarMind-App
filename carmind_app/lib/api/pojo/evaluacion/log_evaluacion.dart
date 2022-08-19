import 'package:carmind_app/api/api.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LogEvaluacion extends Equatable {
  final int? evaluacion_id;

  final String? nombre_evaluacion;

  final String? fecha;

  final int? vehiculo_id;

  final int? usuario_id;

  final List<RespuestaPojo>? respuestas;

  const LogEvaluacion({this.evaluacion_id, this.nombre_evaluacion, this.fecha, this.vehiculo_id, this.usuario_id, this.respuestas});

  factory LogEvaluacion.fromJson(Map<String, dynamic> json) => LogEvaluacion(
      evaluacion_id: json['evaluacionId'],
      nombre_evaluacion: json['nombre_evaluacion'],
      fecha: json['fecha'],
      vehiculo_id: json['vehiculoId'],
      usuario_id: json['usuarioId'],
      respuestas: (json["respuestas"] != null) ? List<RespuestaPojo>.from(json["respuestas"]?.map((x) => RespuestaPojo.fromJson(x))) : null);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'evaluacionId': evaluacion_id,
        'nombre_evaluacion': nombre_evaluacion,
        'fecha': fecha,
        'vehiculoId': vehiculo_id,
        'usuarioId': usuario_id,
        'respuestas': respuestas,
      };

  @override
  List<Object?> get props => [evaluacion_id, nombre_evaluacion, fecha, vehiculo_id, usuario_id, respuestas];
}
