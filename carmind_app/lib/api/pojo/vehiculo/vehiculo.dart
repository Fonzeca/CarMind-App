import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Vehiculo extends Equatable {
  final int? id;

  String? nombre;

  bool? en_uso;

  final String? color;

  final String? marca;

  final String? modelo;

  final String? linea;

  final String? patente;

  final List<EvaluacionesPendientes>? pendientes;

  Vehiculo({this.id, this.nombre, this.en_uso, this.color, this.marca, this.modelo, this.linea, this.patente, this.pendientes});

  factory Vehiculo.fromJson(Map<String, dynamic> json) => Vehiculo(
      id: json['id'],
      nombre: json['nombre'],
      en_uso: json['en_uso'],
      color: json['color'],
      marca: json['marca'],
      modelo: json['modelo'],
      linea: json['linea'],
      patente: json['patente'],
      pendientes: List<EvaluacionesPendientes>.from(json["pendientes"].map((x) => EvaluacionesPendientes.fromJson(x))));

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'nombre': nombre,
        'en_uso': en_uso,
        'color': color,
        'marca': marca,
        'modelo': modelo,
        'linea': linea,
        'patente': patente,
        'pendientes': pendientes,
      };

  @override
  List<Object?> get props => [id, nombre, en_uso, color, marca, modelo, linea, patente, pendientes];
}

@JsonSerializable()
class EvaluacionesPendientes extends Equatable {
  final int? id;

  final String? titulo;

  final bool? pendiente;

  final int? vencimiento;

  final int? intervaloDias;

  const EvaluacionesPendientes({this.id, this.titulo, this.pendiente, this.vencimiento, this.intervaloDias});

  factory EvaluacionesPendientes.fromJson(Map<String, dynamic> json) => EvaluacionesPendientes(
      id: json['id'], titulo: json['titulo'], pendiente: json['pendiente'], vencimiento: json['vencimiento'], intervaloDias: json['intervaloDias']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'titulo': titulo,
        'pendiente': pendiente,
        'vencimiento': vencimiento,
        'intervaloDias': intervaloDias,
      };

  @override
  List<Object?> get props => [id, titulo, pendiente, vencimiento, intervaloDias];
}
