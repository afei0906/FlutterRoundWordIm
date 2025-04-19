part of '../../../index.dart';

class AddFriendWidget extends StatelessWidget {
  final TextEditingController searchController;
  final Function onSubmitted;
  final Function onChanged;

  final AddFriendLogic addFriendLogic;

  const AddFriendWidget(this.searchController, this.addFriendLogic,
      this.onChanged, this.onSubmitted);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: Get.height - 50,
        decoration: CustomBoxDecoration.topDecoration(color: AppTheme.bgColor2),
        child: Column(
          children: [
            ViewUtils.topView(
                    title: LocaleKeys.text_0102.tr, isShowRight: false)
                .marginSymmetric(vertical: 12.h),
            Row(
              children: [
                Expanded(
                  child: CustomUtils.onSearchView(
                      searchController, LocaleKeys.text_0133.tr,
                      isShowClear: true,
                      onSubmitted: onSubmitted,
                      onChanged: onChanged,
                      onClear: onChanged,
                      autofocus: true),
                ),
                GestureDetector(
                  onTap: SmartDialog.dismiss,
                  child: Text(
                    LocaleKeys.text_0011.tr,
                    style: AppTheme().appTextStyle.textStyleHintText.copyWith(
                          fontSize: 14.sp,
                          fontWeight: ThemeFontWeight.medium.weight,
                        ),
                  ).marginOnly(left: 16.w),
                )
              ],
            ).marginSymmetric(horizontal: 16.w),
            if (addFriendLogic.isSearch.isFalse &&
                !Utils.isEmpty(addFriendLogic.searchStr.value))
              GestureDetector(
                onTap: () {
                  onSubmitted.call();
                },
                child: Row(
                  children: [
                    Container(
                      width: 32.w,
                      height: 32.w,
                      decoration: CustomBoxDecoration.customDecoration(
                          color: AppTheme.primary, radius: 32),
                      child: Icon(
                        Icons.search,
                        color: AppTheme.bgColor,
                        size: 24.w,
                      ),
                    ),
                    8.horizontalSpace,
                    RichTextWidget(
                      model: RichTextModel(
                        text: LocaleKeys.text_0147.trParams({
                          'userName': addFriendLogic.searchStr.value,
                        }),
                        style: AppTheme().appTextStyle.textStyleTitleText,
                        items: [
                          RichTextItemModel(
                            text: addFriendLogic.searchStr.value,
                            style: AppTheme()
                                .appTextStyle
                                .textStylePrimary
                                .copyWith(
                                  fontWeight: ThemeFontWeight.medium.weight,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ).marginSymmetric(horizontal: 16.w, vertical: 16.h),
              ),
            if (addFriendLogic.isSearch.isTrue &&
                Utils.isEmpty(addFriendLogic.userInfo.value.friendId))
              Text(
                LocaleKeys.text_0149.tr,
                style: AppTheme().appTextStyle.textStyleHintText.copyWith(
                      fontSize: 16.sp,
                      fontWeight: ThemeFontWeight.medium.weight,
                    ),
              ).marginOnly(top: 50.w),
            if (addFriendLogic.isSearch.isTrue &&
                !Utils.isEmpty(addFriendLogic.userInfo.value.friendId))
              _userWidget(addFriendLogic.userInfo.value).marginOnly(top: 50.w),
          ],
        ),
      );
    });
  }

  Widget _userWidget(FriendInfo u) {
    return Container(
      decoration: CustomBoxDecoration.customDecoration(),
      child: Column(
        children: [
          Container(
            width: 58.w,
            height: 58.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(58.r),
                color: AppTheme.sliderColor.withOpacity(0.3)),
            child: ThemeImageWidget(
              url: u.avatar.toString() ?? '',
              error: Resource.assetsImagesUserAvatarDefualtPng,
              width: 56.w,
              height: 56.w,
              radius: 56.r,
            ),
          ),
          8.verticalSpace,
          Text(
           u.getNick(),
            style: AppTheme().appTextStyle.textStyleSecondary.copyWith(
                  fontSize: 14.sp,
                  fontWeight: ThemeFontWeight.medium.weight,
                ),
          ),
          8.verticalSpace,
          Text(
            Utils.toEmpty(u.showId) ?? '',
            style: AppTheme().appTextStyle.textStyleCheck.copyWith(
                  fontSize: 14.sp,
                  fontWeight: ThemeFontWeight.regular.weight,
                ),
          ),
          SizedBox(
            width: 203.w,
            child: AppButton.fillPrimaryButton(
              LocaleKeys.text_0102.tr,
              addFriendLogic.apply,
            ).marginSymmetric(horizontal: 16.w, vertical: 12.h),
          )
        ],
      ).marginSymmetric(vertical: 20.h, horizontal: 20.h),
    );
  }
}
