// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_evaluacion_terminada.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LogEvaluacionTerminadaPojoAdapter
    extends TypeAdapter<LogEvaluacionTerminadaPojo> {
  @override
  final int typeId = 10;

  @override
  LogEvaluacionTerminadaPojo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LogEvaluacionTerminadaPojo()
      ..fecha = fields[0] as String?
      ..evaluacionId = fields[1] as int?
      ..respuesta = fields[2] as EvaluacionTerminadaPojo?;
  }

  @override
  void write(BinaryWriter writer, LogEvaluacionTerminadaPojo obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.fecha)
      ..writeByte(1)
      ..write(obj.evaluacionId)
      ..writeByte(2)
      ..write(obj.respuesta);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LogEvaluacionTerminadaPojoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogEvaluacionTerminadaPojo _$LogEvaluacionTerminadaPojoFromJson(
        Map<String, dynamic> json) =>
    LogEvaluacionTerminadaPojo()
      ..fecha = json['fecha'] as String?
      ..evaluacionId = json['evaluacionId'] as int?
      ..respuesta = json['respuesta'] == null
          ? null
          : EvaluacionTerminadaPojo.fromJson(
              json['respuesta'] as Map<String, dynamic>);

Map<String, dynamic> _$LogEvaluacionTerminadaPojoToJson(
        LogEvaluacionTerminadaPojo instance) =>
    <String, dynamic>{
      'fecha': instance.fecha,
      'evaluacionId': instance.evaluacionId,
      'respuesta': instance.respuesta,
    };
