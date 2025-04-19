part of '../index.dart';

class PassWordProtectState {
  // TextEditingController ans1Controller = TextEditingController();
  // TextEditingController ans2Controller = TextEditingController();
  // TextEditingController ans3Controller = TextEditingController();

  Map<int, TextEditingController> controllerMap = {};
  Map<int, DictItem> dictItemMap = {};
  int formType = 0;
  dynamic captchaVerification;
  dynamic loginName;
  dynamic phoneArea;
  RxBool isSubmit = false.obs;
  RxInt count = ConfigStore.to.getUserIssuesCount().obs;

  RxList<DictItem> dictItemList = RxList();
}
