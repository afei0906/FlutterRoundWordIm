part of '../../index.dart';

class ChatLogic extends GetxController {
  final ChatState state = ChatState();

  @override
  void onInit() {
    if (Get.arguments != null) {
      state.chatRequest = Get.arguments["chatRequest"] as ChatRequest?;
      state.chatFormType = Get.arguments['formType'] as ChatFormType;

      ///群聊
      if (state.chatRequest?.channelType.toString() == "2") {
        getGroupInfo();
      }
    }

    getMsgList(state.chatRequest);

    super.onInit();
  }

  void clickRoot() {
    FocusScope.of(Get.context!).unfocus();
    state.emojiShowing.value = false;
    update();
  }

  Future<void> getGroupInfo() async {
    state.groupInfo = ContactStore.to.groupList.firstWhereOrNull((test) {
      return test.id == state.chatRequest?.channelId;
    });
    update();
    state.groupInfo ??= GroupInfo(
        name: state.chatRequest?.title, avatar: state.chatRequest?.avatar);
    final GroupDetail? groupDetail =
        await getGroupDetail(state.chatRequest?.channelId.toString() ?? '');
    state.groupInfo?.setGroupDetail(groupDetail);
    // ContactStore.to.groupList.value = ContactStore.to
    //     .replaceGroupInfoById(ContactStore.to.groupList, state.groupInfo!);
    update();
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

extension ChatLogicx on ChatLogic {
  //发送相关
  void setMessage() async {
    // if (Utils.isEmpty(state.chatController.text)) {
    //   return;
    // }
    // MessageRequest messageRequest = MessageRequest(
    //     channelType: state.chatRequest?.channelType,
    //     channelId: state.chatRequest?.channelId,
    //     fid: 0,
    //     contentType: 1,
    //     payload: state.chatController.text);
    // await MessageApi.messageSend(messageRequest);
  }
}

extension ChatLogicHttp on ChatLogic {
  Future<GroupDetail?> getGroupDetail(String groupId) async {
    return GroupApi.groupDetail(groupId);
  }

  Future<List<ConversationList>> messageSend(
      MessageRequest messageRequest) async {
    return MessageApi.messageSend(messageRequest);
  }

  Future<List<Message>> getMsgList(ChatRequest? chatRequest) async {
    return MessageApi.getMsgList(chatRequest);
  }
}
