import 'package:flutter/services.dart';
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

    });
  }
}
