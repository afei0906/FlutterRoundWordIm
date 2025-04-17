part of '../../index.dart';

class ContactListState {
  TextEditingController searchController = TextEditingController();


  RxList<UserInfo> dataList=RxList();

  late ItemScrollController scroll = ItemScrollController();
}
