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

  static Future<UserInfo?> postUserCurr() async {
    final res = await HttpService.to.post(
      Urls.userCurr,
    );
    if (res.code != 0) {
      // showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      return UserInfo.fromJson(res.data);
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

  static Future<bool> emailCodeSend({String? email, int? useType = 1}) async {
    var params = {"email": email, "useType": useType};
    final res = await HttpService.to.post(
      Urls.emailCodeSend,
      params: params,
      showLoading: true,
    );
    if (res.code != 0) {
      /**/ showErrorMsg(res.code.toString(), res.msg ?? '');
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
}
