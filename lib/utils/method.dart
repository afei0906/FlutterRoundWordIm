part of 'index.dart';

class Method {
  static const MethodChannel _channel = MethodChannel('flutter_launcher');

  static Future<void> inAppLaunch() async {}

  static Future<void> gotoAppStore() async {
    if (Platform.isIOS) {
      log("iOS gotoAppStore");
      await _channel.invokeMethod('appStore', {});
    }
    if (Platform.isAndroid) {
      log("Android gotoAppStore");
      await _channel.invokeMethod('inAppLaunch', {});
    }
  }

  static Future<List<String>?> scanner({
    int noOfPages = 1,
    bool isGalleryImportAllowed = false,
  }) async {
    final Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
    ].request();
    if (statuses.containsValue(PermissionStatus.denied) ||
        statuses.containsValue(PermissionStatus.permanentlyDenied)) {
      throw Exception("Permission not granted");
    }
    final List<dynamic>? pictures = await _channel.invokeMethod('scanner', {
      'noOfPages': noOfPages,
    });
    return pictures?.map((e) => e as String).toList();
  }

  static Future<String?> openImage() async {
    final String pictures = await _channel.invokeMethod('openImage') as String;
    if (pictures == 'No_Result') {
      return null;
    }
    return pictures;
  }

  static Future<XFile?> pickImage() async {
    Get.back();
    final String pictures = await _channel.invokeMethod('openImage') as String;
    if (pictures == 'No_Result') {
      return null;
    }
    return XFile(pictures);
  }
}
