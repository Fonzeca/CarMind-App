import 'package:json_annotation/json_annotation.dart';

import 'package:carmind_app/api/api.dart';

part 'sync_view.g.dart';

@JsonSerializable()
class SyncView {
  List<LogUso>? logUso;

  List<LogEvaluacionTerminadaPojo>? evaluacionesRealizadas;

  SyncView();

  factory SyncView.fromJson(Map<String, dynamic> json) => _$SyncViewFromJson(json);
  Map<String, dynamic> toJson() => _$SyncViewToJson(this);
}
