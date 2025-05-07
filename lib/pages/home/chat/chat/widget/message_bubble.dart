part of '../../../index.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  final VoidCallback? onLongPress;

  const MessageBubble({
    required this.message,
    this.onLongPress,
  });

  double measureTextWidth(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    return textPainter.width;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onLongPress: onLongPress,
        child: Align(
          alignment:
              message.isSender ? Alignment.centerRight : Alignment.centerLeft,
          child: Stack(
            children: [
              if (message.isGroup && !message.isSender)
                Positioned(
                  bottom: 10.h,
                  left: 5.w,
                  child: CustomUtils.avator(message.avatar.toString(),
                      width: 20.w, height: 20.w),
                ),
              if (!message.isSender)
                Positioned(
                  bottom: 10.h,
                  left: message.isGroup ? 25.w : 0,
                  child: ThemeImageWidget(
                    path: Resource.assetsSvgDefaultChatLeftSvg,
                    width: 16.w,
                    height: 16.w,
                  ),
                ),
              _buildContent()
                  .marginOnly(left: message.isGroup ? 35.w : 10.w, right: 10.w),
              if (message.isSender)
                Positioned(
                  bottom: 10.h,
                  right: 0,
                  child: ThemeImageWidget(
                    path: Resource.assetsSvgDefaultChatRightSvg,
                    width: 16.w,
                    height: 16.w,
                  ),
                ),
            ],
          ),
        ));
  }

  Widget _buildMessageContent() {
    return Stack(
      alignment: (message.isSender) ? Alignment.topRight : Alignment.topLeft,
      children: [
        Text(Utils.toEmpty(message.content) ?? '',
            style: AppTheme().appTextStyle.styleTextDefaultPrimary.copyWith(
                  fontSize: 15.sp,
                  fontWeight: ThemeFontWeight.regular.weight,
                )).marginOnly(bottom: 20.h),
        Positioned(
          right: 0,
          bottom: 0,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  Date.parseISOTimeByInt(
                          int.parse(Utils.toEmpty(message.time) ?? '0'),
                          'yyyy/MM/dd HH:mm') ??
                      '',
                  style: AppTheme()
                      .appTextStyle
                      .styleTextDefaultFourth
                      .copyWith(fontSize: 10.sp)),
              if (message.isSender && message.isRead)
                SizedBox(
                  width: 14.w,
                  height: 14.w,
                  child: Icon(
                    Icons.check,
                    size: 12.w,
                    color: AppTheme.colorTextDefaultFourth,
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContent() {
    switch (message.messageType) {
      case MessageType.text:
        return Container(
          constraints: BoxConstraints(
              maxWidth: 255.w,
              minWidth: measureTextWidth(
                      Date.parseISOTimeByInt(
                              int.parse(Utils.toEmpty(message.time) ?? '0'),
                              'yyyy/MM/dd HH:mm') ??
                          '',
                      AppTheme()
                          .appTextStyle
                          .styleTextDefaultFourth
                          .copyWith(fontSize: 10.sp)) +
                  24.w +
                  ((message.isSender && message.isRead) ? 14.w : 0)),
          margin: const EdgeInsets.symmetric(vertical: 6),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: _buildDecoration(),
          child: _buildMessageContent(),
        );
      case MessageType.file:
        return Container();
      case MessageType.audio:
        return Container();
      case MessageType.video:
        // TODO: Handle this case.
        return Container();
      case MessageType.image:
        // TODO: Handle this case.
        return Container();
      case MessageType.inviteIntoGroup:
        // TODO: Handle this case.
        return Container();
      case MessageType.msgCard:
        // TODO: Handle this case.
        return Container();
      case MessageType.callVideo:
        return Container();
      case MessageType.callAudio:
        // TODO: Handle this case.
        return Container();
      case MessageType.redPacket:
        // TODO: Handle this case.
        return Container();
      case MessageType.groupApply:
        // TODO: Handle this case.
        return Container();
      case MessageType.position:
        // TODO: Handle this case.
        return Container();
      case MessageType.moment:
        // TODO: Handle this case.
        return Container();
      case MessageType.likes:
        // TODO: Handle this case.
        return Container();
      case MessageType.comment:
        // TODO: Handle this case.
        throw UnimplementedError();
      case MessageType.transferMoney:
        // TODO: Handle this case.
        return Container();
      case MessageType.template:
        // TODO: Handle this case.
        return Container();
    }
  }

  Decoration _buildDecoration() {
    return ShapeDecoration(
      color: message.isSender
          ? AppTheme.colorChatBg
          : AppTheme.colorTextDarkPrimary,
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
    );
  }
}
