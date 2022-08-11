import 'package:carmind_app/api/api.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SyncView {
  final List<LogUso>? logUso;

  final List<LogEvaluacionTerminadaPojo>? evaluacionesRealizadas;

  SyncView({this.logUso, this.evaluacionesRealizadas});

  factory SyncView.fromJson(Map<String, dynamic> json) => SyncView(
      logUso: List<LogUso>.from(json["logUso"].map((x) => LogUso.fromJson(x))),
      evaluacionesRealizadas:
          List<LogEvaluacionTerminadaPojo>.from(json["evaluacionesRealizadas"].map((x) => LogEvaluacionTerminadaPojo.fromJson(x))));

  Map<String, dynamic> toJson() => <String, dynamic>{
        'logUso': logUso,
        'evaluacionesRealizadas': evaluacionesRealizadas,
      };
}
