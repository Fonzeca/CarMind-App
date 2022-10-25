import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'logged_user.g.dart';

@JsonSerializable()
@Collection()
class LoggedUser {
  Id? id;

  String? nombre;

  String? apellido;

  String? username;

  String? dni;

  int? empresa;

  bool? administrador;

  LoggedUser();

  factory LoggedUser.fromJson(Map<String, dynamic> json) => _$LoggedUserFromJson(json);
  Map<String, dynamic> toJson() => _$LoggedUserToJson(this);
}
