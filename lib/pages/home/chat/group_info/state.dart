part of '../../index.dart';
class GroupInfoState {
  Rx<GroupInfo> groupInfo =
      ((Get.arguments['groupInfo'] as GroupInfo?) ?? GroupInfo()).obs;

  GroupInfoState() {
    ///Initialize variables
  }
}
