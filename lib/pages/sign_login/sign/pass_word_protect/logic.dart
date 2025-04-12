part of '../index.dart';

class PassWordProtectLogic extends GetxController {
  final PassWordProtectState state = PassWordProtectState();

  @override
  void onInit() {
    if (Get.arguments != null) {
      state.formType = Get.arguments["formType"] as int? ?? state.formType;
    }
    featData();
    super.onInit();
  }

  void onChanged() {
    state.isSubmit.value = state.ans1Controller.text.isNotEmpty &&
        state.ans2Controller.text.isNotEmpty &&
        state.ans3Controller.text.isNotEmpty;
  }

  void submit() {
    if (state.isSubmit.isTrue) {
      // (route) => route.settings.name == Routes.splash,
      Get.toNamed(
          Routes.signSuss,
          arguments: {"formType": state.formType, "type": 1});
    }
  }

  Future<void> featData() async {
    state.dictItemList.value =
    await CommonAPI.appDictItem(code: "user_issues_type");
  }
}
