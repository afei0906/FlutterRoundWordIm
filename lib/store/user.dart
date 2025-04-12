part of 'index.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  RxBool _isLogin = false.obs;

  // String _token = '';
  // String? userId;

  RxBool get isLogin => _isLogin;

  // String get token => _token;
  //
  // bool get hasToken => _token.isNotEmpty;
  Rx<UserInfo> userInfo = UserInfo().obs;

  @override
  void onInit() {
    super.onInit();
    final String userInfoStr = StorageService.to.getString(kLocalUserInfo);
    // log(">>>>userInfoStr$userInfoStr");
    if (!Utils.isEmpty(userInfoStr)) {
      userInfo.value = UserInfo.fromJson(json.decode(userInfoStr));
      getIsLoginValue();
    }
  }

  void getIsLoginValue() {
    //_isLogin.value = !Utils.isEmpty(userInfo.value.id);
  }

  void setLogin(bool isLogin) {
    _isLogin.value = isLogin;
    update();
  }

  Future<bool> getUserInfo() async {
    bool isOk = false;
    UserInfo? curUserInfo = await LoginSignApi.postUserCurr();
    isOk = (curUserInfo != null);
    curUserInfo ??= userInfo.value;
    curUserInfo.token = userInfo.value.token;
    userInfo.value = curUserInfo;
    getIsLoginValue();
    await StorageService.to
        .setString(kLocalUserInfo, json.encode(userInfo.value.toJson()));
    return isOk;
  }

  Future<void> setUserToken(dynamic token, dynamic userId) async {
    userInfo.value.token = token;
    userInfo.value.id = userId;
    await StorageService.to
        .setString(kLocalUserInfo, json.encode(userInfo.value.toJson()));
  }

  Future<void> logout() async {
    await StorageService.to.remove(kLocalUserInfo);
    _isLogin = false.obs;
    Get.offNamed(Routes.splash);
  }

  Future<void> delete() async {
    await LanguageStore.to.removeLanguageCode();
    await StorageService.to.remove(kLocalUserInfo);
  }
}
