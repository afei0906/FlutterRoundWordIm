part of 'index.dart';

class ConfigStore extends GetxController {
  static ConfigStore get to => Get.find<ConfigStore>();

  String? deviceID;
  String? appVersion;
  String? buildNumber;

  String get languageName => 'English';

  @override
  Future<void> onInit() async {
    super.onInit();
    await _initConfig();
  }

  Future<void> _initConfig() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceID = iosInfo.identifierForVendor;
    } else if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceID = androidInfo.id;
    }
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
  }

  Future<void> setLoadDataTime(int isDebugUrl) async {
    StorageService.to.setString(kLocalLoadDataTime, isDebugUrl.toString());
  }

  int getLoadDataTime() {
    final String time = StorageService.to.getString(kLocalLoadDataTime);
    return Utils.isEmpty(time) ? 0 : int.parse(time);
  }

  bool isLoad() {
    final int time = DateTime
        .now()
        .microsecondsSinceEpoch;
    if ((time - getLoadDataTime()) > 2 * 1000 * 1000 * 60) {
      return true;
    }
    return false;
  }

  Future<bool> setDebugUrl(bool isDebugUrl) async {
    return StorageService.to.setBool(kLocalDebugBool, isDebugUrl);
  }

  bool? getDebugUrl() {
    return StorageService.to.getBool(kLocalDebugBool);
  }

  Future<bool> setOpenDebug(bool isDebugUrl) async {
    return StorageService.to.setBool(kLocalOpenDebug, isDebugUrl);
  }

  bool isOpenDebug() {
    return StorageService.to.getBool(kLocalOpenDebug) ?? false;
  }

  bool isStartGuide() {
    return StorageService.to.getBool(kLocalStartGuide) ?? false;
  }

  Future<bool> setStartGuide(bool isStartGuide) async {
    return StorageService.to.setBool(kLocalStartGuide, isStartGuide);
  }

  bool isHomeStartGuide() {
    // log(">>>>${ConfigStore.to.isStartGuide()}");
    if (isStartGuide()) {
      setHomeStartGuide(false);
      setSelectPayerStartGuide(false);
      setBillStartGuide(false);
      setContactStartGuide(false);
    }
    return StorageService.to.getBool(kLocalHomeStartGuide) ?? false;
  }

  Future<bool> setHomeStartGuide(bool isStartGuide) async {
    return StorageService.to.setBool(kLocalHomeStartGuide, isStartGuide);
  }

  bool isSelectPayerStartGuide() {
    return StorageService.to.getBool(kLocalSelectPayerStartGuide) ?? false;
  }

  Future<bool> setSelectPayerStartGuide(bool isStartGuide) async {
    return StorageService.to.setBool(kLocalSelectPayerStartGuide, isStartGuide);
  }

  bool isBillStartGuide() {
    return StorageService.to.getBool(kLocalBillStartGuide) ?? false;
  }

  Future<bool> setBillStartGuide(bool isStartGuide) async {
    return StorageService.to.setBool(kLocalBillStartGuide, isStartGuide);
  }


  bool isContactStartGuide() {
    return StorageService.to.getBool(kLocalContactStartGuide) ?? false;
  }

  Future<bool> setContactStartGuide(bool isStartGuide) async {
    return StorageService.to.setBool(kLocalContactStartGuide, isStartGuide);
  }
}
