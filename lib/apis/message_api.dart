part of 'index.dart';

abstract class MessageApi {
  static Future<List<ConversationList>> conversationList() async {
    final res = await HttpService.to.post(
      Urls.conversationList,
    );

    if (res.code != 0) {
      // showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      final List? list = res.data as List?;
      MessageStore.to.saveConversationData(res.data);
      final List<ConversationList> clientList = list
              ?.map((e) => ConversationList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];
      MessageStore.to.chatListState.addCovariantList(clientList);
      return clientList;
    }
    return [];
  }

  ///channelTypeCollapse allintegerint32
  // 1：私聊；2：群聊
  //
  // channelIdCollapse allintegerint64
  // 聊天会话id
  //
  // topFlagCollapse allintegerint32
  // 是否置顶：1：是；0：否
  //
  // msgFreeFlagCollapse allintegerint32
  // 是否免打扰：1：是；0：否
  static Future<bool> conversationUpdate(ConversationList conversationList,
      {dynamic topFlagCollapse, dynamic msgFreeFlagCollapse}) async {
    var params = {
      "channelType": conversationList.chatMode,
      "channelId": conversationList.bizId
    };
    // if (!Utils.isEmpty(topFlagCollapse)) {
    params['topFlag'] =
        Utils.toEmpty(topFlagCollapse) ?? conversationList.topFlag;
    // }
    // if (!Utils.isEmpty(msgFreeFlagCollapse)) {
    params['msgFreeFlag'] =
        Utils.toEmpty(msgFreeFlagCollapse) ?? conversationList.msgFreeFlag;
    // }
    final res = await HttpService.to
        .post(Urls.conversationUpdate, params: params, showLoading: true);

    if (res.code != 0) {
      // showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      if (!Utils.isEmpty(topFlagCollapse)) {
        conversationList.topFlag = topFlagCollapse;
      }
      if (!Utils.isEmpty(msgFreeFlagCollapse)) {
        conversationList.msgFreeFlag = msgFreeFlagCollapse;
      }
      MessageStore.to.updateConversationData(conversationList,
          topFlagCollapse: topFlagCollapse,
          msgFreeFlagCollapse: msgFreeFlagCollapse);
      return true;
    }
    return false;
  }

  static Future<bool> conversationDelete(
      ConversationList conversationList) async {
    final res = await HttpService.to.post(Urls.conversationDelete,
        params: {
          "channelType": conversationList.chatMode,
          "channelId": conversationList.bizId
        },
        showLoading: true);

    if (res.code != 0) {
      // showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      MessageStore.to.deleteConversationData(conversationList);
      return true;
    }
    return false;
  }

  ///
  /// channelType "1：私聊；2：群聊"
  ///" channelId 聊天会话id"
  /// mid 消息id  * 传 mid+compareType 就不用传midRange
  /// compareType "\"大于 gt\", \" 小于lt\", \"eq\", \"gteq\", \"lteq\""
  /// pageSize; 个数
  /// sortType 正序asc / 倒序desc
  static Future<List<Message>> getMsgList(ChatRequest? chatRequest) async {
    var param = chatRequest?.toRequestJson();
    final res = await HttpService.to.post(Urls.getMsgList, params: param);

    if (res.code != 0) {
      showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      final List? list = res.data as List?;
      final List<Message> clientList = list
              ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];
      return clientList;
    }
    return [];
  }

  static Future<bool> messageSend(MessageRequest? messageRequest) async {
    var param = messageRequest?.toJson();
    Message m = Message.fromJson(messageRequest?.toMsgJson());
    DatabaseService.to.insertLocalMsg(m);
    final res = await HttpService.to.post(Urls.messageSend, params: param);
    if (res.code != 0) {
      showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      // final Message message = Message.fromJson(res.data);
      // m.mid = message.mid;
      // DatabaseService.to.updateLocalMsg(m);
      MessageStore.to.chatListState.updateConversations(m);
      return true;
    }
    return false;
  }
}
