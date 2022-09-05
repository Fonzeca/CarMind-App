import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'log_evaluacion.g.dart';

@JsonSerializable()
@Collection()
class LogEvaluacion {
  @Id()
  int? log_id;

  int? evaluacion_id;

  String? nombre_evaluacion;

  String? fecha;

  int? vehiculo_id;

  String? nombre_vehiculo;

  int? usuario_id;

  String? nombre_usuario;

  String? apellido_usuario;

  LogEvaluacion();

  factory LogEvaluacion.fromJson(Map<String, dynamic> json) => _$LogEvaluacionFromJson(json);
  Map<String, dynamic> toJson() => _$LogEvaluacionToJson(this);
}
