part of 'index.dart';

class ConfigStore extends GetxController {
  static ConfigStore get to => Get.find<ConfigStore>();

  String? deviceID;
  String? appVersion;
  String? buildNumber;

  String get languageName => 'English';
  static const String awsS3 = "AwsS3";
  static const String minio = "Minio";
  static const String aliOss = "AliOss";

  RxList<ClientConfigModel> mClientConfigList = RxList();
  RxMap<String, PicUpdateConfig?> picUpConfig = RxMap();

  @override
  Future<void> onInit() async {
    super.onInit();
    await _initConfig();
  }

  Future<void> featData() async {
    await LoginSignApi.postAppGetClientConf();
    await LoginSignApi.getAwsS3Conf().then((onValue) {
      picUpConfig[awsS3] = onValue;
      setPicConfig();
    });
    LoginSignApi.getMinioConf().then((onValue) {
      picUpConfig[minio] = onValue;
      setPicConfig();
    });
    LoginSignApi.getAliOssConf().then((onValue) {
      picUpConfig[aliOss] = onValue;
      setPicConfig();
    });
  }

  void setClientConfigList(List<ClientConfigModel> clientList) {
    if (clientList.isNotEmpty) {
      ConfigStore.to.mClientConfigList.value = clientList;
    }
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
    getAppConfig();
  }

  void getAppConfig() {
    final String listStr = StorageService.to.getString(kLocalAppConfig);
    if (!Utils.isEmpty(listStr)) {
      final List? list = json.decode(listStr) as List?;
      final List<ClientConfigModel> clientList = list
          ?.map(
              (e) => ClientConfigModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
          [];
      if (clientList.isNotEmpty) {
        mClientConfigList.value = clientList;
      }
    }

    final String picStr = StorageService.to.getString(kLocalPicConfig);
    if (!Utils.isEmpty(picStr)) {
      final Map<String, dynamic> map =
      json.decode(picStr) as Map<String, dynamic>;
      if (!Utils.isEmpty(map[awsS3])) {
        picUpConfig[awsS3] = PicUpdateConfig.fromJson(map[awsS3]);
      }
      if (!Utils.isEmpty(map[minio])) {
        picUpConfig[minio] = PicUpdateConfig.fromJson(map[minio]);
      }
      if (!Utils.isEmpty(map[aliOss])) {
        picUpConfig[aliOss] = PicUpdateConfig.fromJson(map[aliOss]);
      }
    }
  }

  ///本地存储APP配置信息
  Future<void> setPicConfig() async {
    final Map<String, dynamic> map = {};
    picUpConfig.forEach((key, v) {
      map[key] = v?.toJson();
    });
    await StorageService.to.setString(kLocalPicConfig, jsonEncode(map));
  }

  ///本地存储APP配置信息
  void setAppConfig(String config) {
    StorageService.to.setString(kLocalAppConfig, config);
  }

  ///是否开始Email功能 1：开启，0：关闭
  bool isOpenEmail() {
    final ClientConfigModel configModel =
    mClientConfigList.firstWhere((e) => e.configKey == "isOpenEmail");
    return configModel.configValue == '1';
  }

  ///是否开启手机号功能 1：开启，0：关闭
  bool isOpenPhone() {
    final ClientConfigModel configModel =
    mClientConfigList.firstWhere((e) => e.configKey == "isOpenPhone");
    return configModel.configValue == '1';
  }

  ///是否开启注册 1：开启，0：关闭
  bool isOpenRegister() {
    final ClientConfigModel configModel =
    mClientConfigList.firstWhere((e) => e.configKey == "isOpenRegister");
    return configModel.configValue == '1';
  }

  ///是否展示密保 1：开启，0：关闭
  bool isOpenUserIssues() {
    final ClientConfigModel configModel =
    mClientConfigList.firstWhere((e) => e.configKey == "isOpenUserIssues");
    return configModel.configValue == '1';
  }

  ///是否开启拼图验证 1：开启，0：关闭
  bool isOpenVerifyCode() {
    final ClientConfigModel configModel =
    mClientConfigList.firstWhere((e) => e.configKey == "isOpenVerifyCode");
    return configModel.configValue == '1';
  }

  /// 16.注册时需要使用邀请码 1：开启，0：关闭
  bool isOpenInviteCode() {
    final ClientConfigModel configModel =
    mClientConfigList.firstWhere((e) => e.configKey == "isOpenInviteCode");
    return configModel.configValue == '1';
  }

  ///密保问题数量
  int getUserIssuesCount() {
    final ClientConfigModel configModel =
    mClientConfigList.firstWhere((e) => e.configKey == "userIssuesCount");
    return int.parse("${configModel.configValue ?? '0'}");
  }
}
