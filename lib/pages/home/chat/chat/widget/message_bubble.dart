part of '../../../index.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  final VoidCallback? onLongPress;

  const MessageBubble({
    required this.message,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onLongPress: onLongPress,
        child: Align(
          alignment:
              message.isSender ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: ShapeDecoration(
              color: AppTheme.colorChatBg,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              shadows: const [
                BoxShadow(
                  color: AppTheme.colorChatShadow,
                  blurRadius: 2,
                  offset: Offset(0, 1),
                  spreadRadius: 0,
                )
              ],
            ),
            child: _buildMessageContent(),
          ),
        ));
  }

  Widget _buildMessageContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('文字文字文字',
            style: TextStyle(
              color: const Color(0xFF202329) /* color-text-default-primary */,
              fontSize: 15,
              fontFamily: 'PingFang SC',
              fontWeight: FontWeight.w400,
              height: 1.60,
            )),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '12:55',
              style: TextStyle(
                color: const Color(0xFF868A8F) /* color-text-default-fourth */,
                fontSize: 10,
                fontFamily: 'PingFang SC',
                fontWeight: FontWeight.w400,
                height: 1.40,
              ),
            ),
            SizedBox(
              width: 14.w,
              height: 14.w,
              child: Icon(Icons.check,size: 12.w,color: AppTheme.colorTextDefaultFourth,),
            )
          ],
        ),
      ],
    );
    // final isMe = message.uid.toString() == UserStore.to.userInfo.value.id.toString();
    // switch (int.parse(Utils.toEmpty(message.contentType)??'0')) {
    //   case MessageType.text.value:
    //     return Text(
    //       message.content,
    //       style: TextStyle(
    //         color:isMe
    //             ? Colors.white
    //             : Colors.black,
    //       ),
    //     );
    //   case MessageType.image.value.toString():
    //     return Image.network(
    //       message.content,
    //       width: 200,
    //       fit: BoxFit.cover,
    //     );
    //   case MessageType.:
    //     return Row(
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         Icon(Icons.play_arrow),
    //         Text('Voice Message'), // Add voice duration
    //       ],
    //     );
    //   default:
    //     return Text('Unsupported message type');
    // }
  }

  Widget _buildStatusIndicator() {
    IconData icon;
    Color color;
    return Container();
    // switch (message.status) {
    //   case MessageStatus.sending:
    //     return SizedBox(
    //       width: 12,
    //       height: 12,
    //       child: CircularProgressIndicator(strokeWidth: 2),
    //     );
    //   case MessageStatus.sent:
    //     icon = Icons.check;
    //     color = Colors.grey;
    //     break;
    //   case MessageStatus.delivered:
    //     icon = Icons.done_all;
    //     color = Colors.grey;
    //     break;
    //   case MessageStatus.read:
    //     icon = Icons.done_all;
    //     color = Colors.blue;
    //     break;
    //   case MessageStatus.failed:
    //     icon = Icons.error_outline;
    //     color = Colors.red;
    //     break;
    // }
    //
    // return Icon(icon, size: 16, color: color);
  }
}
