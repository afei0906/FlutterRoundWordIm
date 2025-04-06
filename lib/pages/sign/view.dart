part of 'index.dart';

class SignPage extends StatelessWidget {
  SignPage({Key? key}) : super(key: key);

  final SignLogic logic = Get.put(SignLogic());
  final SignState state = Get.find<SignLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignLogic>(
      builder: (controller) {
        return Scaffold(backgroundColor: AppTheme.bgColor, body: Container());
      },
    );
  }
}
