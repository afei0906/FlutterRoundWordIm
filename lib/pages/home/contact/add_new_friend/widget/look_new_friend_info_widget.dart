part of '../../../index.dart';

class LookNewFriendInfoWidget extends StatelessWidget {
  final Function onApply;
  final Function onRefuse;

  final ApplyFriendInfo friendInfo;

  const LookNewFriendInfoWidget(this.friendInfo, this.onApply, this.onRefuse);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: AppTheme.colorTextDarkPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          30.verticalSpace,
          CustomUtils.avator(
              width: 56.w,
              height: 56.w,
              Utils.toEmpty(friendInfo.avatar) ?? ''),
          12.verticalSpace,
          Text(
            Utils.toEmpty(friendInfo.nick) ?? '',
            textAlign: TextAlign.center,
            style: AppTheme()
                .appTextStyle
                .styleTextDefaultSecondary
                .copyWith(fontSize: 16.sp),
          ),
          12.verticalSpace,
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: ShapeDecoration(
              color: AppTheme.colorFillPageGray /* color-fill-page-gray */,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: Text(
              Utils.toEmpty(friendInfo.greet) ?? '',
              textAlign: TextAlign.center,
              style: AppTheme().appTextStyle.styleBrandPrimary.copyWith(
                  fontSize: 12.sp, fontWeight: ThemeFontWeight.regular.weight),
            ),
          ).marginSymmetric(horizontal: 16.w),
          30.verticalSpace,
          if (friendInfo.status == 2)
            Row(
              children: [
                Expanded(
                  child: AppButton.brandPrimaryButton(
                    height: 40.h,
                    LocaleKeys.text_0137.tr,
                    shape: CustomButtonShape.smallRadius,
                    style: AppTheme().appTextStyle.styleBrandPrimary.copyWith(
                        fontSize: 12.sp,
                        fontWeight: ThemeFontWeight.medium.weight),
                    () {
                      onRefuse.call();
                    },
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: AppButton.fillPrimaryButton(
                    height: 40.h,
                    LocaleKeys.text_0196.tr,
                    shape: CustomButtonShape.smallRadius,
                    style: AppTheme()
                        .appTextStyle
                        .styleTextDarkPrimary
                        .copyWith(
                            fontSize: 12.sp,
                            fontWeight: ThemeFontWeight.medium.weight),
                    () {
                      onApply.call();
                    },
                  ),
                )
              ],
            ).marginSymmetric(horizontal: 16.w),
          30.verticalSpace,
        ],
      ),
    );
  }
}
