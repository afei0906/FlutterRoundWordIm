part of '../index.dart';
class SignPhonePage extends StatelessWidget {
  SignPhonePage({Key? key}) : super(key: key);

  final SignPhoneLogic logic = Get.put(SignPhoneLogic());
  final SignPhoneState state = Get.find<SignPhoneLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
