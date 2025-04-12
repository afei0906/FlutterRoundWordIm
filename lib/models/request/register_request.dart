part of '../index.dart';
/// regType : 1
/// captchaVerification : "string"
/// verifyCode : "string"
/// loginName : "string"
/// password : "string"
/// nick : "string"
/// inviteCode : "string"

class RegisterRequest {
  RegisterRequest({
      this.regType, 
      this.captchaVerification, 
      this.verifyCode, 
      this.loginName, 
      this.password, 
      this.nick, 
      this.inviteCode,});

  RegisterRequest.fromJson(dynamic json) {
    regType = json['regType'];
    captchaVerification = json['captchaVerification'];
    verifyCode = json['verifyCode'];
    loginName = json['loginName'];
    password = json['password'];
    nick = json['nick'];
    inviteCode = json['inviteCode'];
  }
  dynamic regType;
  dynamic captchaVerification;
  dynamic verifyCode;
  dynamic loginName;
  dynamic password;
  dynamic nick;
  dynamic inviteCode;
RegisterRequest copyWith({  dynamic regType,
  dynamic captchaVerification,
  dynamic verifyCode,
  dynamic loginName,
  dynamic password,
  dynamic nick,
  dynamic inviteCode,
}) => RegisterRequest(  regType: regType ?? this.regType,
  captchaVerification: captchaVerification ?? this.captchaVerification,
  verifyCode: verifyCode ?? this.verifyCode,
  loginName: loginName ?? this.loginName,
  password: password ?? this.password,
  nick: nick ?? this.nick,
  inviteCode: inviteCode ?? this.inviteCode,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['regType'] = regType;
    if(!Utils.isEmpty(captchaVerification)) {
      map['captchaVerification'] = captchaVerification;
    }
    if(!Utils.isEmpty(verifyCode)) {
      map['verifyCode'] = verifyCode;
    }
    map['loginName'] = loginName;
    map['password'] = password;
    map['nick'] = nick;
    if(!Utils.isEmpty(inviteCode)) {
      map['inviteCode'] = inviteCode;
    }
    return map;
  }

}