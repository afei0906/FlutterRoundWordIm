part of '../index.dart';
class PhoneRestPage extends StatelessWidget {
  PhoneRestPage({Key? key}) : super(key: key);

  final PhoneRestLogic logic = Get.put(PhoneRestLogic());
  final PhoneRestState state = Get.find<PhoneRestLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PhoneRestLogic>(
      builder: (controller) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppTheme.colorTextDarkPrimary,
            appBar: appBar(),
            body: Column(
              children: [

              ],
            ));
      },
    );
  }

  PreferredSizeWidget appBar() {
    return CusAppBar.floatLeading(Get.context!, title: LocaleKeys.text_0019.tr);
  }
}
