part of '../../index.dart';

class ChatLogic extends GetxController {
  final ChatState state = ChatState();

  @override
  Future<void> onInit() async {
    if (Get.arguments != null) {
      state.chatRequest = Get.arguments["chatRequest"] as ChatRequest?;
      state.chatFormType = Get.arguments['formType'] as ChatFormType;
      state.mid = int.parse(Utils.toEmpty(state.chatRequest?.mid) ?? '0') + 1;

      ///群聊
      if (state.chatRequest?.channelType.toString() == "2") {
        getGroupInfo();
      }
    }
    state.messages.clear();
    getMsgList();
    // log(">>>>${state.messages}");
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
    log(">>>>>!!!${state.hasMore.value}");
    if (state.isLoading.value || !state.hasMore.value) return;
    state.isLoading.value = true;

    state.mid = int.parse(Utils.toEmpty(state.messages.last.mid) ?? '0');
    getMsgList();
    state.isLoading.value = false;
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

  Future<List<Message>> getServerMsgList() async {
    state.chatRequest?.mid = state.mid == 0 ? null : state.mid;
    state.chatRequest?.pageSize = state.pageSize;
    final List<Message> list = await MessageApi.getMsgList(state.chatRequest);
    DatabaseService.to.updateMsgList(list);
    return list;
  }

  Future<List<Message>> getLocalMsgList() async {
    return DatabaseService.to.dbStore.getMessages(
        int.parse(Utils.toEmpty(state.chatRequest?.channelType) ?? '0'),
        int.parse(Utils.toEmpty(state.chatRequest?.channelId) ?? '0'),
        lastMid: state.mid == 0 ? null : state.mid,
        limit: state.pageSize);
  }
}

extension ChatLogicX on ChatLogic {
  Future<void> getMsgList() async {
    List<Message> local = await getLocalMsgList();
    log('>>>>${local.length}');
    state.messages.addAll(local);
    List<Message> server = await getServerMsgList();
    log('>>>>${server.length}');

    List<Message> m = mergeMessages(state.messages, server);
    state.messages.value = m;
    // state.messages.replaceRange(
    //     state.messages.length - local.length, state.messages.length, m);
    if (state.messages.isNotEmpty) {
      state.endMid = int.parse(Utils.toEmpty(state.messages.last.mid) ?? '0');
    }
    // 5. 更新分页状态
    state.hasMore.value = server.length >= state.pageSize;
    state.messages.refresh();
  }

  List<Message> mergeMessages(
    List<Message> local,
    List<Message> server,
  ) {
    final allMessages = [...local, ...server];

    // 去重逻辑（根据消息ID）
    final uniqueMessages = allMessages
        .fold<Map<String, Message>>(
          {},
          (map, message) =>
              map..putIfAbsent(message.mid.toString(), () => message),
        )
        .values
        .toList();
    // 按时间排序
    uniqueMessages.sort((a, b) => int.parse(Utils.toEmpty(b.mid) ?? "0")
        .compareTo(int.parse(Utils.toEmpty(a.mid) ?? "0")));
    return uniqueMessages;
  }
}
