import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Evaluacion {
  final int? id;

  final List<int>? vehiculo_id;

  final String? titulo;

  final List<PreguntaPojo>? preguntas;

  Evaluacion({this.id, this.vehiculo_id, this.titulo, this.preguntas});

  factory Evaluacion.fromJson(Map<String, dynamic> json) => Evaluacion(
      id: json['id'],
      vehiculo_id: List<int>.from(json["vehiculo_id"].map((x) => x)),
      titulo: json['titulo'],
      preguntas: List<PreguntaPojo>.from(json["preguntas"].map((x) => PreguntaPojo.fromJson(x))));

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'vehiculo_id': vehiculo_id,
        'titulo': titulo,
        'preguntas': preguntas,
      };
}

@JsonSerializable()
class PreguntaPojo {
  final int? id;

  final String? descripcion;

  final String? tipo;

  final List<OpcionPojo>? opciones;

  PreguntaPojo({this.id, this.descripcion, this.opciones, this.tipo});

  factory PreguntaPojo.fromJson(Map<String, dynamic> json) => PreguntaPojo(
      id: json['id'],
      descripcion: json['descripcion'],
      tipo: json['tipo'],
      opciones: List<OpcionPojo>.from(json["opciones"].map((x) => OpcionPojo.fromJson(x))));

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'descripcion': descripcion,
        'tipo': tipo,
        'opciones': opciones,
      };
}

@JsonSerializable()
class OpcionPojo {
  final int? id;

  final String? opcion;

  OpcionPojo({this.id, this.opcion});

  factory OpcionPojo.fromJson(Map<String, dynamic> json) => OpcionPojo(
        id: json['id'],
        opcion: json['opcion'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'opcion': opcion,
      };
}
