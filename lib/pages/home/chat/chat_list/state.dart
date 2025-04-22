part of '../../index.dart';

class ChatListState {
  RxList<ConversationList> covariantList = RxList();
  RxList<ConversationList> unreadConversations = RxList();
  RxList<ConversationList> sortedGroupChats = RxList();

  void addCovariantList(RxList<ConversationList> covariantList) {
    this.covariantList.clear();
    this.covariantList.addAll(sortByTopFlag(covariantList));
    unreadConversations.value = getUnreadConversations(this.covariantList);
    sortedGroupChats.value = getGroupChats(this.covariantList);
  }

  RxList<ConversationList> getCurrentList(int i) {
    if (i == 0) {
      return covariantList;
    }
    if (i == 1) {
      return unreadConversations;
    }
    if (i == 2) {
      return sortedGroupChats;
    }
    return covariantList;
  }

  List<ConversationList> sortByTopFlag(List<ConversationList> conversations) {
    // 创建一个新的列表来存储排序后的结果
    List<ConversationList> sortedList = List.from(conversations);
    // 使用sort方法进行排序
    sortedList.sort((a, b) {
      // 首先按照置顶标志排序
      if ((a.topFlag ?? 0) != (b.topFlag ?? 0)) {
        // 将topFlag为1的排在前面
        return int.parse(Utils.toEmpty(b.topFlag) ?? "0") -
            int.parse(Utils.toEmpty(a.topFlag) ?? "0");
      }
      // 如果置顶状态相同，则按照更新时间排序（新的在前）
      final aTime =
          DateTime.tryParse(a.updateTime.toString() ?? '') ?? DateTime.now();
      final bTime =
          DateTime.tryParse(b.updateTime.toString() ?? '') ?? DateTime.now();
      return bTime.compareTo(aTime);
    });
    return sortedList;
  }

  List<ConversationList> getUnreadConversations(
      RxList<ConversationList> conversations) {
    return conversations
        .where((conversation) =>
            int.parse(Utils.toEmpty(conversation.notReadCount) ?? "0") > 0)
        .toList();
  }

  // 静态方法用于获取群聊列表
  List<ConversationList> getGroupChats(RxList<ConversationList> conversations) {
    return conversations
        .where((conversation) => conversation.chatMode == 2)
        .toList();
  }
}
