part of '../../index.dart';

class ChatLogic extends GetxController {
  final ChatState state = ChatState();

  @override
  Future<void> onInit() async {
    if (Get.arguments != null) {
      state.chatRequest = Get.arguments["chatRequest"] as ChatRequest?;
      state.chatFormType = Get.arguments['formType'] as ChatFormType;
      state.mid = int.parse(Utils.toEmpty(state.chatRequest?.mid) ?? '0') + 1;
      state.startMid =
          int.parse(Utils.toEmpty(state.chatRequest?.mid) ?? '0') + 1;

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

extension ChatLogicHttp on ChatLogic {
  Future<GroupDetail?> getGroupDetail(String groupId) async {
    return GroupApi.groupDetail(groupId);
  }

  Future<String?> messageSend(MessageRequest messageRequest) async {
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

  void updateDate(Message message) {
    log(">>>>0${message.isSender}");
    if (message.channelType.toString() ==
            state.chatRequest?.channelType.toString() &&
        message.channelId.toString() ==
            state.chatRequest?.channelId.toString()) {
      log(">>>>1${message.isSender}");
      if (message.isSender) {
        Message? m = state.messages.firstWhereOrNull((test) {
          return test.fid == message.fid;
        });
        if (m == null) {
          state.messages.insert(0, message);
        } else {
          state.messages.remove(m);
          state.messages.add(message);
        }
        state.messages.sort((a, b) => int.parse(Utils.toEmpty(b.mid) ?? "0")
            .compareTo(int.parse(Utils.toEmpty(a.mid) ?? "0")));
        state.messages.refresh();
      } else {
        log(">>>>2${message.isSender}");
        Message? m = state.messages.firstWhereOrNull((test) {
          return test.mid == message.mid;
        });
        if (m == null) {
          state.messages.insert(0, message);
        } else {
          state.messages.remove(m);
          state.messages.add(message);
        }
        state.messages.sort((a, b) => int.parse(Utils.toEmpty(b.mid) ?? "0")
            .compareTo(int.parse(Utils.toEmpty(a.mid) ?? "0")));
        state.messages.refresh();
      }
    }
  }
}

extension ChatLogicX on ChatLogic {
  ///发送消息相关
  Future<void> onSendMessage(String text, MessageType m,
      {List<String>? atUsers}) async {
    final MessageRequest messageRequest = MessageRequest(
        channelType: state.chatRequest?.channelType,
        channelId: state.chatRequest?.channelId,
        fid: (await DatabaseService.to.dbStore.getMaxFid()) + 1,
        contentType: m.value,
        payload: text);

    Message message = Message.fromJson(messageRequest.toMsgJson());
    message.time = DateTime.now().microsecondsSinceEpoch ~/ 1000;

    message.uid = UserStore.to.userInfo.value.id;
    DatabaseService.to.insertLocalMsg(message);

    state.messages.insert(0, message);

    state.messages.refresh();
    final String? time = await messageSend(messageRequest);
    if (Utils.isEmpty(time)) {
      message.status = 2;
      state.messages.refresh();
    } else {
      message.time =
          Date.fromStr(time, 'yyyy-MM-dd HH:mm')?.microsecondsSinceEpoch ??
              0 ~/ 1000;
      MessageStore.to.getConversationServerData();
    }
  }

  Future<void> getMsgList() async {
    List<Message> local = await getLocalMsgList();
    state.messages.addAll(local);

    // 检查是否还需要查服务器
    if (MessageStore.to.isNeedToFetchRemote(state.chatRequest?.channelType,
        state.chatRequest?.channelId, state.startMid, state.startMid - 15)) {
      List<Message> server = await getServerMsgList();

      List<Message> m = mergeMessages(state.messages, server);
      state.messages.value = m;
      // state.messages.replaceRange(
      //     state.messages.length - local.length, state.messages.length, m);
      if (state.messages.isNotEmpty) {
        state.startMid =
            int.parse(Utils.toEmpty(state.messages.last.mid) ?? '0');
        MessageStore.to.saveMidByChannel(state.chatRequest?.channelType,
            state.chatRequest?.channelId, state.mid, state.startMid);
      }
      // 5. 更新分页状态
      state.hasMore.value = server.length >= state.pageSize;
      state.messages.refresh();
    } else {
      state.hasMore.value = local.length >= state.pageSize;
      state.messages.refresh();
    }
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
