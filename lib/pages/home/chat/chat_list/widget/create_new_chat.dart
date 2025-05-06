part of '../../../index.dart';

class CreateNewChat extends StatelessWidget {
  ChatListLogic friendListLogic;

  CreateNewChat(this.friendListLogic, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height - 50,
      decoration: CustomBoxDecoration.topDecoration(color: AppTheme.bgColor2),
      child: Column(
        children: [
          ViewUtils.topView(
                  title: LocaleKeys.text_0155.tr, onBack: SmartDialog.dismiss)
              .marginSymmetric(vertical: 12.h),
          CustomUtils.onSearchView(
            friendListLogic.searchController,
            LocaleKeys.text_0133.tr,
            onSubmitted: friendListLogic.onSubmitted,
            onChanged: friendListLogic.onSubmitted,
          ).marginSymmetric(horizontal: 16.w),
          Expanded(
              child: Stack(
            children: [
              FriendListPage(
                friendListLogic,
                friendListLogic.state,
              ),
              Container(
                color: AppTheme.bgColor2,
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: CustomBoxDecoration.customDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _topMune(
                            LocaleKeys.text_0101.tr,
                            Resource.assetsSvgDefaultChatGroupAddSvg,
                            friendListLogic.toCreateGroup),
                        const Divider(
                          height: 1,
                          color: AppTheme.colorBorderLight,
                        ),
                        _topMune(
                            LocaleKeys.text_0102.tr,
                            Resource.assetsSvgDefaultChatUserAddSvg,
                            friendListLogic.toAdd),
                        const Divider(
                          height: 1,
                          color: AppTheme.colorBorderLight,
                        ),
                        _topMune(
                            LocaleKeys.text_0156.tr,
                            Resource.assetsSvgDefaultChatGroupAddSvg,
                            friendListLogic.toNewChannel),
                      ],
                    )).marginSymmetric(vertical: 12.h),
              ),
            ],
          )),
        ],
      ),
    );
  }

  Widget _topMune(String name, String png, Function? callBack) {
    return GestureDetector(
      onTap: () {
        callBack?.call();
      },
      child: Container(
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: CustomBoxDecoration.customDecoration(),
        child: Row(
          children: [
            ThemeImageWidget(
              path: png,
              width: 24.w,
              height: 24.w,
              color: AppTheme.colorBrandPrimary,
            ),
            12.horizontalSpace,
            Text(
              name,
              style: AppTheme().appTextStyle.textExtraLightStyleBlack,
            ),
          ],
        ),
      ),
    );
  }
}
