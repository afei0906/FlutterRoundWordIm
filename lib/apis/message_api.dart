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
}
