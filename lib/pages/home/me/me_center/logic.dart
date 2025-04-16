part of '../../index.dart';

class MeCenterLogic extends GetxController {
  final MeCenterState state = MeCenterState();

  @override
  void onInit() {
    super.onInit();
    featData();
  }

  Future<void> featData() async {
    await UserApi.getSignInRule();
  }
}
