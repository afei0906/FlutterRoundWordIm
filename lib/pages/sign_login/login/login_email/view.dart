part of '../index.dart';

class LoginEmailPage extends StatelessWidget {
  LoginEmailPage({Key? key}) : super(key: key);

  final LoginEmailLogic logic = Get.put(LoginEmailLogic());
  final LoginEmailState state = Get.find<LoginEmailLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
