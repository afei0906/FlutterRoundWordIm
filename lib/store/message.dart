part of 'index.dart';

class MessageStore extends GetxController {
  static MessageStore get to => Get.find<MessageStore>();

  ChatListState chatListState = ChatListState();

  // RxList<ConversationList> covariantList = RxList();

  final throttle = Throttle(const Duration(milliseconds: 1000));

  @override
  Future<void> onInit() async {
    super.onInit();
    await initData();
  }

  Future<void> initData() async {
    if (UserStore.to.isLoadUser.isFalse) {
      return;
    }
    getConversationLocalData();
    getConversationServerData();
  }

  Future<void> getConversationServerData() async {
    throttle.run(() async {
      await MessageApi.conversationList();
      // chatListState.addCovariantList(covariantList);
    });
  }

  Future<void> getConversationLocalData() async {
    final String jsonStr = StorageService.to.getString(
        "${kLocalConversationList}_${UserStore.to.userInfo.value.id}");
    if (!Utils.isEmpty(jsonStr)) {
      final List? list = json.decode(jsonStr) as List?;
      final List<ConversationList> covariantList = (list
                  ?.map((e) =>
                      ConversationList.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [])
          .obs;
      chatListState.addCovariantList(covariantList);
    }
  }

  Future<void> saveConversationData(dynamic data) async {
    StorageService.to.setString(
        "${kLocalConversationList}_${UserStore.to.userInfo.value.id}",
        jsonEncode(data));
  }

  Future<void> updateConversationData(ConversationList conversationList,
      {dynamic topFlagCollapse, dynamic msgFreeFlagCollapse}) async {
    chatListState.updateConversationData(conversationList,
        topFlagCollapse: topFlagCollapse,
        msgFreeFlagCollapse: msgFreeFlagCollapse);
  }

  Future<void> deleteConversationData(ConversationList conversationList) async {
    chatListState.deleteCovariantList(conversationList);
  }

  void clearData() {
    chatListState = ChatListState();
  }
}
