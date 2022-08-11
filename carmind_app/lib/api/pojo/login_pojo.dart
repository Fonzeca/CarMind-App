import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class TokenLogin {
  final String? token;
  final bool? mustChangePassword;

  TokenLogin({this.token, this.mustChangePassword});

  factory TokenLogin.fromJson(Map<String, dynamic> json) => TokenLogin(token: json['token'], mustChangePassword: json['mustChangePassword']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'token': token,
        'mustChangePassword': mustChangePassword,
      };
}
