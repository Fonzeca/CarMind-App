// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehiculo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VehiculoAdapter extends TypeAdapter<Vehiculo> {
  @override
  final int typeId = 1;

  @override
  Vehiculo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Vehiculo()
      ..id = fields[0] as int?
      ..nombre = fields[1] as String?
      ..en_uso = fields[2] as bool?
      ..kilometraje = fields[3] as int?
      ..marca = fields[4] as String?
      ..modelo = fields[5] as String?
      ..linea = fields[6] as String?
      ..patente = fields[7] as String?
      ..pendientes = (fields[8] as List?)?.cast<EvaluacionesPendientes>();
  }

  @override
  void write(BinaryWriter writer, Vehiculo obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nombre)
      ..writeByte(2)
      ..write(obj.en_uso)
      ..writeByte(3)
      ..write(obj.kilometraje)
      ..writeByte(4)
      ..write(obj.marca)
      ..writeByte(5)
      ..write(obj.modelo)
      ..writeByte(6)
      ..write(obj.linea)
      ..writeByte(7)
      ..write(obj.patente)
      ..writeByte(8)
      ..write(obj.pendientes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VehiculoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EvaluacionesPendientesAdapter
    extends TypeAdapter<EvaluacionesPendientes> {
  @override
  final int typeId = 2;

  @override
  EvaluacionesPendientes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EvaluacionesPendientes()
      ..id = fields[0] as int?
      ..titulo = fields[1] as String?
      ..pendiente = fields[2] as bool?
      ..vencimiento = fields[3] as int?
      ..intervaloDias = fields[4] as int?;
  }

  @override
  void write(BinaryWriter writer, EvaluacionesPendientes obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.titulo)
      ..writeByte(2)
      ..write(obj.pendiente)
      ..writeByte(3)
      ..write(obj.vencimiento)
      ..writeByte(4)
      ..write(obj.intervaloDias);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EvaluacionesPendientesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vehiculo _$VehiculoFromJson(Map<String, dynamic> json) => Vehiculo()
  ..id = json['id'] as int?
  ..nombre = json['nombre'] as String?
  ..en_uso = json['en_uso'] as bool?
  ..kilometraje = json['kilometraje'] as int?
  ..marca = json['marca'] as String?
  ..modelo = json['modelo'] as String?
  ..linea = json['linea'] as String?
  ..patente = json['patente'] as String?
  ..imei = json['imei'] as String?
  ..tipo = json['tipo'] as String?
  ..pendientes = (json['pendientes'] as List<dynamic>?)
      ?.map((e) => EvaluacionesPendientes.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$VehiculoToJson(Vehiculo instance) => <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'en_uso': instance.en_uso,
      'kilometraje': instance.kilometraje,
      'marca': instance.marca,
      'modelo': instance.modelo,
      'linea': instance.linea,
      'patente': instance.patente,
      'imei': instance.imei,
      'tipo': instance.tipo,
      'pendientes': instance.pendientes,
    };

EvaluacionesPendientes _$EvaluacionesPendientesFromJson(
        Map<String, dynamic> json) =>
    EvaluacionesPendientes()
      ..id = json['id'] as int?
      ..titulo = json['titulo'] as String?
      ..pendiente = json['pendiente'] as bool?
      ..vencimiento = json['vencimiento'] as int?
      ..intervaloDias = json['intervaloDias'] as int?;

Map<String, dynamic> _$EvaluacionesPendientesToJson(
        EvaluacionesPendientes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titulo': instance.titulo,
      'pendiente': instance.pendiente,
      'vencimiento': instance.vencimiento,
      'intervaloDias': instance.intervaloDias,
    };
