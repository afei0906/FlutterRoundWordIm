part of 'index.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  bool _isLogin = false;
  String _token = '';
  String? userId;

  bool get isLogin => _isLogin;

  String get token => _token;

  bool get hasToken => _token.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    _token = StorageService.to.getString(kLocalToken);
    _isLogin = !Utils.isEmpty(_token);
  }

  Future<void> setToken(String value) async {
    await StorageService.to.setString(kLocalToken, value);
    _token = value;
  }

  Future<void> logout() async {
    await StorageService.to.remove(kLocalAccount);
    await StorageService.to.remove(kLocalToken);
    _token = '';
    _isLogin = false;
    Get.offNamed(Routes.login);
  }

  Future<void> clear() async {
    await StorageService.to.remove(kLocalFriendHotSearch);
    await StorageService.to.remove(kLocalSplitHotSearch);
  }

  Future<void> delete() async {
    await LanguageStore.to.removeLanguageCode();
    await StorageService.to.remove(kLocalAccount);
    await StorageService.to.remove(kLocalToken);
  }
}
