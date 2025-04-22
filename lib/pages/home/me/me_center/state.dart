part of '../../index.dart';

class MeCenterState {
  List<ItemBean> itemList = [
    ItemBean(0, LocaleKeys.text_0167, Resource.assetsImagesMeMyWalletPng, () {},
        isBotRoudis: true, isTopRoudis: true),
    ItemBean(
      1,
      LocaleKeys.text_0168,
      Resource.assetsImagesMeMyCollectionPng,
      () {},
      isTopRoudis: true,
    ),
    ItemBean(
      2,
      LocaleKeys.text_0169,
      Resource.assetsImagesMeMyTeamPng,
      () {},
    ),
    ItemBean(
      3,
      LocaleKeys.text_0170,
      Resource.assetsImagesMeMyProfilePng,
      () {},
    ),
    ItemBean(
      4,
      LocaleKeys.text_0171,
      Resource.assetsImagesMeNameauthenticationPng,
      () {},
    ),
    ItemBean(
      5,
      LocaleKeys.text_0172,
      Resource.assetsImagesMeSafetyManagementPng,
      () {},
    ),
    ItemBean(6, LocaleKeys.text_0173, Resource.assetsImagesMeServicePng, () {
      // Get.toNamed(Routes.chatPage);
    }, isBotRoudis: true),
    ItemBean(7, LocaleKeys.text_0174, Resource.assetsImagesMeMySettingPng, () {
      Get.toNamed(Routes.mySettingPage);
    }, isBotRoudis: true, isTopRoudis: true),
  ];
}

class ItemBean {
  int? id;
  String? title;
  String? icon;
  bool isTopRoudis;
  bool isBotRoudis;
  bool? selectBool;
  Function? callBack;

  ItemBean(this.id, this.title, this.icon, this.callBack,
      {this.isTopRoudis = false, this.isBotRoudis = false, this.selectBool}) {
  }
}
