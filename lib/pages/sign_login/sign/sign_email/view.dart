part of '../index.dart';

class SignEmailPage extends StatelessWidget {
  SignEmailPage({Key? key}) : super(key: key);

  final SignEmailLogic logic = Get.put(SignEmailLogic());
  final SignEmailState state = Get.find<SignEmailLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
