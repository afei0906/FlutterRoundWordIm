part of 'index.dart';

abstract class CommonAPI {
  static Future<RateBean?> getExchangeRate() async {
    final res = await HttpService.to.get(
      Urls.exchangeRate,
    );
    if (res.code != 0) {
      // showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      await StorageService.to.setString(kLocalRate, jsonEncode(res.data));
      return rateBeanFromJson(jsonEncode(res.data));
    }
    return null;
  }
}

void showErrorMsg(String code, String msg) {
  String errorCode = "errorCode_$code".tr;
  CustomToast.dismiss();
  if (code == "401") {
    UserStore.to.logout();

    return;
  }
  if (errorCode == "errorCode_$code") {
    errorCode = msg;
  }
  CustomToast.text(errorCode);
}
