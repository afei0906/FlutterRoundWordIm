part of '../../index.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);

  final ChatLogic logic = Get.put(ChatLogic());
  final ChatState state = Get.find<ChatLogic>().state;
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colorTextDarkPrimary,
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fill,
            alignment: Alignment.topCenter,
            image: AssetImage(Resource.assetsImagesBgChatPng),
          )),
          child: Column(
            children: [
              Expanded(
                  child: state.chatFormType == ChatFormType.createGroup
                      ? GroupInfoWidget(logic.getGroupInfo(), (int index,GroupInfo groupInfo) {
                          if (index == 0) {
                            logic.addGroupMember(groupInfo);
                          } else {
                            logic.showGroupInfo(groupInfo);
                          }
                        })
                      : ChatWidget(logic)),
              // 底部输入区域
              _buildBottomInput(),
            ],
          )),
      appBar: appBar(),
    );
  }

  PreferredSizeWidget appBar() {
    return CusAppBar.floatLeading(Get.context!,
        title: state.chatRequest?.title ?? '',
        leadingWidth: 80.w,
        leftWidget: Text(
          LocaleKeys.text_0095.tr,
          style: AppTheme().appTextStyle.textStyleSecondary,
        ).marginOnly(left: 16.w),
        actions: [
          GestureDetector(
            onTap: logic.toDetail,
            child: CustomUtils.avator(
              state.chatRequest?.avatar ?? '',
              type: int.parse(
                  Utils.toEmpty(state.chatRequest?.channelType) ?? '0'),
            ),
          ),
          16.horizontalSpace
        ]);
  }

  Widget _buildBottomInput() {
    return Container();
  }
}
