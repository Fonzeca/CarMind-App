import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LoggedUser {
  final int? id;

  final String? nombre;

  final String? apellido;

  final String? username;

  final String? dni;

  final int? empresa;

  final bool? administrador;

  LoggedUser({this.id, this.nombre, this.apellido, this.username, this.dni, this.empresa, this.administrador});

  factory LoggedUser.fromJson(Map<String, dynamic> json) => LoggedUser(
      id: json['id'],
      nombre: json['nombre'],
      apellido: json['apellido'],
      username: json['username'],
      dni: json['dni'],
      empresa: json['empresa'],
      administrador: json['administrador']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'nombre': nombre,
        'apellido': apellido,
        'username': username,
        'dni': dni,
        'empresa': empresa,
        'administrador': administrador,
      };
}
