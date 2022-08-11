import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class VersionView {
  final String? storeVersion;

  VersionView({this.storeVersion});

  factory VersionView.fromJson(Map<String, dynamic> json) => VersionView(storeVersion: json['storeVersion']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'storeVersion': storeVersion,
      };
}
