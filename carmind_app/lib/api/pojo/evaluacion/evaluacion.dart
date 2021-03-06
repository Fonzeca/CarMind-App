import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'evaluacion.g.dart';

@JsonSerializable()
@HiveType(typeId: 4)
class Evaluacion {
  @HiveField(0)
  int? id;

  @HiveField(1)
  List<int>? vehiculo_id;

  @HiveField(2)
  String? titulo;

  @HiveField(3)
  List<PreguntaPojo>? preguntas;

  Evaluacion();

  factory Evaluacion.fromJson(Map<String, dynamic> json) => _$EvaluacionFromJson(json);
  Map<String, dynamic> toJson() => _$EvaluacionToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 6)
class PreguntaPojo {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? descripcion;

  @HiveField(2)
  String? tipo;

  @HiveField(3)
  List<OpcionPojo>? opciones;

  PreguntaPojo();

  factory PreguntaPojo.fromJson(Map<String, dynamic> json) => _$PreguntaPojoFromJson(json);
  Map<String, dynamic> toJson() => _$PreguntaPojoToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 7)
class OpcionPojo {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? opcion;

  OpcionPojo();

  factory OpcionPojo.fromJson(Map<String, dynamic> json) => _$OpcionPojoFromJson(json);
  Map<String, dynamic> toJson() => _$OpcionPojoToJson(this);
}
