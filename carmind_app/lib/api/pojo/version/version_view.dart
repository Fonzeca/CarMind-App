import 'package:json_annotation/json_annotation.dart';

part 'version_view.g.dart';

@JsonSerializable()
class VersionView {
  String? storeVersion;

  VersionView();

  factory VersionView.fromJson(Map<String, dynamic> json) => _$VersionViewFromJson(json);
  Map<String, dynamic> toJson() => _$VersionViewToJson(this);
}
