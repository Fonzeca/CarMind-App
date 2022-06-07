import 'package:json_annotation/json_annotation.dart';

part 'login_pojo.g.dart';

@JsonSerializable()
class TokenLogin {
  String? token;
  bool? mustChangePassword;
  
  TokenLogin();

  factory TokenLogin.fromJson(Map<String, dynamic> json) => _$TokenLoginFromJson(json);
  Map<String, dynamic> toJson() => _$TokenLoginToJson(this);
}
