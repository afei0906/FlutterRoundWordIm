part of '../../index.dart';

class MySettingLogic extends GetxController {
  final MySettingState state = MySettingState();

  @override
  void onInit() {
    state.itemList = [
      ItemBean(0, LocaleKeys.text_0183, '', () {},
          isTopRoudis: true, selectBool: true),
      ItemBean(1, LocaleKeys.text_0184, "", () {}, selectBool: true),
      ItemBean(2, LocaleKeys.text_0185, '', () {}, selectBool: false),
      ItemBean(3, LocaleKeys.text_0186, "", () {}, isBotRoudis: true),
      ItemBean(4, LocaleKeys.text_0187, '10 MB', () {}, isTopRoudis: true),
      ItemBean(5, LocaleKeys.text_0188, 'v ${ConfigStore.to.appVersion}', () {},
          isBotRoudis: true),
    ];
    super.onInit();
  }

  void onSwitch(ItemBean itemBean) {
    itemBean.selectBool = !(itemBean.selectBool ?? false);
    update();
  }

  void loginOut() {
    UserStore.to.logout();
  }
}
