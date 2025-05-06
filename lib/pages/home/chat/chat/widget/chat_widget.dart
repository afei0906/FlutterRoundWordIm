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
      () => ListView.builder(
        itemCount: controller.state.messages.length,
        itemBuilder: (context, index) {
          // if (index == controller.state.messages.length) {
          //   if (controller.state.isLoading.value) {
          //     return Center(child: CircularProgressIndicator());
          //   }
          //   if (controller.state.hasMore.value) {
          //     return TextButton(
          //       onPressed: controller.loadMoreMessages,
          //       child: Text('Load More'),
          //     );
          //   }
          //   return SizedBox();
          // }

          final message = controller.state.messages[index];
          return MessageBubble(
            message: message,
            onLongPress: () => () {
              // _showMessageOptions(context, message);
            },
          );
        },
      ),
    ));
  }
}
