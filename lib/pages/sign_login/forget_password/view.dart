part of 'index.dart';

class ForgetPasswordPage extends StatelessWidget {
  ForgetPasswordPage({Key? key}) : super(key: key);

  final ForgetPasswordLogic logic = Get.put(ForgetPasswordLogic());
  final ForgetPasswordState state = Get.find<ForgetPasswordLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordLogic>(
      builder: (controller) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppTheme.bgColor,
            appBar: appBar(),
            body: Column(
              children: [],
            ));
      },
    );
  }

  PreferredSizeWidget appBar() {
    return CusAppBar.floatLeading(Get.context!, title: LocaleKeys.text_0019.tr);
  }
}
