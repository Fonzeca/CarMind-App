import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LogEvaluacion {
  final int? log_id;

  final int? evaluacion_id;

  String? nombre_evaluacion;

  String? fecha;

  final int? vehiculo_id;

  final String? nombre_vehiculo;

  final int? usuario_id;

  final String? nombre_usuario;

  final String? apellido_usuario;

  LogEvaluacion(
      {this.log_id,
      this.evaluacion_id,
      this.nombre_evaluacion,
      this.fecha,
      this.vehiculo_id,
      this.nombre_vehiculo,
      this.usuario_id,
      this.nombre_usuario,
      this.apellido_usuario});

  factory LogEvaluacion.fromJson(Map<String, dynamic> json) => LogEvaluacion(
      log_id: json['log_id'],
      evaluacion_id: json['evaluacion_id'],
      nombre_evaluacion: json['nombre_evaluacion'],
      fecha: json['fecha'],
      vehiculo_id: json['vehiculo_id'],
      nombre_vehiculo: json['nombre_vehiculo'],
      usuario_id: json['usuario_id'],
      nombre_usuario: json['nombre_usuario'],
      apellido_usuario: json['apellido_usuario']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'log_id': log_id,
        'evaluacion_id': evaluacion_id,
        'nombre_evaluacion': nombre_evaluacion,
        'fecha': fecha,
        'vehiculo_id': vehiculo_id,
        'nombre_vehiculo': nombre_vehiculo,
        'usuario_id': usuario_id,
        'nombre_usuario': nombre_usuario,
        'apellido_usuario': apellido_usuario,
      };
}
