part of '../../index.dart';

class ContactListState {
  TextEditingController searchController = TextEditingController();

  RxList<UserInfo> userList = [
    UserInfo(loginName: "afei"),
    UserInfo(loginName: "fff"),
    UserInfo(loginName: "32323")
  ].obs;

  late ItemScrollController scroll = ItemScrollController();
}
