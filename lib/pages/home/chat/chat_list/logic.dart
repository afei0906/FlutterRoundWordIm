part of '../../index.dart';

class ChatListLogic extends GetxController {
  final ChatListState state = ChatListState();

  void toAdd() {
    SmartDialog.show(
        clickMaskDismiss: false,
        builder: (_) {
          return ColoredBox(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CusAppBar.leading(Get.context!,
                      title: '',
                      appBarColor: Colors.transparent,
                      onBack: SmartDialog.dismiss),
                  Row(
                    children: [
                      Expanded(
                          child: GestureDetector(
                        onTap: toAddGroup,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ThemeImageWidget(
                              path: Resource.assetsSvgDefaultGroupAddSvg,
                              width: 24.w,
                              height: 24.w,
                            ),
                            8.verticalSpace,
                            Text(
                              LocaleKeys.text_0101.tr,
                              style: AppTheme()
                                  .appTextStyle
                                  .textExtraLightStyleBlack,
                            )
                          ],
                        ),
                      )),
                      Expanded(
                          child: GestureDetector(
                        onTap: toAddUser,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ThemeImageWidget(
                              path: Resource.assetsSvgDefaultUserAddSvg,
                              width: 24.w,
                              height: 24.w,
                            ),
                            8.verticalSpace,
                            Text(
                              LocaleKeys.text_0102.tr,
                              style: AppTheme()
                                  .appTextStyle
                                  .textExtraLightStyleBlack,
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                  22.verticalSpace
                ],
              ));
        },
        alignment: Alignment.topCenter);
  }

  void toScan() {}

  void toAddGroup() {}

  void toAddUser() {}
}

extension SearchChatLogicX on ChatListLogic {
  void onChanged() {
    update();
  }
  
  void onSubmitted(){}

}
