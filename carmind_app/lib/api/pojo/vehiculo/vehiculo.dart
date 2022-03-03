import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vehiculo.g.dart';

@JsonSerializable()
class Vehiculo extends Equatable {
  int? id;
  String? nombre;
  bool? en_uso;
  String? color;
  String? marca, modelo, linea, patente;
  List<EvaluacionesPendientes>? pendientes;

  Vehiculo();

  factory Vehiculo.fromJson(Map<String, dynamic> json) => _$VehiculoFromJson(json);
  Map<String, dynamic> toJson() => _$VehiculoToJson(this);

  @override
  List<Object?> get props => [id, nombre, en_uso, color, marca, modelo, linea, patente, pendientes];
}

@JsonSerializable()
class EvaluacionesPendientes extends Equatable {
  int? id;
  String? titulo;
  bool? pendiente;
  int? vencimiento;

  EvaluacionesPendientes();

  factory EvaluacionesPendientes.fromJson(Map<String, dynamic> json) => _$EvaluacionesPendientesFromJson(json);
  Map<String, dynamic> toJson() => _$EvaluacionesPendientesToJson(this);

  @override
  List<Object?> get props => [id, titulo, pendiente, vencimiento];
}
