import 'package:carmind_app/api/pojo/evaluacion/evaluacion_terminada.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'log_evaluacion_terminada.g.dart';

@JsonSerializable()
@HiveType(typeId: 10)
class LogEvaluacionTerminadaPojo {
  @HiveField(0)
  String? fecha;

  @HiveField(1)
  int? evaluacionId;

  @HiveField(2)
  EvaluacionTerminadaPojo? respuesta;

  LogEvaluacionTerminadaPojo();

  factory LogEvaluacionTerminadaPojo.fromJson(Map<String, dynamic> json) => _$LogEvaluacionTerminadaPojoFromJson(json);
  Map<String, dynamic> toJson() => _$LogEvaluacionTerminadaPojoToJson(this);
}
