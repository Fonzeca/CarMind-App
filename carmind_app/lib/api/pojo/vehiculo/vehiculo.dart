import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vehiculo.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
@Collection()
class Vehiculo extends Equatable {
  @HiveField(0)
  @Id()
  int? id;

  @HiveField(1)
  String? nombre;

  @HiveField(2)
  bool? en_uso;

  @HiveField(3)
  String? imei;

  @HiveField(4)
  String? marca;

  @HiveField(5)
  String? modelo;

  @HiveField(6)
  String? linea;

  @HiveField(7)
  String? patente;

  @HiveField(8)
  List<EvaluacionesPendientes>? pendientes;

  Vehiculo();

  factory Vehiculo.fromJson(Map<String, dynamic> json) => _$VehiculoFromJson(json);
  Map<String, dynamic> toJson() => _$VehiculoToJson(this);

  @override
  List<Object?> get props => [id, nombre, en_uso, marca, modelo, linea, patente, pendientes];
}

@JsonSerializable()
@HiveType(typeId: 2)
class EvaluacionesPendientes extends Equatable {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? titulo;

  @HiveField(2)
  bool? pendiente;

  @HiveField(3)
  int? vencimiento;

  @HiveField(4)
  int? intervaloDias;

  EvaluacionesPendientes();

  factory EvaluacionesPendientes.fromJson(Map<String, dynamic> json) => _$EvaluacionesPendientesFromJson(json);
  Map<String, dynamic> toJson() => _$EvaluacionesPendientesToJson(this);

  @override
  List<Object?> get props => [id, titulo, pendiente, vencimiento, intervaloDias];
}
