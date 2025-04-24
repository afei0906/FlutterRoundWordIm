part of '../../../index.dart';

class ChatWidget extends StatelessWidget {
  ChatLogic controller;
  final scrollController = ScrollController();

  ChatWidget(this.controller) {
    scrollController.addListener(() {
      // 如果滚动到顶部（其实是聊天列表的最底部，因为 reverse: true）
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 100) {
        controller.loadMoreMessages();
      }
    });
  }
  // builder
  @override
  Widget build(BuildContext context) {
    return Container();

    //   Obx(() => ListView(
    //   controller: scrollController,
    //   // itemCount: controller.state.length,
    //   // itemBuilder: (_, index) {
    //   //   return ChatBubble(message: controller.messages[index]);
    //   // },
    // ));
  }
}
