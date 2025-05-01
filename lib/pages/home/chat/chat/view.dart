part of '../../index.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);

  final ChatLogic logic = Get.put(ChatLogic());
  final ChatState state = Get.find<ChatLogic>().state;
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatLogic>(
      assignId: true,
      builder: (logic) {
        return Scaffold(
          backgroundColor: AppTheme.colorTextDarkPrimary,
          body: GestureDetector(
              onTap: logic.clickRoot,
              child: Container(
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
                          child:
                          state.chatFormType == ChatFormType.createGroup
                              ? GroupInfoWidget(state.groupInfo,
                                  (int index, GroupInfo groupInfo) {
                                if (index == 0) {
                                  logic.addGroupMember(groupInfo);
                                } else {
                                  logic.showGroupInfo(groupInfo);
                                }
                              })
                              : ChatWidget(logic)),
                      // 底部输入区域
                      ChatInput(
                        onSendMessage: (String text, MessageType m,
                            {List<String>? atUsers}) {},
                      ),
                    ],
                  ))),
          appBar: appBar(),
        );
      },
    );
  }

  PreferredSizeWidget appBar() {
    return CusAppBar.floatLeading(Get.context!,
        // title: state.chatRequest?.title ?? '',
        leadingWidth: 80.w,
        titleWidget: GestureDetector(
          onTap: logic.clickRoot,
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: state.chatRequest?.title ?? '',
                  style: AppTheme().appTextStyle.textStyleTitleText,
                  children: [
                    if (state.chatRequest?.channelType.toString() == "2")
                      TextSpan(
                        text:
                            '\n${Utils.toEmpty(state.groupInfo?.joinNum) ?? ''} ${LocaleKeys.text_0144.tr}',
                        style: AppTheme().appTextStyle.styleTextDefaultFourth,
                      )
                  ])),
        ),
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
}
