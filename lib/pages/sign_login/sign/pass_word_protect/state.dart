part of '../index.dart';

class PassWordProtectState {
  TextEditingController ans1Controller = TextEditingController();
  TextEditingController ans2Controller = TextEditingController();
  TextEditingController ans3Controller = TextEditingController();

  int formType = 0;
  RxBool isSubmit = false.obs;

  RxList<DictItem> dictItemList=RxList();
}
