import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'evaluacion.g.dart';

@JsonSerializable()
class Evaluacion {
  int? id;

  List<int>? vehiculo_id;

  String? titulo;

  List<PreguntaPojo>? preguntas;

  Evaluacion();

  Evaluacion.fromDb(EvaluacionDb db) {
    id = db.id;
    vehiculo_id = db.vehiculo_id;
    titulo = db.titulo;
    preguntas = db.preguntasDb.map((e) => PreguntaPojo.fromDb(e)).toList();
  }

  factory Evaluacion.fromJson(Map<String, dynamic> json) => _$EvaluacionFromJson(json);
  Map<String, dynamic> toJson() => _$EvaluacionToJson(this);
}

@Collection()
class EvaluacionDb {
  EvaluacionDb();

  Id? id;

  List<int>? vehiculo_id;

  String? titulo;

  final preguntasDb = IsarLinks<PreguntaPojoDb>();

  EvaluacionDb.fromEvaluacion(Evaluacion e, Isar isar) {
    id = e.id;
    vehiculo_id = e.vehiculo_id;
    titulo = e.titulo;
    if (e.preguntas != null && e.preguntas!.isNotEmpty) {
      var preguntasList = e.preguntas!.map((e) => PreguntaPojoDb.fromPreguntaPojo(e, isar)).toList();
      isar.preguntaPojoDbs.putAllSync(preguntasList);
      preguntasDb.addAll(preguntasList);
    }
  }

  @ignore
  get preguntas {
    return preguntasDb.toList()
      ..sort(
        (a, b) => a.id!.compareTo(b.id!),
      );
  }
}

@JsonSerializable()
class PreguntaPojo {
  int? id;

  String? descripcion;

  String? tipo;

  List<OpcionPojo>? opciones;

  PreguntaPojo();
  PreguntaPojo.fromDb(PreguntaPojoDb db) {
    id = db.id;
    descripcion = db.descripcion;
    tipo = db.tipo;
    opciones = db.opcionesDb.toList();
  }

  factory PreguntaPojo.fromJson(Map<String, dynamic> json) => _$PreguntaPojoFromJson(json);
  Map<String, dynamic> toJson() => _$PreguntaPojoToJson(this);
}

@Collection()
class PreguntaPojoDb {
  PreguntaPojoDb();

  Id? id;

  String? descripcion;

  String? tipo;

  final opcionesDb = IsarLinks<OpcionPojo>();

  PreguntaPojoDb.fromPreguntaPojo(PreguntaPojo p, Isar isar) {
    id = p.id;
    descripcion = p.descripcion;
    tipo = p.tipo;
    if (p.opciones != null && p.opciones!.isNotEmpty) {
      isar.opcionPojos.putAllSync(p.opciones!);
      opcionesDb.addAll(p.opciones!);
    }
  }

  @ignore
  get opciones {
    return opcionesDb.toList()
      ..sort(
        (a, b) => a.id!.compareTo(b.id!),
      );
  }
}

@JsonSerializable()
@Collection()
class OpcionPojo {
  Id? id;

  String? opcion;

  OpcionPojo();

  factory OpcionPojo.fromJson(Map<String, dynamic> json) => _$OpcionPojoFromJson(json);
  Map<String, dynamic> toJson() => _$OpcionPojoToJson(this);
}
