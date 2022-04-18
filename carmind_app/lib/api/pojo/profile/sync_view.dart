import 'package:carmind_app/api/pojo/evaluacion/log_evaluacion_terminada.dart';
import 'package:carmind_app/api/pojo/vehiculo/log_uso.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sync_view.g.dart';

@JsonSerializable()
class SyncView {
  List<LogUso>? logUso;

  List<LogEvaluacionTerminadaPojo>? evaluacionesRealizadas;

  SyncView();

  factory SyncView.fromJson(Map<String, dynamic> json) => _$SyncViewFromJson(json);
  Map<String, dynamic> toJson() => _$SyncViewToJson(this);
}
