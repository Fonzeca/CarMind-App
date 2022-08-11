import 'package:carmind_app/api/api.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LogEvaluacionTerminadaPojo {
  final String? fecha;

  final int? evaluacionId;

  final EvaluacionTerminadaPojo? respuesta;

  LogEvaluacionTerminadaPojo({this.fecha, this.evaluacionId, this.respuesta});

  factory LogEvaluacionTerminadaPojo.fromJson(Map<String, dynamic> json) => LogEvaluacionTerminadaPojo(
      fecha: json['fecha'],
      evaluacionId: json['evaluacionId'],
      respuesta: json['respuesta'] == null ? null : EvaluacionTerminadaPojo.fromJson(json['respuesta']));

  Map<String, dynamic> toJson() => <String, dynamic>{
        'fecha': fecha,
        'evaluacionId': evaluacionId,
        'respuesta': respuesta,
      };
}
