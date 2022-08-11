import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RecoverPasswordUserPojo {
  String? email;

  String? token;

  String? newPassword;

  RecoverPasswordUserPojo({this.email, this.token, this.newPassword});

  factory RecoverPasswordUserPojo.fromJson(Map<String, dynamic> json) =>
      RecoverPasswordUserPojo(email: json['email'], token: json['token'], newPassword: json['newPassword']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'email': email,
        'token': token,
        'newPassword': newPassword,
      };
}
