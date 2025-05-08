part of '../../../index.dart';

class ChatInput extends StatefulWidget {
  final Function(String text, MessageType m, {List<String>? atUsers})
      onSendMessage;

  const ChatInput({
    required this.onSendMessage,
    super.key,
  });

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> with WidgetsBindingObserver {
  final TextEditingController _controller = TextEditingController();
  final List<String> _atUsers = [];

  // ChatLogic logic = Get.find<ChatLogic>();
  final ChatState state = Get.find<ChatLogic>().state;
  double lastBottom = 0;
  int emojiType = 0; //0 emoji, 1 gif

  bool isKeyboardVisible = false;

  final scrollController = ScrollController();

  // 定义每页的列数和行数
  int columnsPerPage = 4;
  int rowsPerPage = 2;
  int itemsPerPage = 8; // 每页8个
  // 计算总页数
  int pageCount = 1;

  RxList<FuncItem> funcItemList = UserStore.to.emotionState
      .getInputList(Get.find<ChatLogic>().state.chatRequest?.channelType);

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    itemsPerPage = columnsPerPage * rowsPerPage;
    // 计算总页数
    funcItemList =
        UserStore.to.emotionState.getInputList(state.chatRequest?.channelType);
    pageCount = ((funcItemList.length * 1.0) / (itemsPerPage * 1.0)).ceil();

    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void didChangeMetrics() {
    final viewInsets = WidgetsBinding.instance.window.viewInsets;
    final bool newValue = viewInsets.bottom > 0;
    if (lastBottom < viewInsets.bottom) {
      //是弹出状态
      state.emojiShowing.value = false;
      setState(() {});
    }
    lastBottom = viewInsets.bottom;
    if (isKeyboardVisible != newValue) {
      isKeyboardVisible = newValue;
      setState(() {});
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _toEmojiShowing() {
    if (state.emojiShowing.isFalse || emojiType == 0 || emojiType == 1) {
      state.emojiShowing.value = !state.emojiShowing.value;
    }
    emojiType = 0;
    setState(() {});
    if (state.emojiShowing.isTrue) {
      FocusScope.of(Get.context!).unfocus();
    }
  }

  void showEmoji(int emojiType) {
    if (this.emojiType != 2) {
      state.emojiShowing.value = true;
      this.emojiType = emojiType;
    } else {
      this.emojiType = 0;
    }
    setState(() {
      if (state.emojiShowing.isTrue) {
        FocusScope.of(Get.context!).unfocus();
      }
    });
  }

  void _insertAtUser(String userId, String name) {
    final text = _controller.text;
    final selection = _controller.selection;
    final newText =
        text.replaceRange(selection.start, selection.end, '@$name ');
    _controller.value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(
        offset: selection.start + name.length + 2,
      ),
    );
    if (!_atUsers.contains(userId)) {
      _atUsers.add(userId);
    }
  }

  void _checkRemovedAtUsers() {
    final text = _controller.text;
    _atUsers.removeWhere((userId) {
      final userName = '获取用户名'; // 从用户服务获取
      return !text.contains('@$userName');
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildBottomInput();
  }

  void _showAtUserList() {
    if (state.chatRequest?.channelType.toString() == "1") {
      return;
    }
    showModalBottomSheet(
      context: context,
      builder: (context) => ListView(
        children: [
          ListTile(
            title: Text('所有人'),
            onTap: () {
              _insertAtUser('all', '所有人');
              Navigator.pop(context);
            },
          ),
          // 其他群成员列表
        ],
      ),
    );
  }

  Widget _buildBottomInput() {
    return Obx(() {
      return Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppTheme.colorFillPageGray,
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showEmoji(2);
                        },
                        child: ThemeImageWidget(
                          path: Resource.assetsSvgDefaultAddPlusCircleSvg,
                          width: 24.w,
                          height: 24.w,
                        ).marginSymmetric(horizontal: 12.w),
                      ),
                      Expanded(
                        child: Container(
                          constraints: BoxConstraints(minHeight: 22.h),
                          padding: EdgeInsets.symmetric(horizontal: 4.h),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: AppTheme.colorTextDarkPrimary,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 0.50,
                                color: AppTheme.colorBorderLight,
                              ),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: TextField(
                            controller: _controller,
                            textInputAction: TextInputAction.send,
                            // 这里设置成 send
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            minLines: 1,
                            onChanged: (text) {
                              if (text.endsWith('@')) {
                                _showAtUserList();
                              }
                              _checkRemovedAtUsers();
                            },
                            onSubmitted: (v) {
                              if (_controller.text.isNotEmpty) {
                                widget.onSendMessage(
                                  _controller.text,
                                  MessageType.text,
                                  atUsers: List.from(_atUsers),
                                );
                                _controller.text="";
                                FocusScope.of(Get.context!).requestFocus();
                                _controller.clear();
                                _atUsers.clear();
                              }
                            },
                            decoration: InputDecoration(
                              hintText: LocaleKeys.text_0202.tr,
                              filled: false,
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              isDense: true,
                              hintStyle:
                                  AppTheme().appTextStyle.textStyleHintText,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 8.h),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: _toEmojiShowing,
                        child: ThemeImageWidget(
                          path: state.emojiShowing.isTrue &&
                                  (emojiType == 0 || emojiType == 1)
                              ? Resource.assetsSvgDefaultKeybordCoreSvg
                              : Resource.assetsSvgDefaultSmileyCoreSvg,
                          width: 24.w,
                          height: 24.w,
                        ).marginOnly(left: 8.w),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_controller.text.isNotEmpty) {
                            widget.onSendMessage(
                              _controller.text,
                              MessageType.text,
                              atUsers: List.from(_atUsers),
                            );
                            _controller.clear();
                            _atUsers.clear();
                          }
                        },
                        child: ThemeImageWidget(
                          path: (Utils.isEmpty(_controller.text))
                              ? Resource.assetsSvgDefaultVoiceCoreSvg
                              : Resource.assetsSvgDefaultSendCoreSvg,
                          width: 24.w,
                          height: 24.w,
                        ).marginSymmetric(horizontal: 8.w),
                      )
                    ],
                  ),
                ),
                _emojiPicker()
              ],
            ).marginOnly(bottom: 10.h),
          ),
        ],
      );
    });
  }

  Widget _emojiPicker() {
    return Visibility(
        visible: state.emojiShowing.isTrue,
        child: Column(
          children: [
            if (emojiType == 0)
              EmojiPicker(
                textEditingController: _controller,
                scrollController: scrollController,
                config: Config(
                  height: MediaQuery.of(Get.context!).viewInsets.bottom == 0
                      ? 280.h
                      : MediaQuery.of(Get.context!).viewInsets.bottom,
                  bottomActionBarConfig:
                      const BottomActionBarConfig(enabled: false),
                  emojiViewConfig: EmojiViewConfig(
                    // Issue: https://github.com/flutter/flutter/issues/28894
                    emojiSizeMax: 28 *
                        (foundation.defaultTargetPlatform == TargetPlatform.iOS
                            ? 1.2
                            : 1.0),
                  ),
                ),
              ),
            if (emojiType == 1) _gifWidget(),
            if (emojiType == 0 || emojiType == 1)
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  color: Colors.transparent,
                  padding: EdgeInsets.only(top: 10.h),
                  child: Column(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: AppTheme
                              .colorTextDarkPrimary /* color-fill-page-primary */,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showEmoji(0);
                              },
                              child: Container(
                                width: 80.w,
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                decoration: ShapeDecoration(
                                  color: emojiType == 0
                                      ? AppTheme.colorFillPageDeep
                                      : null,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                ),
                                child: Text(
                                  'Emoji',
                                  style: emojiType == 0
                                      ? AppTheme()
                                          .appTextStyle
                                          .styleTextDefaultTernary
                                          .copyWith(
                                            fontSize: 14.sp,
                                            fontWeight:
                                                ThemeFontWeight.medium.weight,
                                          )
                                      : AppTheme()
                                          .appTextStyle
                                          .styleTextDefaultFourth
                                          .copyWith(
                                            fontSize: 14.sp,
                                            fontWeight:
                                                ThemeFontWeight.medium.weight,
                                          ),
                                ),
                              ).marginSymmetric(vertical: 2, horizontal: 5),
                            ),
                            GestureDetector(
                                onTap: () {
                                  showEmoji(1);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 80.w,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  decoration: ShapeDecoration(
                                    color: emojiType == 1
                                        ? AppTheme.colorFillPageDeep
                                        : null,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                  ),
                                  child: Text(
                                    'GIF',
                                    style: emojiType == 0
                                        ? AppTheme()
                                            .appTextStyle
                                            .styleTextDefaultTernary
                                            .copyWith(
                                              fontSize: 14.sp,
                                              fontWeight:
                                                  ThemeFontWeight.medium.weight,
                                            )
                                        : AppTheme()
                                            .appTextStyle
                                            .styleTextDefaultFourth
                                            .copyWith(
                                              fontSize: 14.sp,
                                              fontWeight:
                                                  ThemeFontWeight.medium.weight,
                                            ),
                                  ),
                                ).marginSymmetric(vertical: 2, horizontal: 5)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (emojiType == 2) _chatPanel()
          ],
        ));
  }

  Widget _gifWidget() {
    return SizedBox(
      height: MediaQuery.of(Get.context!).viewInsets.bottom == 0
          ? 280.h
          : MediaQuery.of(Get.context!).viewInsets.bottom,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // 4 列
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1, // 宽高比 1:1
        ),
        itemCount: UserStore.to.emotionState.emotionList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              widget.onSendMessage(
                UserStore.to.emotionState.emotionList[index],
                MessageType.image,
                atUsers: List.from(_atUsers),
              );
            },
            child: ThemeImageWidget(
              url: UserStore.to.emotionState.emotionList[index],
              radius: 8,
            ),
          );
        },
      ),
    );
  }

  Widget _chatPanel() {
    return Container(
      height: 220.h,
      alignment: Alignment.center,
      child: PageView(
        // PageView 包含所有构建好的页面
        children: buildPages(),
      ).marginOnly(top: 12.h),
    );
  }

  List<Widget> buildPages() {
    final List<Widget> pages = [];
    for (int i = 0; i < pageCount; i++) {
      // 计算当前页需要显示的数据范围
      final startIndex = i * itemsPerPage;
      final endIndex = (startIndex + itemsPerPage) > funcItemList.length
          ? funcItemList.length // 防止越界
          : (startIndex + itemsPerPage);
      // 获取当前页的数据列表
      final currentPageItems = funcItemList.sublist(startIndex, endIndex);

      // 使用 GridView 构建当前页的网格布局
      pages.add(
        GridView.builder(
          // 禁止 GridView 内部滚动，让 PageView 控制滚动
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          // 去掉 GridView 的内边距
          itemCount: currentPageItems.length,
          // 定义网格布局
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columnsPerPage, // 每行2列
            mainAxisSpacing: 8.h, // 主轴（垂直）间距
            crossAxisSpacing: 8.h, // 交叉轴（水平）间距
            childAspectRatio: 0.85, // 子项宽高比，调整可以改变按钮的高度
          ),
          // 构建每个网格项 (功能按钮)
          itemBuilder: (context, index) {
            final item = currentPageItems[index];
            return GestureDetector(
              onTap: () {
                item.call.call();
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ThemeImageWidget(
                    width: 56.h,
                    height: 56.h,
                    path: item.icon,
                  ),
                  8.verticalSpace,
                  Text(
                    item.label,
                    style: AppTheme().appTextStyle.styleTextDefaultTernary,
                  ),
                ],
              ),
            );
          },
        ).marginSymmetric(horizontal: 16.w),
      );
    }
    return pages;
  }

// Future<void> _pickImage() async {
//   final picker = ImagePicker();
//   final image = await picker.pickImage(source: ImageSource.gallery);
//   if (image != null) {
//     widget.onSendMessage(image.path, MessageType.text);
//   }
// }
//
// void _startVoiceRecord() {
//   // 实现语音录制
// }
}
