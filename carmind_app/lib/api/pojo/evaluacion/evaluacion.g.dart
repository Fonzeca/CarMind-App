// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluacion.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EvaluacionAdapter extends TypeAdapter<Evaluacion> {
  @override
  final int typeId = 4;

  @override
  Evaluacion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Evaluacion()
      ..id = fields[0] as int?
      ..vehiculo_id = (fields[1] as List?)?.cast<int>()
      ..titulo = fields[2] as String?
      ..secciones = (fields[3] as List?)?.cast<SeccionPojo>();
  }

  @override
  void write(BinaryWriter writer, Evaluacion obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.vehiculo_id)
      ..writeByte(2)
      ..write(obj.titulo)
      ..writeByte(3)
      ..write(obj.secciones);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EvaluacionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SeccionPojoAdapter extends TypeAdapter<SeccionPojo> {
  @override
  final int typeId = 5;

  @override
  SeccionPojo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SeccionPojo()
      ..id = fields[0] as int?
      ..nombre = fields[1] as String?
      ..preguntas = (fields[2] as List?)?.cast<PreguntaPojo>();
  }

  @override
  void write(BinaryWriter writer, SeccionPojo obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nombre)
      ..writeByte(2)
      ..write(obj.preguntas);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeccionPojoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PreguntaPojoAdapter extends TypeAdapter<PreguntaPojo> {
  @override
  final int typeId = 6;

  @override
  PreguntaPojo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PreguntaPojo()
      ..id = fields[0] as int?
      ..descripcion = fields[1] as String?
      ..tipo = fields[2] as String?
      ..opciones = (fields[3] as List?)?.cast<OpcionPojo>();
  }

  @override
  void write(BinaryWriter writer, PreguntaPojo obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.descripcion)
      ..writeByte(2)
      ..write(obj.tipo)
      ..writeByte(3)
      ..write(obj.opciones);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PreguntaPojoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OpcionPojoAdapter extends TypeAdapter<OpcionPojo> {
  @override
  final int typeId = 7;

  @override
  OpcionPojo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OpcionPojo()
      ..id = fields[0] as int?
      ..texto = fields[1] as String?;
  }

  @override
  void write(BinaryWriter writer, OpcionPojo obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.texto);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OpcionPojoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Evaluacion _$EvaluacionFromJson(Map<String, dynamic> json) => Evaluacion()
  ..id = json['id'] as int?
  ..vehiculo_id =
      (json['vehiculo_id'] as List<dynamic>?)?.map((e) => e as int).toList()
  ..titulo = json['titulo'] as String?
  ..secciones = (json['secciones'] as List<dynamic>?)
      ?.map((e) => SeccionPojo.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$EvaluacionToJson(Evaluacion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehiculo_id': instance.vehiculo_id,
      'titulo': instance.titulo,
      'secciones': instance.secciones,
    };

SeccionPojo _$SeccionPojoFromJson(Map<String, dynamic> json) => SeccionPojo()
  ..id = json['id'] as int?
  ..nombre = json['nombre'] as String?
  ..preguntas = (json['preguntas'] as List<dynamic>?)
      ?.map((e) => PreguntaPojo.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$SeccionPojoToJson(SeccionPojo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'preguntas': instance.preguntas,
    };

PreguntaPojo _$PreguntaPojoFromJson(Map<String, dynamic> json) => PreguntaPojo()
  ..id = json['id'] as int?
  ..descripcion = json['descripcion'] as String?
  ..tipo = json['tipo'] as String?
  ..opciones = (json['opciones'] as List<dynamic>?)
      ?.map((e) => OpcionPojo.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$PreguntaPojoToJson(PreguntaPojo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'descripcion': instance.descripcion,
      'tipo': instance.tipo,
      'opciones': instance.opciones,
    };

OpcionPojo _$OpcionPojoFromJson(Map<String, dynamic> json) => OpcionPojo()
  ..id = json['id'] as int?
  ..texto = json['texto'] as String?;

Map<String, dynamic> _$OpcionPojoToJson(OpcionPojo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'texto': instance.texto,
    };
