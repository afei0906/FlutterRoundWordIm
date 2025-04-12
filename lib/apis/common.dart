part of 'index.dart';

abstract class CommonAPI {
  static Future<List<DictItem>> appDictItem(
      {String? code = 'user_issues_type'}) async {
    final res = await HttpService.to
        .post(Urls.appDictItem, showLoading: true, params: {"code": code});
    if (res.code != 0) {
      showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      final List? list = res.data as List?;
      final List<DictItem> clientList = list
              ?.map((e) => DictItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];
      return clientList;
    }
    return [];
  }
}

void showErrorMsg(String code, String msg) {
  String errorCode = "errorCode_$code".tr;
  if (code == "401") {
    UserStore.to.logout();
    return;
  }
  // if (errorCode == "errorCode_$code") {
  errorCode = msg;
  // }
  SmartDialog.showToast(errorCode, alignment: Alignment.center);
}
