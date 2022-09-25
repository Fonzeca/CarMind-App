import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'evaluacion.g.dart';

@JsonSerializable()
class Evaluacion {
  @Id()
  int? id;

  List<int>? vehiculo_id;

  String? titulo;

  List<PreguntaPojo>? preguntas;

  Evaluacion();

  Evaluacion.fromSelf(Evaluacion ev) {
    id = ev.id;
    vehiculo_id = ev.vehiculo_id;
    titulo = ev.titulo;
    preguntas = ev.preguntas;
  }

  factory Evaluacion.fromJson(Map<String, dynamic> json) => _$EvaluacionFromJson(json);
  Map<String, dynamic> toJson() => _$EvaluacionToJson(this);
}

@Collection()
class EvaluacionDb extends Evaluacion {
  EvaluacionDb();

  EvaluacionDb.fromEvaluacion(Evaluacion e) : super.fromSelf(e) {
    preguntasDb.addAll(e.preguntas!.map((e) => PreguntaPojoDb.fromPreguntaPojo(e)));
  }

  @override
  get preguntas {
    return preguntasDb.toList()
      ..sort(
        (a, b) => a.id!.compareTo(b.id!),
      );
  }

  final preguntasDb = IsarLinks<PreguntaPojoDb>();
}

@JsonSerializable()
class PreguntaPojo {
  @Id()
  int? id;

  String? descripcion;

  String? tipo;

  List<OpcionPojo>? opciones;

  PreguntaPojo();

  PreguntaPojo.fromSelf(PreguntaPojo preg) {
    id = preg.id;
    descripcion = preg.descripcion;
    tipo = preg.tipo;
    opciones = preg.opciones;
  }

  factory PreguntaPojo.fromJson(Map<String, dynamic> json) => _$PreguntaPojoFromJson(json);
  Map<String, dynamic> toJson() => _$PreguntaPojoToJson(this);
}

@Collection()
class PreguntaPojoDb extends PreguntaPojo {
  PreguntaPojoDb();

  PreguntaPojoDb.fromPreguntaPojo(PreguntaPojo p) : super.fromSelf(p) {
    if (p.opciones != null && p.opciones!.isNotEmpty) opcionesDb.addAll(p.opciones!);
  }

  @override
  get opciones {
    return opcionesDb.toList()
      ..sort(
        (a, b) => a.id!.compareTo(b.id!),
      );
  }

  final opcionesDb = IsarLinks<OpcionPojo>();
}

@JsonSerializable()
@Collection()
class OpcionPojo {
  @Id()
  int? id;

  String? opcion;

  OpcionPojo();

  factory OpcionPojo.fromJson(Map<String, dynamic> json) => _$OpcionPojoFromJson(json);
  Map<String, dynamic> toJson() => _$OpcionPojoToJson(this);
}
