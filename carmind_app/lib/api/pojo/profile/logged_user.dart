import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'logged_user.g.dart';

@JsonSerializable()
@HiveType(typeId: 3)
class LoggedUser {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? nombre;

  @HiveField(2)
  String? apellido;

  @HiveField(3)
  String? username;

  @HiveField(4)
  String? dni;

  @HiveField(5)
  int? empresa;

  @HiveField(6)
  bool? administrador;

  LoggedUser();

  factory LoggedUser.fromJson(Map<String, dynamic> json) => _$LoggedUserFromJson(json);
  Map<String, dynamic> toJson() => _$LoggedUserToJson(this);
}
