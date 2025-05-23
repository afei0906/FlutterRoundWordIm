part of 'index.dart';

abstract class UserApi {

  static Future<bool> getSignInRule() async {
    final res = await HttpService.to.post(
      Urls.getSignInRule,
    );

    if (res.code != 0) {
      showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      return true;
    }
    return false;
  }


  static Future<bool> signIn() async {
    final res = await HttpService.to.post(
      Urls.signIn,
    );

    if (res.code != 0) {
      // showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      return true;
    }
    return false;
  }


  static Future<UserInfo?> getOtherUserInfo(dynamic id) async {
    final res = await HttpService.to.post(
      Urls.userInfo, params: {"id":id}
    );

    if (res.code != 0) {
      // showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      return UserInfo.fromJson(res.data);
    }
    return null;
  }



}