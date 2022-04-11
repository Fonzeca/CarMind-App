// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_uso.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LogUsoAdapter extends TypeAdapter<LogUso> {
  @override
  final int typeId = 9;

  @override
  LogUso read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LogUso()
      ..vehiculoId = fields[0] as int?
      ..timestamp = fields[1] as DateTime?
      ..enUso = fields[2] as bool?;
  }

  @override
  void write(BinaryWriter writer, LogUso obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.vehiculoId)
      ..writeByte(1)
      ..write(obj.timestamp)
      ..writeByte(2)
      ..write(obj.enUso);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LogUsoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogUso _$LogUsoFromJson(Map<String, dynamic> json) => LogUso()
  ..vehiculoId = json['vehiculoId'] as int?
  ..timestamp = json['timestamp'] == null
      ? null
      : DateTime.parse(json['timestamp'] as String)
  ..enUso = json['enUso'] as bool?;

Map<String, dynamic> _$LogUsoToJson(LogUso instance) => <String, dynamic>{
      'vehiculoId': instance.vehiculoId,
      'timestamp': instance.timestamp?.toIso8601String(),
      'enUso': instance.enUso,
    };
