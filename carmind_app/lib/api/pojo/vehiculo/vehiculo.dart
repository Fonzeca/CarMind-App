import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vehiculo.g.dart';

@JsonSerializable()
class Vehiculo extends Equatable {
  int? id;

  String? nombre;

  bool? en_uso;

  int? kilometraje;

  String? marca;

  String? modelo;

  String? linea;

  String? patente;

  String? imei;

  String? tipo;

  List<EvaluacionesPendientes>? pendientes;

  Vehiculo();
  Vehiculo.fromDb(VehiculoDb db) {
    id = db.id;
    nombre = db.nombre;
    en_uso = db.en_uso;
    imei = db.imei;
    marca = db.marca;
    modelo = db.modelo;
    linea = db.linea;
    patente = db.patente;
    if (db.pendientesDb.isNotEmpty) {
      pendientes = db.pendientesDb.map((e) => EvaluacionesPendientes.fromDb(e)).toList();
    }
  }

  factory Vehiculo.fromJson(Map<String, dynamic> json) => _$VehiculoFromJson(json);
  Map<String, dynamic> toJson() => _$VehiculoToJson(this);

  @override
  @ignore
  List<Object?> get props => [id, nombre, en_uso, kilometraje, marca, modelo, linea, patente, imei, pendientes];
}

@Collection()
class VehiculoDb {
  VehiculoDb();

  Id? id;

  String? nombre;

  bool? en_uso;

  int? kilometraje;

  String? marca;

  String? modelo;

  String? linea;

  String? patente;

  String? imei;

  String? tipo;

  final pendientesDb = IsarLinks<EvaluacionesPendientesDb>();

  VehiculoDb.fromVehiculo(Vehiculo v, Isar isar) {
    id = v.id;
    nombre = v.nombre;
    en_uso = v.en_uso;
    imei = v.imei;
    marca = v.marca;
    modelo = v.modelo;
    linea = v.linea;
    patente = v.patente;
    if (v.pendientes != null && v.pendientes!.isNotEmpty) {
      var pendientesList = v.pendientes!.map((e) => EvaluacionesPendientesDb.fromEvaluacionesPendientes(e)).toList();
      var ids = isar.evaluacionesPendientesDbs.putAllSync(pendientesList);
      pendientesDb.addAll(pendientesList);

      // pendientesDb.saveSync();
    }
  }

  @ignore
  get pendientes {
    return pendientesDb.toList()
      ..sort(
        (a, b) => a.id!.compareTo(b.id!),
      );
  }
}

@JsonSerializable()
class EvaluacionesPendientes extends Equatable {
  int? id;

  String? titulo;

  bool? pendiente;

  int? vencimiento;

  int? intervaloDias;

  EvaluacionesPendientes();

  EvaluacionesPendientes.fromDb(EvaluacionesPendientesDb db) {
    id = db.id;
    titulo = db.titulo;
    pendiente = db.pendiente;
    vencimiento = db.vencimiento;
    intervaloDias = db.intervaloDias;
  }

  factory EvaluacionesPendientes.fromJson(Map<String, dynamic> json) => _$EvaluacionesPendientesFromJson(json);
  Map<String, dynamic> toJson() => _$EvaluacionesPendientesToJson(this);

  @override
  List<Object?> get props => [id, titulo, pendiente, vencimiento, intervaloDias];
}

@Collection()
class EvaluacionesPendientesDb {
  Id? privateId;

  int? id;

  String? titulo;

  bool? pendiente;

  int? vencimiento;

  int? intervaloDias;

  EvaluacionesPendientesDb();

  EvaluacionesPendientesDb.fromEvaluacionesPendientes(EvaluacionesPendientes e) {
    id = e.id;
    titulo = e.titulo;
    pendiente = e.pendiente;
    vencimiento = e.vencimiento;
    intervaloDias = e.intervaloDias;
  }
}
