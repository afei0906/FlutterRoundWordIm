part of 'index.dart';

class MessageStore extends GetxController {
  static MessageStore get to => Get.find<MessageStore>();

  ChatListState chatListState = ChatListState();

  RxList<ConversationList> covariantList = RxList();

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
      chatListState.addCovariantList(covariantList);
    });
  }

  Future<void> getConversationLocalData() async {
    final String jsonStr = StorageService.to.getString(
        "${kLocalConversationList}_${UserStore.to.userInfo.value.id}");
    if (!Utils.isEmpty(jsonStr)) {
      final List? list = json.decode(jsonStr) as List?;
      covariantList.value = list
              ?.map((e) => ConversationList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];
      chatListState.addCovariantList(covariantList);
    }
    covariantList.refresh();
  }

  Future<void> saveConversationData(dynamic data) async {
    StorageService.to.setString(
        "${kLocalConversationList}_${UserStore.to.userInfo.value.id}",
        jsonEncode(data));
  }

  void clearData() {
    chatListState = ChatListState();
    covariantList.clear();
  }
}
