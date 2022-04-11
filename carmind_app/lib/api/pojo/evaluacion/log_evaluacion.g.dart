// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_evaluacion.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LogEvaluacionAdapter extends TypeAdapter<LogEvaluacion> {
  @override
  final int typeId = 8;

  @override
  LogEvaluacion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LogEvaluacion()
      ..log_id = fields[0] as int?
      ..evaluacion_id = fields[1] as int?
      ..nombre_evaluacion = fields[2] as String?
      ..fecha = fields[3] as String?
      ..vehiculo_id = fields[4] as int?
      ..nombre_vehiculo = fields[5] as String?
      ..usuario_id = fields[6] as int?
      ..nombre_usuario = fields[7] as String?
      ..apellido_usuario = fields[8] as String?;
  }

  @override
  void write(BinaryWriter writer, LogEvaluacion obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.log_id)
      ..writeByte(1)
      ..write(obj.evaluacion_id)
      ..writeByte(2)
      ..write(obj.nombre_evaluacion)
      ..writeByte(3)
      ..write(obj.fecha)
      ..writeByte(4)
      ..write(obj.vehiculo_id)
      ..writeByte(5)
      ..write(obj.nombre_vehiculo)
      ..writeByte(6)
      ..write(obj.usuario_id)
      ..writeByte(7)
      ..write(obj.nombre_usuario)
      ..writeByte(8)
      ..write(obj.apellido_usuario);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LogEvaluacionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogEvaluacion _$LogEvaluacionFromJson(Map<String, dynamic> json) =>
    LogEvaluacion()
      ..log_id = json['log_id'] as int?
      ..evaluacion_id = json['evaluacion_id'] as int?
      ..nombre_evaluacion = json['nombre_evaluacion'] as String?
      ..fecha = json['fecha'] as String?
      ..vehiculo_id = json['vehiculo_id'] as int?
      ..nombre_vehiculo = json['nombre_vehiculo'] as String?
      ..usuario_id = json['usuario_id'] as int?
      ..nombre_usuario = json['nombre_usuario'] as String?
      ..apellido_usuario = json['apellido_usuario'] as String?;

Map<String, dynamic> _$LogEvaluacionToJson(LogEvaluacion instance) =>
    <String, dynamic>{
      'log_id': instance.log_id,
      'evaluacion_id': instance.evaluacion_id,
      'nombre_evaluacion': instance.nombre_evaluacion,
      'fecha': instance.fecha,
      'vehiculo_id': instance.vehiculo_id,
      'nombre_vehiculo': instance.nombre_vehiculo,
      'usuario_id': instance.usuario_id,
      'nombre_usuario': instance.nombre_usuario,
      'apellido_usuario': instance.apellido_usuario,
    };
