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
  LogEvaluacionTerminadaPojo.fromDb(LogEvaluacionTerminadaPojoDb db) {
    fecha = db.fecha;
    evaluacionId = db.evaluacionId;
    respuesta = EvaluacionTerminadaPojo.fromDb(db.respuestaDb.value!);
  }

  factory LogEvaluacionTerminadaPojo.fromJson(Map<String, dynamic> json) => _$LogEvaluacionTerminadaPojoFromJson(json);
  Map<String, dynamic> toJson() => _$LogEvaluacionTerminadaPojoToJson(this);
}

@Collection()
class LogEvaluacionTerminadaPojoDb {
  LogEvaluacionTerminadaPojoDb();

  Id? privateId;

  String? fecha;

  int? evaluacionId;

  final respuestaDb = IsarLink<EvaluacionTerminadaPojoDb>();

  LogEvaluacionTerminadaPojoDb.fromLogEvaluacionTerminadaPojo(LogEvaluacionTerminadaPojo l) {
    fecha = l.fecha;
    evaluacionId = l.evaluacionId;
    respuestaDb.value = EvaluacionTerminadaPojoDb.fromEvaluacionTerminadaPojo(l.respuesta!);
  }

  @ignore
  get respuesta {
    return respuestaDb.value;
  }
}
