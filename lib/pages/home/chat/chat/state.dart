part of '../../index.dart';

enum ChatFormType { createGroup, messageList, userInfo, groupInfo }

class ChatState {
  ChatFormType chatFormType = ChatFormType.messageList;
  ChatRequest? chatRequest;
  GroupInfo? groupInfo;
  RxBool emojiShowing = false.obs;
  RxList<Message> messages = RxList();
  final isLoading = false.obs;
  final hasMore = true.obs;
  int pageSize = 15;
  int mid = 0;
  // int endMid = -1;
  int startMid = -1;
}
