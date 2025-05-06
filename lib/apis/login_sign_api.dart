part of 'index.dart';

abstract class LoginSignApi {
  static Future<bool> postAppVerify() async {
    final res = await HttpService.to.post(
      Urls.appVerify,
    );

    if (res.code != 0) {
      // showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      return true;
    }
    return false;
  }

  ///
  static Future<List<ClientConfigModel>> postAppGetClientConf() async {
    final res = await HttpService.to.post(
      Urls.appGetClientConf,
    );
    if (res.code != 0) {
      // showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      ConfigStore.to.setAppConfig(jsonEncode(res.data));

      final List? list = res.data as List?;
      final List<ClientConfigModel> clientList = list
              ?.map(
                  (e) => ClientConfigModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];
      ConfigStore.to.setClientConfigList(clientList);

      return clientList;
    }
    return [];
  }

  ///
  static Future<PicUpdateConfig?> getAwsS3Conf() async {
    final res = await HttpService.to.post(
      Urls.getAwsS3Conf,
    );
    if (res.code != 0) {
      // showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      return PicUpdateConfig.fromJson(res.data);
    }
    return null;
  }

  static Future<PicUpdateConfig?> getMinioConf() async {
    final res = await HttpService.to.post(
      Urls.getMinioConf,
    );
    if (res.code != 0) {
      // showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      return PicUpdateConfig.fromJson(res.data);
    }
    return null;
  }

  static Future<PicUpdateConfig?> getAliOssConf() async {
    final res = await HttpService.to.post(
      Urls.getAliOssConf,
    );
    if (res.code != 0) {
      // showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      return PicUpdateConfig.fromJson(res.data);
    }
    return null;
  }

  static Future<UserInfo?> postUserCurr() async {
    final res = await HttpService.to.post(
      Urls.userCurr,
    );
    if (res.code != 0) {
      // showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      if (res.data != null) {
        return UserInfo.fromJson(res.data);
      }
    }
    return null;
  }

  ///captchaType: clickWord,blockPuzzle
  static Future<VerifyCodeModel?> anjiCaptchaGet(
      {String? captchaType = "blockPuzzle", String? clientUid}) async {
    Map params = {
      "captchaType": captchaType,
      "clientUid": clientUid ?? ConfigStore.to.deviceID,
      "ts": DateTime.now().microsecondsSinceEpoch
    };
    final res = await HttpService.to.post(
      Urls.anjiCaptchaGet,
      params: params,
    );
    if (res.code != 0) {
      // showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      return VerifyCodeModel.fromJson(res.data);
    }
    return null;
  }

  static Future<bool> anjiCaptchaCheck(
      {String? captchaType = "blockPuzzle",
      String? pointJson,
      dynamic token}) async {
    Map params = {
      "captchaType": captchaType,
      "pointJson": pointJson,
      "token": token
    };
    final res = await HttpService.to.post(
      Urls.anjiCaptchaCheck,
      params: params,
    );
    if (res.code != 0) {
      // showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      return true;
    }
    return false;
  }

  ///useType 1注册 2忘记密码 3修改登录密码 4修改支付密码
  static Future<bool> emailCodeSend({String? email, int? useType = 1}) async {
    var params = {"email": email, "useType": useType};
    final res = await HttpService.to.post(
      Urls.emailCodeSend,
      params: params,
      showLoading: true,
    );
    if (res.code != 0) {
      showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      return true;
    }
    return false;
  }

  static Future<bool> emailCodeCheck(
      {String? email, String? verifyCode, int? useType = 1}) async {
    var params = {"email": email, "verifyCode": verifyCode, "useType": useType};
    final res = await HttpService.to.post(
      Urls.emailCodeCheck,
      params: params,
    );
    if (res.code != 0) {
      showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      return true;
    }
    return false;
  }

  static Future<bool> registerCheck(
      {String? inviteCode, String? verifyCode, int? useType = 1}) async {
    var params = {
      "inviteCode": inviteCode,
    };
    final res = await HttpService.to.post(
      Urls.registerCheck,
      params: params,
      showLoading: true,
    );
    if (res.code != 0) {
      showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      return true;
    }
    return false;
  }

  ///regType 1代表邮箱 2代表手机号
  static Future<bool> register(RegisterRequest registerRequest) async {
    final res = await HttpService.to.post(
      Urls.register,
      params: registerRequest.toJson(),
      showLoading: true,
    );
    if (res.code != 0) {
      showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      return true;
    }
    return false;
  }

  static Future<bool> login(LoginRequest loginRequest) async {
    final res = await HttpService.to
        .post(Urls.login, params: loginRequest.toJson(), showLoading: true);
    if (res.code != 0) {
      showErrorMsg(
        res.code.toString(),
        res.msg ?? '',
      );
    } else {
      UserStore.to.setUserToken(res.data['token'], res.data['uid']);
      return true;
    }
    return false;
  }

  static Future<bool> saveUserIssues(
      PasswordProtectRequest passwordProtectRequest) async {
    final res = await HttpService.to.post(Urls.saveUserIssues,
        params: passwordProtectRequest.toUserIssuesJson(), showLoading: true);
    if (res.code != 0) {
      showErrorMsg(
        res.code.toString(),
        res.msg ?? '',
      );
    } else {
      return true;
    }
    return false;
  }

  static Future<List<CheckIssueList>?> getUserIssues(
      {String? loginName}) async {
    final res = await HttpService.to.post(Urls.getUserIssues,
        showLoading: true, params: {"loginName": loginName});
    if (res.code != 0) {
      showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      final List? list = res.data as List?;
      final List<CheckIssueList> clientList = list
              ?.map((e) => CheckIssueList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];
      return clientList;
    }
    return null;
  }

  static Future<String?> resetPasswordByEmailVerifyCode(
      String loginName, String verifyCode) async {
    final res = await HttpService.to.post(Urls.resetPasswordByEmailVerifyCode,
        params: {"loginName": loginName, "verifyCode": verifyCode},
        showLoading: true);
    if (res.code != 0) {
      showErrorMsg(
        res.code.toString(),
        res.msg ?? '',
      );
    } else {
      return res.data.toString();
    }
    return null;
  }

  static Future<String?> resetPasswordByUserIssue(
      PasswordProtectRequest passwordProtectRequest) async {
    final res = await HttpService.to.post(Urls.resetPasswordByUserIssue,
        params: passwordProtectRequest.toJson(), showLoading: true);
    if (res.code != 0) {
      showErrorMsg(
        res.code.toString(),
        res.msg ?? '',
      );
    } else {
      return res.data.toString();
    }
    return null;
  }
}
