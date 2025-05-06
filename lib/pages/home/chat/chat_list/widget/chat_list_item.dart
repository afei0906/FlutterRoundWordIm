part of '../../../index.dart';

class ChatSlidableWidget extends StatefulWidget {
  int? index;
  ConversationList conversationList;
  ChatListLogic logic;

  ChatSlidableWidget(this.index, this.conversationList, this.logic);

  @override
  State<ChatSlidableWidget> createState() => _GroupsSlidableWidgetState();
}

class _GroupsSlidableWidgetState extends State<ChatSlidableWidget>
    with SingleTickerProviderStateMixin {
  late final controller = SlidableController(this);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key('dismissibleKey${widget.index}'),
      controller: controller,
      endActionPane: ActionPane(
        extentRatio: 0.7,
        motion: const ScrollMotion(),
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                widget.logic.topFlag(widget.conversationList,
                    widget.conversationList.topFlag.toString() == '1' ? 0 : 1);
                controller.close();
                // controller.dispose();
              },
              child: Container(
                alignment: Alignment.center,
                height: double.infinity,
                color: AppTheme.colorBrandPrimary,
                child: Text(
                  widget.conversationList.topFlag.toString() == '1'
                      ? LocaleKeys.text_0235.tr
                      : LocaleKeys.text_0234.tr,
                  style: AppTheme().appTextStyle.styleTextDarkPrimary.copyWith(
                        fontSize: 14.sp,
                        fontWeight: ThemeFontWeight.regular.weight,
                      ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                widget.logic.toMsgFreeFlag(
                    widget.conversationList,
                    widget.conversationList.msgFreeFlag.toString() == '1'
                        ? 0
                        : 1);
                controller.close();
                // controller.dispose();
              },
              child: Container(
                alignment: Alignment.center,
                height: double.infinity,
                color: AppTheme.colorGrey,
                child: Text(
                  widget.conversationList.msgFreeFlag.toString() == '1'
                      ? LocaleKeys.text_0237.tr
                      : LocaleKeys.text_0236.tr,
                  textAlign: TextAlign.center,
                  style: AppTheme().appTextStyle.styleTextDarkPrimary.copyWith(
                        fontSize: 14.sp,
                        fontWeight: ThemeFontWeight.regular.weight,
                      ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                widget.logic.delete(widget.conversationList);
                controller.close();
                // controller.dispose();
              },
              child: Container(
                height: double.infinity,
                color: AppTheme.colorBrandError,
                alignment: Alignment.center,
                child: Text(
                  LocaleKeys.text_0212.tr,
                  style: AppTheme().appTextStyle.styleTextDarkPrimary.copyWith(
                        fontSize: 14.sp,
                        fontWeight: ThemeFontWeight.regular.weight,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          widget.logic.toChat(widget.conversationList);
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  CustomUtils.avator(
                    widget.conversationList.avatar.toString() ?? '',
                    width: 48.w,
                    height: 48.w,
                    type: int.parse(
                        Utils.toEmpty(widget.conversationList.chatMode) ?? "1"),
                    error: Resource.assetsImagesGroupAvatarDefualtpng,
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            Utils.toEmpty(
                                    widget.conversationList.name.toString()) ??
                                '',
                            style:
                                AppTheme().appTextStyle.styleTextDefaultPrimary,
                          ),
                        ),
                        Row(
                          children: [
                            if (int.parse(Utils.toEmpty(
                                        widget.conversationList.notReadCount) ??
                                    '0') <=
                                0)
                              ThemeImageWidget(
                                path: Resource.assetsSvgDefaultChatOnReadSvg,
                                width: 16.w,
                                height: 16.w,
                              ),
                            Flexible(
                              child: Text(
                                widget.logic
                                    .toContentType(widget.conversationList),
                                maxLines: 2,
                                style: AppTheme()
                                    .appTextStyle
                                    .styleTextDefaultFourth,
                              ).marginOnly(right: 5.w),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        Date.parseISOTime(
                                Utils.toEmpty(widget.conversationList.time) ??
                                    Utils.toEmpty(
                                        widget.conversationList.createTime)) ??
                            '',
                        textAlign: TextAlign.right,
                        style: AppTheme().appTextStyle.styleTextDefaultTernary,
                      ),
                      4.verticalSpace,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (widget.conversationList.topFlag.toString() == "1")
                            Transform.rotate(
                              angle: 45 * 3.1415926 / 180, // 转换为弧度
                              child: Icon(
                                Icons.push_pin,
                                size: 22.w,
                                color: AppTheme.colorTextDefaultTernary,
                              ),
                            ).marginOnly(right: 6.w),
                          if (widget.conversationList.msgFreeFlag.toString() ==
                              "1")
                            Icon(
                              Icons.notifications_off,
                              size: 22.w,
                              color: AppTheme.colorTextDefaultTernary,
                            )
                          else if (int.parse(Utils.toEmpty(
                                      widget.conversationList.notReadCount) ??
                                  '0') >
                              0)
                            ConstrainedBox(
                              constraints: const BoxConstraints(minWidth: 20),
                              child: Container(
                                height: 20,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: ShapeDecoration(
                                  color: const Color(
                                      0xFF126BF6) /* color-fill-button-primary */,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 10,
                                  children: [
                                    SizedBox(
                                      width: 17,
                                      child: Text(
                                        Utils.toEmpty(widget.conversationList
                                                .notReadCount) ??
                                            '0',
                                        textAlign: TextAlign.center,
                                        style: AppTheme()
                                            .appTextStyle
                                            .styleTextDarkPrimary
                                            .copyWith(
                                              fontSize: 13.sp,
                                              letterSpacing: -0.08,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      )
                    ],
                  )
                ],
              ).marginSymmetric(vertical: 12.h),
              const Divider(
                height: 1,
                color: AppTheme.colorBorderLight,
              ).marginOnly(
                left: 50.w,
              )
            ],
          ),
        ),
      ),
    );
  }
}
