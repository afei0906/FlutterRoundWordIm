part of '../index.dart';

class SignSussState {
  ///0 phone，1、email
  int formType = 0;


  ///0 注册成功 1，设置密保成功,2.忘记密码
  int type = 0;

  dynamic captchaVerification;
  dynamic loginName;
  dynamic passWord;
}
