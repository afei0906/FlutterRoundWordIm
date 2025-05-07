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
    return Expanded(
      child: Obx(
        () => ListView(
          controller: scrollController,
          // 这里是关键，把滚动方向反转
          reverse: true,
          children: controller.state.messages
              .map((msg) => MessageBubble(
                    message: msg,
                    onLongPress: () => () {
                      // _showMessageOptions(context, message);
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
