import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:store/services/index.dart';
import 'package:store/store/index.dart';


class Global {
  static final Global _instance = Global._internal();

  factory Global() => _instance;

  Global._internal();

  static Future<void> init() async {

    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await Future.wait([
      Get.putAsync<StorageService>(() => StorageService().init()),
    ]).whenComplete(() {
      Get.put<ConfigStore>(ConfigStore());
      Get.put<HttpService>(HttpService());
      Get.put<UserStore>(UserStore());
      Get.put<LanguageStore>(LanguageStore());
      Get.put<ContactStore>(ContactStore());
      SmartDialog.config
        ..toast = SmartConfigToast(
          // isExist: true,
          debounceTime: const Duration(milliseconds: 200),
        )
        ..custom = SmartConfigCustom()
        ..attach = SmartConfigAttach()
        ..notify = SmartConfigNotify()
        ..loading = SmartConfigLoading(
        );
    });
  }
}
