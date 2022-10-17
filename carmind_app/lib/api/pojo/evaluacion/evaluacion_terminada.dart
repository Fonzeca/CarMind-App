import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'evaluacion_terminada.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class EvaluacionTerminadaPojo extends Equatable {
  int? vehiculo_id;

  List<RespuestaPojo>? respuestas;

  EvaluacionTerminadaPojo();

  EvaluacionTerminadaPojo.fromDb(EvaluacionTerminadaPojoDb db) {
    vehiculo_id = db.vehiculo_id;
    respuestas = db.respuestasDb.map((e) => RespuestaPojo.fromDb(e)).toList();
  }

  factory EvaluacionTerminadaPojo.fromJson(Map<String, dynamic> json) => _$EvaluacionTerminadaPojoFromJson(json);
  Map<String, dynamic> toJson() => _$EvaluacionTerminadaPojoToJson(this);

  @override
  @ignore
  List<Object?> get props => [vehiculo_id, respuestas];
}

@Collection()
class EvaluacionTerminadaPojoDb {
  EvaluacionTerminadaPojoDb();

  Id? privateId;

  int? vehiculo_id;

  final respuestasDb = IsarLinks<RespuestaPojoDb>();

  EvaluacionTerminadaPojoDb.fromEvaluacionTerminadaPojo(EvaluacionTerminadaPojo e) {
    vehiculo_id = e.vehiculo_id;
    respuestasDb.addAll(e.respuestas!.map((e) => RespuestaPojoDb.fromRespuestaPojo(e)));
  }

  @ignore
  get respuestas {
    return respuestasDb.toList()
      ..sort(
        (a, b) => a.pregunta_id!.compareTo(b.pregunta_id!),
      );
  }
}

@JsonSerializable(explicitToJson: true)
class RespuestaPojo extends Equatable {
  int? pregunta_id;

  bool? tick_correcto;

  String? base64_image;

  String? texto;

  List<RespuestaOpcionPojo>? opciones;

  RespuestaPojo();

  RespuestaPojo.fromDb(RespuestaPojoDb db) {
    pregunta_id = db.pregunta_id;
    tick_correcto = db.tick_correcto;
    base64_image = db.base64_image;
    texto = db.texto;
    opciones = db.opcionesDb.toList();
  }

  factory RespuestaPojo.fromJson(Map<String, dynamic> json) => _$RespuestaPojoFromJson(json);
  Map<String, dynamic> toJson() => _$RespuestaPojoToJson(this);

  @override
  @ignore
  List<Object?> get props => [pregunta_id, tick_correcto, base64_image, texto, opciones];
}

@Collection()
class RespuestaPojoDb {
  RespuestaPojoDb();

  Id? privateId;

  int? pregunta_id;

  bool? tick_correcto;

  String? base64_image;

  String? texto;

  final opcionesDb = IsarLinks<RespuestaOpcionPojo>();

  RespuestaPojoDb.fromRespuestaPojo(RespuestaPojo e) {
    pregunta_id = e.pregunta_id;
    tick_correcto = e.tick_correcto;
    base64_image = e.base64_image;
    texto = e.texto;
    if (e.opciones != null && e.opciones!.isNotEmpty) {
      opcionesDb.addAll(e.opciones!);
    }
  }

  @ignore
  get opciones {
    if (opcionesDb.isNotEmpty) {
      return opcionesDb.toList()
        ..sort(
          (a, b) => a.opcion_id!.compareTo(b.opcion_id!),
        );
    }
    return [];
  }
}

@JsonSerializable(explicitToJson: true)
@Collection(inheritance: false)
class RespuestaOpcionPojo extends Equatable {
  Id? privateId;

  int? opcion_id;

  bool? tick_correcto;

  RespuestaOpcionPojo();

  RespuestaOpcionPojo.fromSelf(RespuestaOpcionPojo resp) {
    opcion_id = resp.opcion_id;
    tick_correcto = resp.tick_correcto;
  }

  factory RespuestaOpcionPojo.fromJson(dynamic json) => _$RespuestaOpcionPojoFromJson(json);
  Map<String, dynamic> toJson() => _$RespuestaOpcionPojoToJson(this);

  @override
  @ignore
  List<Object?> get props => [opcion_id, tick_correcto];
}
