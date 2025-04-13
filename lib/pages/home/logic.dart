part of 'index.dart';

class HomeLogic extends GetxController {
  static HomeLogic get to {
    final bool isControllerRegistered = GetInstance().isRegistered<HomeLogic>();
    if (isControllerRegistered) {
      return Get.find();
    } else {
      return Get.put(HomeLogic());
    }
  }

  Rx<int> tabCurIndex = 0.obs;
  bool isLife = true;

  void changeTabCurIndex(int index) {
    tabCurIndex.value = index;
  }

  List<Widget> tabWidget = [
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];
  List<Map<String, String>> tabItemList = [
    {
      "id": "0",
      "title": LocaleKeys.text_0005,
      "default": Resource.assetsSvgDefaultChatSvg,
    },
    {
      "id": "1",
      "title": LocaleKeys.text_0006,
      "default": Resource.assetsSvgDefaultContantSvg,
    },
    {
      "id": "2",
      "title": LocaleKeys.text_0126,
      "default": Resource.assetsSvgDefaultShoppingSvg,
    },
    {
      "id": "3",
      "title": LocaleKeys.text_0007,
      "default": Resource.assetsSvgDefaultFindSvg,
    },
    {
      "id": "4",
      "title": LocaleKeys.text_0008,
      "default": Resource.assetsSvgDefaultMeSvg,
    }
  ];

  @override
  void onClose() {
    super.onClose();
  }
}
