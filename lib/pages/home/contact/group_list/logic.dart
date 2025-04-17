part of '../../index.dart';

class GroupListLogic extends GetxController {
  final GroupListState state = GroupListState();

  @override
  void onInit() {
    super.onInit();
    featData();
  }

  Future<void> featData() async {
    state.dataList.clear();
    ContactStore.to.featGroupData(() {
      state.dataList.addAll(ContactStore.to.groupList);
      state.dataList.refresh();
    });
  }

  void toGroupDetail(GroupInfo? groupInfo) {}
}

extension GroupListLogicX on GroupListLogic {
  void onChanged() {
    update();
  }

  Future<void> onSubmitted() async {
    if (Utils.isEmpty(state.searchController.text)) {
      state.dataList.clear();
      state.dataList.addAll(ContactStore.to.groupList);
      state.dataList.refresh();
      return;
    }
    state.dataList.clear();
    state.dataList.addAll(
        await GroupApi.myGroupList(keyword: state.searchController.text));
    state.dataList.refresh();
  }
}
