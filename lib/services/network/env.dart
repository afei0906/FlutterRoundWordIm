part of '../index.dart';

enum ApiEnv {
  dev,
  release,
}

ApiEnv _kApiEnv = ApiEnv.release;

ApiEnv get kAPiEnv => _kApiEnv;

class Env {
  static bool get isDistribute => kReleaseMode && _kApiEnv == ApiEnv.release;

  static bool isProxy = false;
  static String httpProxyHost = '192.168.0.107';
  static String httpProxyPort = '9090';

  static bool get isInDebugMode {
    bool inDebugMode = false;
    assert(inDebugMode = true); //如果debug模式下会触发赋值
    return inDebugMode;
    // if (ConfigStore.to.getDebugUrl() == null) {
    //   return inDebugMode;
    // } else {
    //   return ConfigStore.to.getDebugUrl()!;
    // }
  }

  static String get host {
    if (isInDebugMode) {
      return 'http://gimapi.opghdm.cn/';
    } else {
      return 'http://gimapi.opghdm.cn/';
    }
  }
}
