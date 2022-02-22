import 'package:json_annotation/json_annotation.dart';

part 'evaluacion_terminada.g.dart';

@JsonSerializable()
class EvaluacionTerminadaPojo {
  int? vehiculo_id;
  List<RespuestaPojo>? respuestas;

  EvaluacionTerminadaPojo();

  factory EvaluacionTerminadaPojo.fromJson(Map<String, dynamic> json) => _$EvaluacionTerminadaPojoFromJson(json);
  Map<String, dynamic> toJson() => _$EvaluacionTerminadaPojoToJson(this);
}

@JsonSerializable()
class RespuestaPojo {
  int? pregunta_id;
  bool? tick_correcto;
  String? base64_image;
  String? texto;
  List<RespuestaOpcionPojo>? opciones;

  RespuestaPojo();

  factory RespuestaPojo.fromJson(Map<String, dynamic> json) => _$RespuestaPojoFromJson(json);
  Map<String, dynamic> toJson() => _$RespuestaPojoToJson(this);
}

@JsonSerializable()
class RespuestaOpcionPojo {
  int? opcion_id;
  bool? tick_correcto;

  RespuestaOpcionPojo();

  factory RespuestaOpcionPojo.fromJson(Map<String, dynamic> json) => _$RespuestaOpcionPojoFromJson(json);
  Map<String, dynamic> toJson() => _$RespuestaOpcionPojoToJson(this);
}
