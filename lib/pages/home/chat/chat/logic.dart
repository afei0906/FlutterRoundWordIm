part of '../../index.dart';

class ChatLogic extends GetxController {
  final ChatState state = ChatState();

  @override
  void onInit() {
    if (Get.arguments != null) {
      state.chatRequest = Get.arguments["chatRequest"] as ChatRequest?;
      state.chatFormType = Get.arguments['formType'] as ChatFormType;
    }

    super.onInit();
  }

  GroupInfo? getGroupInfo() {
    if (state.chatFormType == ChatFormType.createGroup) {
      GroupInfo? groupInfo = ContactStore.to.groupList.firstWhereOrNull((test) {
        return test.id == state.chatRequest?.channelId;
      });
      // log(">>>>${groupInfo?.toJson()}");
      return groupInfo;
    }
    return null;
  }

  ///添加成员 todo
  void addGroupMember(GroupInfo groupInfo) {}

  /// '群聊详情', todo
  void showGroupInfo(GroupInfo groupInfo) {}

  Future<void> loadMoreMessages() async {
    // if (isLoading) return;
    // isLoading = true;
    // final olderMessages = await db.getMessages(
    //   offset: currentPage * pageSize,
    //   limit: pageSize,
    // );
    // messages.addAll(olderMessages); // 从头部添加
    // currentPage++;
    // isLoading = false;
  }

  Future<void> refreshNewMessages() async {
    // 可选，加载更新的消息
  }

  void toDetail() {}
}
