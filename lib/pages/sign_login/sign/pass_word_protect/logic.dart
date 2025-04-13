part of '../index.dart';

class PassWordProtectLogic extends GetxController {
  final PassWordProtectState state = PassWordProtectState();

  @override
  void onInit() {
    if (Get.arguments != null) {
      state.formType = Get.arguments["formType"] as int? ?? state.formType;
      state.captchaVerification = Get.arguments["captchaVerification"];
      state.loginName = Get.arguments["loginName"];
    }
    featData();
    for (int i = 0; i < state.count.value; i++) {
      state.controllerMap[i] ??= TextEditingController();
    }
    super.onInit();
  }

  void onChanged() {
    bool isSubmit = true;
    final List<TextEditingController> list =
        state.controllerMap.values.toList();
    for (int i = 0; i < list.length; i++) {
      if (list[i].text.isEmpty) {
        isSubmit = false;
        break;
      }
    }
    state.isSubmit.value = isSubmit;
  }

  void selectQuest(int index) {
    List<DictItem> list = [];
    list.addAll(state.dictItemList);
    final List<DictItem> tempList = state.dictItemMap.values.toList();
    for (int i = 0; i < tempList.length; i++) {
      list.remove(tempList[i]);
    }
    if (state.dictItemMap[index] != null) {
      list.add(state.dictItemMap[index]!);
    }
    FocusScope.of(Get.context!).unfocus();
    SmartDialog.show(
        tag: "selectQuestion",
        builder: (_) {
          return SelectQuestion(list, state.dictItemMap[index],
              (DictItem dictItem) {
            SmartDialog.dismiss(
              tag: "selectQuestion",
            );
            state.dictItemMap[index] = dictItem;
            update();
          });
        },
        alignment: Alignment.bottomCenter);
  }

  Future<void> submit() async {
    if (state.isSubmit.isTrue) {
      PasswordProtectRequest passwordProtectRequest = PasswordProtectRequest(
        // captchaVerification: state.captchaVerification,
        // loginName: state.loginName,
        checkIssueList: [],
      );
      final List<DictItem> tempList = state.dictItemMap.values.toList();
      for (int i = 0; i < tempList.length; i++) {
        passwordProtectRequest.checkIssueList?.add(CheckIssueList(
          qcode:tempList[i].dictValue,
          qanswer:state.controllerMap[i]?.text,
          qnumber:tempList[i].id,
          qname:tempList[i].dictLabel,
        ));
      }
     bool isOk= await LoginSignApi.saveUserIssues(passwordProtectRequest);
      // (route) => route.settings.name == Routes.splash,
      if(isOk) {
        Get.toNamed(Routes.signSuss,
            arguments: {"formType": state.formType, "type": 1});
      }
    }
  }

  Future<void> featData() async {
    state.dictItemList.value =
        await CommonAPI.appDictItem(code: "user_issues_type");
    if (state.count.value > state.dictItemList.length) {
      state.count.value = state.dictItemList.length;
    }
  }
}
