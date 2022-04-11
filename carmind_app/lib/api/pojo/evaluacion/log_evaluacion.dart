import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'log_evaluacion.g.dart';

@JsonSerializable()
@HiveType(typeId: 8)
class LogEvaluacion {
  @HiveField(0)
  int? log_id;

  @HiveField(1)
  int? evaluacion_id;

  @HiveField(2)
  String? nombre_evaluacion;

  @HiveField(3)
  String? fecha;

  @HiveField(4)
  int? vehiculo_id;

  @HiveField(5)
  String? nombre_vehiculo;

  @HiveField(6)
  int? usuario_id;

  @HiveField(7)
  String? nombre_usuario;

  @HiveField(8)
  String? apellido_usuario;

  LogEvaluacion();

  factory LogEvaluacion.fromJson(Map<String, dynamic> json) => _$LogEvaluacionFromJson(json);
  Map<String, dynamic> toJson() => _$LogEvaluacionToJson(this);
}
