import 'package:json_annotation/json_annotation.dart';

part 'recover_password_user.g.dart';



@JsonSerializable()
class  RecoverPasswordUserPojo{

  String? email;

  String? token;

  String? newPassword;

  RecoverPasswordUserPojo();

  factory RecoverPasswordUserPojo.fromJson(Map<String, dynamic> json) => _$RecoverPasswordUserPojoFromJson(json);
  Map<String, dynamic> toJson() => _$RecoverPasswordUserPojoToJson(this);
}

