part of '../../index.dart';

class FindListLogic extends GetxController {
  final FindListState state = FindListState();

  @override
  void onInit() {
    super.onInit();
    featData();
  }

  Future<void> featData() async {
    state.dataList.value = await FindApi.discoveryPage();
  }

  void toMore() {}
}
