// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluacion_terminada.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EvaluacionTerminadaPojoAdapter
    extends TypeAdapter<EvaluacionTerminadaPojo> {
  @override
  final int typeId = 11;

  @override
  EvaluacionTerminadaPojo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EvaluacionTerminadaPojo()
      ..vehiculo_id = fields[0] as int?
      ..respuestas = (fields[1] as List?)?.cast<RespuestaPojo>();
  }

  @override
  void write(BinaryWriter writer, EvaluacionTerminadaPojo obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.vehiculo_id)
      ..writeByte(1)
      ..write(obj.respuestas);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EvaluacionTerminadaPojoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RespuestaPojoAdapter extends TypeAdapter<RespuestaPojo> {
  @override
  final int typeId = 12;

  @override
  RespuestaPojo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RespuestaPojo()
      ..pregunta_id = fields[0] as int?
      ..tick_correcto = fields[1] as bool?
      ..base64_image = fields[2] as String?
      ..texto = fields[3] as String?
      ..opciones = (fields[4] as List?)?.cast<RespuestaOpcionPojo>();
  }

  @override
  void write(BinaryWriter writer, RespuestaPojo obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.pregunta_id)
      ..writeByte(1)
      ..write(obj.tick_correcto)
      ..writeByte(2)
      ..write(obj.base64_image)
      ..writeByte(3)
      ..write(obj.texto)
      ..writeByte(4)
      ..write(obj.opciones);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RespuestaPojoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RespuestaOpcionPojoAdapter extends TypeAdapter<RespuestaOpcionPojo> {
  @override
  final int typeId = 13;

  @override
  RespuestaOpcionPojo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RespuestaOpcionPojo()
      ..opcion_id = fields[0] as int?
      ..tick_correcto = fields[1] as bool?;
  }

  @override
  void write(BinaryWriter writer, RespuestaOpcionPojo obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.opcion_id)
      ..writeByte(1)
      ..write(obj.tick_correcto);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RespuestaOpcionPojoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvaluacionTerminadaPojo _$EvaluacionTerminadaPojoFromJson(
        Map<String, dynamic> json) =>
    EvaluacionTerminadaPojo()
      ..vehiculo_id = json['vehiculo_id'] as int?
      ..respuestas = (json['respuestas'] as List<dynamic>?)
          ?.map((e) => RespuestaPojo.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$EvaluacionTerminadaPojoToJson(
        EvaluacionTerminadaPojo instance) =>
    <String, dynamic>{
      'vehiculo_id': instance.vehiculo_id,
      'respuestas': instance.respuestas,
    };

RespuestaPojo _$RespuestaPojoFromJson(Map<String, dynamic> json) =>
    RespuestaPojo()
      ..pregunta_id = json['pregunta_id'] as int?
      ..tick_correcto = json['tick_correcto'] as bool?
      ..base64_image = json['base64_image'] as String?
      ..texto = json['texto'] as String?
      ..opciones = (json['opciones'] as List<dynamic>?)
          ?.map((e) => RespuestaOpcionPojo.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$RespuestaPojoToJson(RespuestaPojo instance) =>
    <String, dynamic>{
      'pregunta_id': instance.pregunta_id,
      'tick_correcto': instance.tick_correcto,
      'base64_image': instance.base64_image,
      'texto': instance.texto,
      'opciones': instance.opciones,
    };

RespuestaOpcionPojo _$RespuestaOpcionPojoFromJson(Map<String, dynamic> json) =>
    RespuestaOpcionPojo()
      ..opcion_id = json['opcion_id'] as int?
      ..tick_correcto = json['tick_correcto'] as bool?;

Map<String, dynamic> _$RespuestaOpcionPojoToJson(
        RespuestaOpcionPojo instance) =>
    <String, dynamic>{
      'opcion_id': instance.opcion_id,
      'tick_correcto': instance.tick_correcto,
    };
