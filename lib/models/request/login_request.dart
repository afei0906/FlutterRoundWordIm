/// loginName : "+8613395143683"
/// password : "123456"
/// captchaVerification : ""
part of '../index.dart';

class LoginRequest {
  LoginRequest({
    this.loginName,
    this.password,
    this.captchaVerification,
  });

  LoginRequest.fromJson(dynamic json) {
    loginName = json['loginName'];
    password = json['password'];
    captchaVerification = json['captchaVerification'];
  }

  dynamic loginName;
  dynamic password;
  dynamic captchaVerification;

  LoginRequest copyWith({
    dynamic loginName,
    dynamic password,
    dynamic captchaVerification,
  }) =>
      LoginRequest(
        loginName: loginName ?? this.loginName,
        password: password ?? this.password,
        captchaVerification: captchaVerification ?? this.captchaVerification,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['loginName'] = loginName;
    map['password'] = password;
    if (!Utils.isEmpty(captchaVerification))
      map['captchaVerification'] = captchaVerification;
    return map;
  }
}
