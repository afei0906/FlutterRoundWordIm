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

  LocalLoginInfo? localLoginInfo;

  @override
  void onInit() {
    super.onInit();
    final String userInfoStr = StorageService.to.getString(kLocalUserInfo);
    // log(">>>>userInfoStr$userInfoStr");
    if (!Utils.isEmpty(userInfoStr)) {
      userInfo.value = UserInfo.fromJson(json.decode(userInfoStr));
      getIsLoginValue();
    }
    getLocalLoginInfo();
  }

  void getIsLoginValue() {
    _isLogin.value = !Utils.isEmpty(userInfo.value.id);
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
    if (!isOk) {
      logout();
    }
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
    await HttpService.to.clearCookie();
    _isLogin = false.obs;
    if (UserStore.to.localLoginInfo?.type == 0) {
      if (ConfigStore.to.isOpenPhone()) {
        Get.toNamed(Routes.loginPhone);
      } else if (ConfigStore.to.isOpenEmail()) {
        Get.toNamed(Routes.loginEmail);
      } else {
        Get.offNamed(Routes.splash);
      }
      return;
    }
    if (UserStore.to.localLoginInfo?.type == 1) {
      if (ConfigStore.to.isOpenEmail()) {
        Get.toNamed(Routes.loginEmail);
      } else if (ConfigStore.to.isOpenPhone()) {
        Get.toNamed(Routes.loginPhone);
      } else {
        Get.offNamed(Routes.splash);
      }
    }
  }

  Future<void> delete() async {
    await LanguageStore.to.removeLanguageCode();
    await StorageService.to.remove(kLocalUserInfo);
  }

  Future<void> setLocalLoginInfo(LocalLoginInfo l) async {
    localLoginInfo = l;
    await StorageService.to.setString(kLocalLoginInfo, json.encode(l.toJson()));
  }

  Future<LocalLoginInfo?> getLocalLoginInfo() async {
    final String jsonStr = StorageService.to.getString(kLocalLoginInfo);
    if (!Utils.isEmpty(jsonStr)) {
      localLoginInfo = LocalLoginInfo.fromJson(json.decode(jsonStr));
    }
    return localLoginInfo;
  }
}
