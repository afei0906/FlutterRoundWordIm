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
      MessageStore.to.covariantList.value = clientList;
      return clientList;
    }
    return [];
  }

  ///
  /// channelType "1：私聊；2：群聊"
  ///" channelId 聊天会话id"
  /// mid 消息id  * 传 mid+compareType 就不用传midRange
  /// compareType "\"大于 gt\", \" 小于lt\", \"eq\", \"gteq\", \"lteq\""
  /// pageSize; 个数
  /// sortType 正序asc / 倒序desc
  static Future<List<ConversationList>> getMsgList(
      ChatRequest? chatRequest) async {
    var param = chatRequest?.toRequestJson();
    final res = await HttpService.to.post(Urls.getMsgList, params: param);

    if (res.code != 0) {
      showErrorMsg(res.code.toString(), res.msg ?? '');
    } else {
      final List? list = res.data as List?;
      MessageStore.to.saveConversationData(res.data);
      final List<ConversationList> clientList = list
              ?.map((e) => ConversationList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];
      MessageStore.to.covariantList.value = clientList;
      return clientList;
    }
    return [];
  }
}
