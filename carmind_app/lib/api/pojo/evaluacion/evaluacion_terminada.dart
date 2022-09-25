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

  EvaluacionTerminadaPojo.fromSelf(EvaluacionTerminadaPojo ev) {
    vehiculo_id = ev.vehiculo_id;
    respuestas = ev.respuestas;
  }

  factory EvaluacionTerminadaPojo.fromJson(Map<String, dynamic> json) => _$EvaluacionTerminadaPojoFromJson(json);
  Map<String, dynamic> toJson() => _$EvaluacionTerminadaPojoToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [vehiculo_id, respuestas];
}

@Collection()
class EvaluacionTerminadaPojoDb extends EvaluacionTerminadaPojo {
  EvaluacionTerminadaPojoDb();

  @Id()
  int? privateId;

  EvaluacionTerminadaPojoDb.fromEvaluacionTerminadaPojo(EvaluacionTerminadaPojo e) : super.fromSelf(e) {
    respuestasDb.addAll(e.respuestas!.map((e) => RespuestaPojoDb.fromRespuestaPojo(e)));
  }

  @override
  get respuestas {
    return respuestasDb.toList()
      ..sort(
        (a, b) => a.pregunta_id!.compareTo(b.pregunta_id!),
      );
  }

  final respuestasDb = IsarLinks<RespuestaPojoDb>();
}

@JsonSerializable(explicitToJson: true)
class RespuestaPojo extends Equatable {
  int? pregunta_id;

  bool? tick_correcto;

  String? base64_image;

  String? texto;

  List<RespuestaOpcionPojo>? opciones;

  RespuestaPojo();

  RespuestaPojo.fromSelf(RespuestaPojo respuesta) {
    pregunta_id = respuesta.pregunta_id;
    tick_correcto = respuesta.tick_correcto;
    base64_image = respuesta.base64_image;
    texto = respuesta.texto;
    opciones = respuesta.opciones;
  }

  factory RespuestaPojo.fromJson(Map<String, dynamic> json) => _$RespuestaPojoFromJson(json);
  Map<String, dynamic> toJson() => _$RespuestaPojoToJson(this);

  @override
  List<Object?> get props => [pregunta_id, tick_correcto, base64_image, texto, opciones];
}

@Collection()
class RespuestaPojoDb extends RespuestaPojo {
  RespuestaPojoDb();

  @Id()
  int? privateId;

  RespuestaPojoDb.fromRespuestaPojo(RespuestaPojo e) : super.fromSelf(e) {
    if (e.opciones != null && e.opciones!.isNotEmpty) {
      opcionesDb.addAll(e.opciones!);
    }
  }

  @override
  get opciones {
    if (opcionesDb.isNotEmpty) {
      return opcionesDb.toList()
        ..sort(
          (a, b) => a.opcion_id!.compareTo(b.opcion_id!),
        );
    }
    return super.opciones;
  }

  final opcionesDb = IsarLinks<RespuestaOpcionPojo>();
}

@JsonSerializable(explicitToJson: true)
@Collection()
class RespuestaOpcionPojo extends Equatable {
  @Id()
  int? privateId;

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
  List<Object?> get props => [opcion_id, tick_correcto];
}
