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
    switch (index) {
      case 0:
        MessageStore.to.getConversationServerData();
      case 1:
        ContactListLogic.to.onInit();
    }
  }

  List<Widget> tabWidget = [
    ChatListPage(),
    ContactListPage(),
    ShopHomePage(),
    FindListPage(),
    MeCenterPage(),
  ];
  List<Map<String, String>> tabItemList = [
    {
      "id": "0",
      "title": LocaleKeys.text_0005,
      "default": Resource.assetsSvgDefaultChatSvg,
      "select": Resource.assetsSvgDefaultChatSelectSvg,
    },
    {
      "id": "1",
      "title": LocaleKeys.text_0006,
      "default": Resource.assetsSvgDefaultContantSvg,
      "select": Resource.assetsSvgDefaultContantSelectSvg,
    },
    {
      "id": "2",
      "title": LocaleKeys.text_0126,
      "default": Resource.assetsSvgDefaultShoppingSvg,
      "select": Resource.assetsSvgDefaultShoppingSelectSvg,
    },
    {
      "id": "3",
      "title": LocaleKeys.text_0007,
      "default": Resource.assetsSvgDefaultFindSvg,
      "select": Resource.assetsSvgDefaultFindSelectSvg,
    },
    {
      "id": "4",
      "title": LocaleKeys.text_0008,
      "default": Resource.assetsSvgDefaultMeSvg,
      "select": Resource.assetsSvgDefaultMeSelectSvg,
    }
  ];

  @override
  void onClose() {
    super.onClose();
  }
}
