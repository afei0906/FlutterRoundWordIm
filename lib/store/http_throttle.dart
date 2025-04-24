part of 'index.dart';

class HttpThrottle extends GetxController {
  static HttpThrottle get to => Get.find();
  HashMap<String, Throttle> httpMap = HashMap();

  @override
  void onInit() {
    super.onInit();
  }

  Throttle getThrottleByUrl(String url, {int milliseconds = 1000}) {
    httpMap[url] ??= Throttle(Duration(milliseconds: milliseconds));
    return httpMap[url]!;
  }
}
