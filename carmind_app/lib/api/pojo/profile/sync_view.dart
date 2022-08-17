import 'package:carmind_app/api/api.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SyncView {
  final List<LogUso>? logsUso;

  final List<LogEvaluacion>? logsEvaluaciones;

  SyncView({this.logsUso, this.logsEvaluaciones});

  factory SyncView.fromJson(Map<String, dynamic> json) => SyncView(
      logsUso: List<LogUso>.from(json["logsUso"].map((x) => LogUso.fromJson(x))),
      logsEvaluaciones: List<LogEvaluacion>.from(json["logsEvaluaciones"].map((x) => LogEvaluacion.fromJson(x))));

  Map<String, dynamic> toJson() => <String, dynamic>{
        'logsUso': logsUso,
        'logsEvaluaciones': logsEvaluaciones,
      };
}
