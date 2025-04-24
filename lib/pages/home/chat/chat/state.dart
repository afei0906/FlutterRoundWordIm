part of '../../index.dart';

enum ChatFormType { createGroup, messageList, userInfo, groupInfo }

class ChatState {
  ChatFormType chatFormType = ChatFormType.messageList;
  ChatRequest? chatRequest;

  String title="";
}
