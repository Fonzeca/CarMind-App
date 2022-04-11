// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoggedUserAdapter extends TypeAdapter<LoggedUser> {
  @override
  final int typeId = 3;

  @override
  LoggedUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoggedUser()
      ..id = fields[0] as int?
      ..nombre = fields[1] as String?
      ..apellido = fields[2] as String?
      ..username = fields[3] as String?
      ..dni = fields[4] as String?
      ..empresa = fields[5] as int?
      ..administrador = fields[6] as bool?;
  }

  @override
  void write(BinaryWriter writer, LoggedUser obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nombre)
      ..writeByte(2)
      ..write(obj.apellido)
      ..writeByte(3)
      ..write(obj.username)
      ..writeByte(4)
      ..write(obj.dni)
      ..writeByte(5)
      ..write(obj.empresa)
      ..writeByte(6)
      ..write(obj.administrador);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoggedUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoggedUser _$LoggedUserFromJson(Map<String, dynamic> json) => LoggedUser()
  ..id = json['id'] as int?
  ..nombre = json['nombre'] as String?
  ..apellido = json['apellido'] as String?
  ..username = json['username'] as String?
  ..dni = json['dni'] as String?
  ..empresa = json['empresa'] as int?
  ..administrador = json['administrador'] as bool?;

Map<String, dynamic> _$LoggedUserToJson(LoggedUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'apellido': instance.apellido,
      'username': instance.username,
      'dni': instance.dni,
      'empresa': instance.empresa,
      'administrador': instance.administrador,
    };
