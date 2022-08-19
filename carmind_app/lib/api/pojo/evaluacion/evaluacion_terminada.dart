import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class EvaluacionTerminadaPojo extends Equatable {
  int? vehiculo_id;

  List<RespuestaPojo>? respuestas;

  EvaluacionTerminadaPojo({int? vehiculo_id, List<RespuestaPojo>? respuestas});

  factory EvaluacionTerminadaPojo.fromJson(Map<String, dynamic> json) => EvaluacionTerminadaPojo(
      vehiculo_id: json['vehiculo_id'], respuestas: List<RespuestaPojo>.from(json["respuestas"].map((x) => RespuestaPojo.fromJson(x))));

  Map<String, dynamic> toJson() => <String, dynamic>{
        'vehiculo_id': vehiculo_id,
        'respuestas': respuestas,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [vehiculo_id, respuestas];
}

@JsonSerializable()
class RespuestaPojo extends Equatable {
  final int? pregunta_id;

  final bool? tick_correcto;

  final String? base64_image;

  final String? texto;

  final List<RespuestaOpcionPojo>? opciones;

  const RespuestaPojo({this.pregunta_id, this.tick_correcto, this.base64_image, this.texto, this.opciones});

  factory RespuestaPojo.fromJson(Map<String, dynamic> json) => RespuestaPojo(
      pregunta_id: json['pregunta_id'],
      tick_correcto: json['tick_correcto'],
      base64_image: json['base64_image'],
      texto: json['texto'],
      opciones: (json["opciones"] != null) ? List<RespuestaOpcionPojo>.from(json["opciones"].map((x) => RespuestaOpcionPojo.fromJson(x))) : null);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'pregunta_id': pregunta_id,
        'tick_correcto': tick_correcto,
        'base64_image': base64_image,
        'texto': texto,
        'opciones': opciones,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [pregunta_id, tick_correcto, base64_image, texto, opciones];
}

@JsonSerializable()
class RespuestaOpcionPojo extends Equatable {
  final int? opcion_id;

  final bool? tick_correcto;

  const RespuestaOpcionPojo({this.opcion_id, this.tick_correcto});

  factory RespuestaOpcionPojo.fromJson(Map<String, dynamic> json) =>
      RespuestaOpcionPojo(opcion_id: json['opcion_id'], tick_correcto: json['tick_correcto']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'opcion_id': opcion_id,
        'tick_correcto': tick_correcto,
      };
  @override
  // TODO: implement props
  List<Object?> get props => [opcion_id, tick_correcto];
}
