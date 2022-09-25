import 'package:carmind_app/api/api.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'log_evaluacion_terminada.g.dart';

@JsonSerializable()
class LogEvaluacionTerminadaPojo {
  String? fecha;

  int? evaluacionId;

  EvaluacionTerminadaPojo? respuesta;

  LogEvaluacionTerminadaPojo();

  factory LogEvaluacionTerminadaPojo.fromJson(Map<String, dynamic> json) => _$LogEvaluacionTerminadaPojoFromJson(json);
  Map<String, dynamic> toJson() => _$LogEvaluacionTerminadaPojoToJson(this);
}

@Collection()
class LogEvaluacionTerminadaPojoDb extends LogEvaluacionTerminadaPojo {
  LogEvaluacionTerminadaPojoDb();

  @Id()
  int? privateId;

  @override
  get respuesta {
    return respuestaDb.value;
  }

  final respuestaDb = IsarLink<EvaluacionTerminadaPojoDb>();
}
