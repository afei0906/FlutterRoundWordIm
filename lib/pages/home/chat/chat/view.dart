part of '../../index.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);

  final ChatLogic logic = Get.put(ChatLogic());
  final ChatState state = Get.find<ChatLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgColor,
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fill,
            alignment: Alignment.topCenter,
            image: AssetImage(Resource.assetsImagesBgChatPng),
          )),
          child: Column()),
      appBar: appBar(),
    );
  }

  PreferredSizeWidget appBar() {
    return CusAppBar.floatLeading(
      Get.context!,
      automaticallyImplyLeading: true,
      leadingWidth: 80.w,
      leftWidget: Text(
        LocaleKeys.text_0095.tr,
        style: AppTheme().appTextStyle.textStyleSecondary,
      ).marginOnly(left: 16.w),
    );
  }
}
