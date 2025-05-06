part of '../../index.dart';

class FriendInfoState {
  Rx<UserInfo> userInfo =
      ((Get.arguments['userInfo'] as UserInfo?) ?? UserInfo()).obs;

  FriendInfoState() {
    ///Initialize variables
  }
}
