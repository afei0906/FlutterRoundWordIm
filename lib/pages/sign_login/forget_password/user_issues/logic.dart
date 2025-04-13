part of '../index.dart';

class UserIssuesLogic extends GetxController {
  final UserIssuesState state = UserIssuesState();

  @override
  void onInit() {
    state.emailLastController.text = emailList.first;
    if (Get.arguments != null) {
      state.formType = Get.arguments["formType"] as int;
    }
    super.onInit();
  }

  void onChanged() {
    update();
  }

  String getAccount() {
    if (state.formType == 2) {
      return "${state.emailFirstController.text}@${Utils.toEmpty(state.emailLastController.text) ?? emailList.first}";
    } else if (state.formType == 1) {
      return "${state.countryCodeModel.code}${state.phoneController.text}";
    }
    return "";
  }

  void onBack() {
    if (state.backIndex > 0) {
      state.backIndex--;
      update();
    } else {
      Get.back();
    }
  }
}

extension ShowAccountLogicX on UserIssuesLogic {
  void selectPhoneCountry() {
    Get.toNamed(Routes.selectPhoneCountry, arguments: state.countryCodeModel)
        ?.then((onValue) {
      if (onValue != null) {
        state.countryCodeModel = onValue as CountryCodeModel;
        update();
      }
    });
  }

  void selectCommonEmail() {
    FocusScope.of(Get.context!).unfocus();
    SmartDialog.show(
        tag: "commonEmail",
        builder: (_) {
          return CommonEmail((String? str) {
            SmartDialog.dismiss(tag: "commonEmail");
            if (!Utils.isEmpty(str)) {
              state.emailLastController.text = str!;
            }
          });
        },
        alignment: Alignment.bottomCenter);
  }

  Future<void> toPhoneNext() async {
    bool isNext = false;
    if (state.backIndex == 0) {
      isNext = state.phoneController.text.isNotEmpty;
    }
    if (!isNext) {
      return;
    }
    if (state.backIndex == 0) {
      await toNext(getAccount());
    }
  }

  void toEmailNext() async {
    bool isNext = false;
    if (state.backIndex == 0) {
      isNext = state.emailFirstController.text.isNotEmpty;
    }
    if (!isNext) {
      return;
    }
    if (state.backIndex == 0) {
      String loginName = getAccount();
      if (!Utils.checkEmail(getAccount())) {
        SmartDialog.showToast(LocaleKeys.text_0028.tr,
            alignment: Alignment.center);
        return;
      }
      await toNext(loginName);
    }
  }

  Future<void> toNext(String loginName) async {
    List<CheckIssueList>? name =
        await LoginSignApi.getUserIssues(loginName: loginName);
    if (name != null) {
      if (name.isEmpty) {
        SmartDialog.showToast(LocaleKeys.text_0120.tr,
            alignment: Alignment.center);
      } else {
        state.userIssuesList.value = name;
        state.backIndex++;
        update();
      }
    }
  }
}

extension ShowIssuesX on UserIssuesLogic {
  void onQuestChanged() {
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

  void submit() {
    if (state.isSubmit.isTrue) {
      VerifyCodeConfig.showCode(2, (v) async {
        PasswordProtectRequest passwordProtectRequest = PasswordProtectRequest(
          captchaVerification: v,
          loginName: getAccount(),
          checkIssueList: [],
        );
        final List<CheckIssueList> tempList = state.userIssuesList;
        for (int i = 0; i < tempList.length; i++) {
          passwordProtectRequest.checkIssueList?.add(CheckIssueList(
            qcode: tempList[i].qcode,
            qanswer: state.controllerMap[i]?.text,
            qnumber: tempList[i].qnumber,
            qname: tempList[i].qname,
          ));
        }
        String? newPas =
            await LoginSignApi.resetPasswordByUserIssue(passwordProtectRequest);
        if (newPas != null) {
          Get.toNamed(Routes.signSuss, arguments: {
            "formType": state.formType == 1 ? 0 : 1,
            "type": 2,
            "pass": newPas
          });
        }
      });
    }
  }
}
