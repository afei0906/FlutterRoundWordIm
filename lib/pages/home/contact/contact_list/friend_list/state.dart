part of '../../../index.dart';

class FriendListState {
  TextEditingController searchController = TextEditingController();

  RxList<UserInfo> dataList = RxList();

  late ItemScrollController scroll = ItemScrollController();

  var d = UserInfo(id: -1, chatIndex: "");
}
