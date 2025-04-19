part of '../../../index.dart';

class FriendListState {
  TextEditingController searchController = TextEditingController();

  RxList<FriendInfo> dataList = RxList();

  late ItemScrollController scroll = ItemScrollController();

  var d = FriendInfo(friendId: -1, chatIndex: "");
}
