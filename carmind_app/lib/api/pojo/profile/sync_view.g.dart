// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncView _$SyncViewFromJson(Map<String, dynamic> json) => SyncView()
  ..logUso = (json['logUso'] as List<dynamic>?)
      ?.map((e) => LogUso.fromJson(e as Map<String, dynamic>))
      .toList()
  ..evaluacionesRealizadas = (json['evaluacionesRealizadas'] as List<dynamic>?)
      ?.map(
          (e) => LogEvaluacionTerminadaPojo.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$SyncViewToJson(SyncView instance) => <String, dynamic>{
      'logUso': instance.logUso,
      'evaluacionesRealizadas': instance.evaluacionesRealizadas,
    };
