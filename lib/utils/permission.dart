part of 'index.dart';

//权限申请工具
class PermissionUtil {
  PermissionUtil();

  static List<Permission> location = [Permission.location];
  static List<Permission> camera = [
    Permission.camera,
  ];
  static List<Permission> storage = [Permission.storage, Permission.photos];
  static List<Permission> cameraIos = [Permission.camera, Permission.photos];

  // final BuildContext _context;
  dynamic _callback;

  PermissionUtil setCallBack(Function(bool) callback) {
    _callback = callback;
    return this;
  }

  Future<void> checkPermission(List<Permission> permission,
      {String? name}) async {
    if (name != null && name == 'storage') {
      if (Platform.isAndroid) {
        final androidInfo = await DeviceInfoPlugin().androidInfo;
        if (androidInfo.version.sdkInt <= 32) {
          storage = [Permission.storage];
        } else {
          storage = [Permission.photos];
        }
      }
    }
    final List<Permission> onRefusedList = []; //用户拒绝的权限
    final List<Permission> onForbidList = []; //用户禁止的权限
    final Map<Permission, PermissionStatus> statuses =
        await permission.request();

    for (int i = 0; i < statuses.keys.toList().length; i++) {
      final Permission key = statuses.keys.toList()[i];
      final value = statuses[statuses.keys.toList()[i]];
      if (value!.isDenied) {
        onRefusedList.add(key);
      } else if (value.isPermanentlyDenied) {
        onForbidList.add(key);
      }
    }

    if (onForbidList.isNotEmpty && onForbidList.isNotEmpty) {
      _showPermissionDialog(onForbidList);
    } else if (onRefusedList.isNotEmpty && onRefusedList.isNotEmpty) {
      if (_callback != null) _callback(false);
    } else {
      if (_callback != null) _callback(true);
    }
  }

  //弹窗提示
  void _showPermissionDialog(List<Permission> permission) {
    String pernissionTip = LocaleKeys.text_0009.tr;
    if (permission.contains(Permission.camera) ||
        permission.contains(Permission.camera)) {
      pernissionTip = LocaleKeys.text_0009.tr;
    }
    CustomDialog.showDelete(
      title: LocaleKeys.text_0010.tr,
      msg: pernissionTip,
      cancel: LocaleKeys.text_0011.tr,
      confirm: LocaleKeys.text_0012.tr,
      onCancel: () {
        Get.back();
      },
      onConfirm: () {
        //去设置中心
        openAppSettings();
      },
    );
  }
}
