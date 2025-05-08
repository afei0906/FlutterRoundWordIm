part of 'index.dart';

class MessageStore extends GetxController {
  static MessageStore get to => Get.find<MessageStore>();

  ChatListState chatListState = ChatListState();

  // RxList<ConversationList> covariantList = RxList();

  final throttle = Throttle(const Duration(milliseconds: 1000));

  Map<String, dynamic> msgServerMidMap = {}; //存储聊天记录从服务查询的服务器记录的MID开始位置和结束位置

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
    getMsgServerMidMap();
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

  Future<void> getMsgServerMidMap() async {
    final String jsonStr = StorageService.to
        .getString("${kLocalMsgServerMid}_${UserStore.to.userInfo.value.id}");
    if (!Utils.isEmpty(jsonStr)) {
      msgServerMidMap = json.decode(jsonStr) as Map<String, dynamic>;
    }
  }

  dynamic getMidByChannel(dynamic channelType,
      dynamic channelId,) {
    if (msgServerMidMap.isEmpty) {
      return {};
    }
    return msgServerMidMap['${channelId}_$channelType'];
  }

  int getMidByChannelStartMid(dynamic channelType,
      dynamic channelId,) {
    if (msgServerMidMap.isEmpty) {
      return 0;
    }
    return int.parse(Utils.toEmpty(
        msgServerMidMap['${channelId}_$channelType']['startMid']) ??
        '0');
  }

  int getMidByChannelEndMid(dynamic channelType,
      dynamic channelId,) {
    if (msgServerMidMap.isEmpty) {
      return 0;
    }
    return int.parse(
        Utils.toEmpty(msgServerMidMap['${channelId}_$channelType']['endMid']) ??
            '0');
  }

  bool isNeedToFetchRemote(dynamic channelType, dynamic channelId, int mid,
      int endMid) {
    if (msgServerMidMap.isEmpty) {
      return true;
    }
    if (Utils.isEmpty(
        msgServerMidMap['${channelId}_$channelType']['startMid'])) {
      return true;
    }
    if (Utils.isEmpty(msgServerMidMap['${channelId}_$channelType']['endMid'])) {
      return true;
    }
    // log(
    //     ">>>>>>${mid}>>>${endMid}>>>>${msgServerMidMap['${channelId}_$channelType']['startMid']}"
    //         ">>>${msgServerMidMap['${channelId}_$channelType']['endMid']}");
    if (mid <=
        int.parse(Utils.toEmpty(
            msgServerMidMap['${channelId}_$channelType']['startMid']) ??
            '0') &&
        endMid >=
            int.parse(Utils.toEmpty(
                msgServerMidMap['${channelId}_$channelType']['endMid']) ??
                '0')) {
      return false;
    }
    return true;
  }

  Future<void> saveMidByChannel(dynamic channelType,
      dynamic channelId,
      dynamic startMid,
      dynamic endMid,) async {
    if (msgServerMidMap.isEmpty) {
      msgServerMidMap = {};
    }
    msgServerMidMap['${channelId}_$channelType'] ??= {};
    msgServerMidMap['${channelId}_$channelType']['startMid'] = startMid;
    msgServerMidMap['${channelId}_$channelType']['endMid'] = endMid;
    StorageService.to.setString(
        "${kLocalMsgServerMid}_${UserStore.to.userInfo.value.id}",
        jsonEncode(msgServerMidMap));
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
