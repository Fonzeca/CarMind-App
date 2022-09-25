import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'log_uso.g.dart';

@JsonSerializable()
@Collection()
class LogUso extends Equatable {
  @Id()
  @JsonKey(ignore: true)
  int? privateId;

  int? vehiculoId;

  String? fecha;

  bool? enUso;

  LogUso();

  factory LogUso.fromJson(Map<String, dynamic> json) => _$LogUsoFromJson(json);
  Map<String, dynamic> toJson() => _$LogUsoToJson(this);

  @override
  List<Object?> get props => [];
}
