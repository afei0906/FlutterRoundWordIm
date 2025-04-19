part of '../../index.dart';

class MySettingLogic extends GetxController {
  final MySettingState state = MySettingState();


  void loginOut(){
    UserStore.to.logout();
  }
}
