import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'log_uso.g.dart';

@JsonSerializable()
@HiveType(typeId: 9)
class LogUso extends Equatable {
  @HiveField(0)
  int? vehiculoId;

  @HiveField(1)
  DateTime? timestamp;

  @HiveField(2)
  bool? enUso;

  LogUso();

  factory LogUso.fromJson(Map<String, dynamic> json) => _$LogUsoFromJson(json);
  Map<String, dynamic> toJson() => _$LogUsoToJson(this);

  @override
  List<Object?> get props => [];
}
