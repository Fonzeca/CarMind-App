import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vehiculo.g.dart';

@JsonSerializable()
class Vehiculo extends Equatable {
  @Id()
  int? id;

  String? nombre;

  bool? en_uso;

  String? imei;

  String? marca;

  String? modelo;

  String? linea;

  String? patente;

  List<EvaluacionesPendientes>? pendientes;

  Vehiculo();

  Vehiculo.fromVehiculo(Vehiculo v) {
    id = v.id;
    nombre = v.nombre;
    en_uso = v.en_uso;
    imei = v.imei;
    marca = v.marca;
    modelo = v.modelo;
    linea = v.linea;
    patente = v.patente;
    pendientes = v.pendientes;
  }

  factory Vehiculo.fromJson(Map<String, dynamic> json) => _$VehiculoFromJson(json);
  Map<String, dynamic> toJson() => _$VehiculoToJson(this);

  @override
  List<Object?> get props => [id, nombre, en_uso, marca, modelo, linea, patente, pendientes];
}

@Collection()
class VehiculoDb extends Vehiculo {
  VehiculoDb();

  VehiculoDb.fromVehiculo(Vehiculo v) : super.fromVehiculo(v) {
    pendientesDb.addAll(v.pendientes!);
  }

  @override
  get pendientes {
    return pendientesDb.toList()
      ..sort(
        (a, b) => a.id!.compareTo(b.id!),
      );
  }

  final pendientesDb = IsarLinks<EvaluacionesPendientes>();
}

@JsonSerializable()
@Collection()
class EvaluacionesPendientes extends Equatable {
  @Id()
  @JsonKey(ignore: true)
  int? privateId;

  int? id;

  String? titulo;

  bool? pendiente;

  int? vencimiento;

  int? intervaloDias;

  EvaluacionesPendientes();

  factory EvaluacionesPendientes.fromJson(Map<String, dynamic> json) => _$EvaluacionesPendientesFromJson(json);
  Map<String, dynamic> toJson() => _$EvaluacionesPendientesToJson(this);

  @override
  List<Object?> get props => [id, titulo, pendiente, vencimiento, intervaloDias];
}
