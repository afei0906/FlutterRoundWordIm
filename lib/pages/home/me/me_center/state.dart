part of '../../index.dart';

class MeCenterState {
  List<ItemBean> itemList = [
    ItemBean(
        LocaleKeys.text_0167, Resource.assetsImagesMeMyWalletPng, () {},
        isBotRoudis: true, isTopRoudis: true),
    ItemBean(
        LocaleKeys.text_0168, Resource.assetsImagesMeMyCollectionPng, () {},
        isTopRoudis: true),
    ItemBean(
      LocaleKeys.text_0169,
      Resource.assetsImagesMeMyTeamPng,
      () {},
    ),
    ItemBean(
      LocaleKeys.text_0170,
      Resource.assetsImagesMeMyProfilePng,
      () {},
    ),
    ItemBean(
      LocaleKeys.text_0171,
      Resource.assetsImagesMeNameauthenticationPng,
      () {},
    ),
    ItemBean(
      LocaleKeys.text_0172,
      Resource.assetsImagesMeSafetyManagementPng,
      () {},
    ),
    ItemBean(LocaleKeys.text_0173, Resource.assetsImagesMeServicePng, () {},
        isBotRoudis: true),
    ItemBean(
        LocaleKeys.text_0174, Resource.assetsImagesMeMySettingPng, () {},
        isBotRoudis: true, isTopRoudis: true),
  ];
}

class ItemBean {
  String? title;
  String? icon;
  bool isTopRoudis;
  bool isBotRoudis;
  Function? callBack;

  ItemBean(this.title, this.icon, this.callBack,
      {this.isTopRoudis = false, this.isBotRoudis = false});
}
