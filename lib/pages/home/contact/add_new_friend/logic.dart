part of '../../index.dart';

class AddNewFriendLogic extends GetxController with AddFriendLogic {
  final AddNewFriendState state = AddNewFriendState();

  @override
  void onInit() {
    super.onInit();
    getApplyList();
  }
}
