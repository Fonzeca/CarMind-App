import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'evaluacion_terminada.g.dart';

@JsonSerializable()
@HiveType(typeId: 11)
class EvaluacionTerminadaPojo {
  @HiveField(0)
  int? vehiculo_id;

  @HiveField(1)
  List<RespuestaPojo>? respuestas;

  EvaluacionTerminadaPojo();

  factory EvaluacionTerminadaPojo.fromJson(Map<String, dynamic> json) => _$EvaluacionTerminadaPojoFromJson(json);
  Map<String, dynamic> toJson() => _$EvaluacionTerminadaPojoToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 12)
class RespuestaPojo {
  @HiveField(0)
  int? pregunta_id;

  @HiveField(1)
  bool? tick_correcto;

  @HiveField(2)
  String? base64_image;

  @HiveField(3)
  String? texto;

  @HiveField(4)
  List<RespuestaOpcionPojo>? opciones;

  RespuestaPojo();

  factory RespuestaPojo.fromJson(Map<String, dynamic> json) => _$RespuestaPojoFromJson(json);
  Map<String, dynamic> toJson() => _$RespuestaPojoToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 13)
class RespuestaOpcionPojo {
  @HiveField(0)
  int? opcion_id;

  @HiveField(1)
  bool? tick_correcto;

  RespuestaOpcionPojo();

  factory RespuestaOpcionPojo.fromJson(Map<String, dynamic> json) => _$RespuestaOpcionPojoFromJson(json);
  Map<String, dynamic> toJson() => _$RespuestaOpcionPojoToJson(this);
}
