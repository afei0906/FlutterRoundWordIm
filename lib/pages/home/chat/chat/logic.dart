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

    getMsgList(state.chatRequest).then((onValue) {
      state.messages.value = onValue;
    });

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

  void toDetail() {
    if (state.chatRequest?.channelType.toString() == "1") {
      Get.toNamed(Routes.friendInfo, arguments: {
        "userInfo": UserInfo(
          id: state.chatRequest?.channelId,
          nick: state.chatRequest?.title,
          avatar: state.chatRequest?.avatar,
        )
      });
    } else if (state.chatRequest?.channelType.toString() == "2") {
      ///群聊
      Get.toNamed(Routes.groupInfo,
          arguments: {"channelId": state.chatRequest?.channelId});
    }
  }
}

extension ChatLogicx on ChatLogic {
  ///发送消息相关
  Future<void> onSendMessage(String text, MessageType m,
      {List<String>? atUsers}) async {
    final MessageRequest messageRequest = MessageRequest(
        channelType: state.chatRequest?.channelType,
        channelId: state.chatRequest?.channelId,
        fid: (await DatabaseService.to.dbStore.getMaxFid()) + 1,
        contentType: m.value,
        payload: text);

    await MessageApi.messageSend(messageRequest);
  }
}

extension ChatLogicHttp on ChatLogic {
  Future<GroupDetail?> getGroupDetail(String groupId) async {
    return GroupApi.groupDetail(groupId);
  }

  Future<bool?> messageSend(MessageRequest messageRequest) async {
    return MessageApi.messageSend(messageRequest);
  }

  Future<List<Message>> getMsgList(ChatRequest? chatRequest) async {
    state.messages.value = await DatabaseService.to.dbStore.getMessages(
        int.parse(Utils.toEmpty(chatRequest?.channelType) ?? '0'),
        int.parse(Utils.toEmpty(chatRequest?.channelId) ?? '0'));
    List<Message> list = await MessageApi.getMsgList(chatRequest);
    DatabaseService.to.updateMsgList(list);

    return list;
  }
}
