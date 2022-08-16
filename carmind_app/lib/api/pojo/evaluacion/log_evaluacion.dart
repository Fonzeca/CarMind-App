import 'package:carmind_app/api/api.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LogEvaluacion {
  int? evaluacion_id;

  String? nombre_evaluacion;

  String? fecha;

  int? vehiculo_id;

  int? usuario_id;

  List<RespuestaPojo>? respuestas;

  LogEvaluacion({this.evaluacion_id, this.nombre_evaluacion, this.fecha, this.vehiculo_id, this.usuario_id, this.respuestas});

  factory LogEvaluacion.fromJson(Map<String, dynamic> json) => LogEvaluacion(
      evaluacion_id: json['evaluacion_id'],
      nombre_evaluacion: json['nombre_evaluacion'],
      fecha: json['fecha'],
      vehiculo_id: json['vehiculo_id'],
      usuario_id: json['usuario_id'],
      respuestas: json['respuestas']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'evaluacion_id': evaluacion_id,
        'nombre_evaluacion': nombre_evaluacion,
        'fecha': fecha,
        'vehiculo_id': vehiculo_id,
        'usuario_id': usuario_id,
        'respuestas': respuestas,
      };
}
