import 'package:json_annotation/json_annotation.dart';

part 'evaluacion.g.dart';

@JsonSerializable()
class Evaluacion {
  int? id;
  List<int>? vehiculo_id;
  String? titulo;
  List<SeccionPojo>? secciones;
  
  Evaluacion();

  factory Evaluacion.fromJson(Map<String, dynamic> json) => _$EvaluacionFromJson(json);
  Map<String, dynamic> toJson() => _$EvaluacionToJson(this);
}

@JsonSerializable()
class SeccionPojo{
  int? id;
  String? nombre;
  int? index;
  List<PreguntaPojo>? preguntas;

  SeccionPojo();

  factory SeccionPojo.fromJson(Map<String, dynamic> json) => _$SeccionPojoFromJson(json);
  Map<String, dynamic> toJson() => _$SeccionPojoToJson(this);
}

@JsonSerializable()
class PreguntaPojo{
  int? id;
  String? descripcion;
  int? index;
  String? tipo;
  List<OpcionPojo>? opciones;

  PreguntaPojo();

factory PreguntaPojo.fromJson(Map<String, dynamic> json) => _$PreguntaPojoFromJson(json);
  Map<String, dynamic> toJson() => _$PreguntaPojoToJson(this);
}

@JsonSerializable()
class OpcionPojo{
  int? id;
  String? texto;

  OpcionPojo();

  factory OpcionPojo.fromJson(Map<String, dynamic> json) => _$OpcionPojoFromJson(json);
  Map<String, dynamic> toJson() => _$OpcionPojoToJson(this);
}