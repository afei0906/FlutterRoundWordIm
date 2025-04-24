part of '../../index.dart';

class ChatListLogic extends GetxController
    with FriendListLogic, AddFriendLogic {
  static ChatListLogic get to {
    final bool isControllerRegistered =
        GetInstance().isRegistered<ChatListLogic>();
    if (isControllerRegistered) {
      return Get.find();
    } else {
      return Get.put(ChatListLogic());
    }
  }

  RxInt selectIndex = 0.obs;

  TextEditingController searchController = TextEditingController();

  final ChatListState chatListState = MessageStore.to.chatListState;

  Future<void> changeIndex(int index) async {
    selectIndex.value = index;
  }

  @override
  void onInit() {
    featConversationList();
    featFriendData();
    super.onInit();
  }

  void toAddNewChat() {
    if (!state.dataList.contains(state.d)) {
      state.dataList.insert(0, state.d);
    }
    SmartDialog.show(
        clickMaskDismiss: false,
        builder: (_) {
          return CreateNewChat(this);
        },
        alignment: Alignment.bottomCenter);
  }

  void toChat(ConversationList conversationList) {
    Get.toNamed(Routes.chatPage, arguments: {
      "formType": ChatFormType.messageList,
      "chatRequest": ChatRequest(
          channelType: conversationList.chatMode,
          channelId: conversationList.bizId,
          mid: conversationList.lastMsgId,
          title: Utils.toEmpty(conversationList.name) ?? '',
          avatar: Utils.toEmpty(conversationList.avatar) ?? ''
      )
    });
  }

  void toScan() {
    Get.toNamed(Routes.scanQrCodePage);
  }

  Future<void> toCreateGroup() async {
    CreateGroupLogic.to.selectList.clear();
    CreateGroupLogic.to.isNext = false.obs;
    SmartDialog.show(
        clickMaskDismiss: false,
        builder: (_) {
          return CreateGroupWidget();
        },
        alignment: Alignment.bottomCenter);
  }

  String toContentType(ConversationList conversationList) {
    /// 内容类型，1、普通文本消息，2、超链接卡片消息，3、文件，4、音频，5、视频，6、图片，9、名片
    if (conversationList.contentType == "1") {
      return Utils.toEmpty(conversationList.resume) ?? '';
    }
    if (conversationList.contentType == "2") {
      return "[${LocaleKeys.text_0190.tr}]";
    }
    if (conversationList.contentType == "3") {
      return "[${LocaleKeys.text_0191.tr}]";
    }
    if (conversationList.contentType == "4") {
      return "[${LocaleKeys.text_0193.tr}]";
    }
    if (conversationList.contentType == "5") {
      return "[${LocaleKeys.text_0193.tr}]";
    }
    if (conversationList.contentType == "6") {
      return "[${LocaleKeys.text_0152.tr}]";
    }
    if (conversationList.contentType == "9") {
      return "[${LocaleKeys.text_0194.tr}]";
    }
    return Utils.toEmpty(conversationList.resume) ?? '';
  }

  ///新建频道 todo
  void toNewChannel() {}
}

extension SearchChatLogicX on ChatListLogic {
  void onChanged() {
    update();
  }

  Future<void> featConversationList() async {
    await MessageStore.to.initData();
  }
}
