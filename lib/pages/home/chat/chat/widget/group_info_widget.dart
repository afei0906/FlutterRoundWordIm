part of '../../../index.dart';

class GroupInfoWidget extends StatelessWidget {
  GroupInfo? groupInfo;
  Function callBack;

  GroupInfoWidget(this.groupInfo, this.callBack);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
            decoration: ShapeDecoration(
              color: AppTheme.colorBlueDark,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(360),
              ),
            ),
            child: Text(
              Date.parseISOTime(Utils.toEmpty(groupInfo?.createTime) ?? '') ??
                  '',
              style: AppTheme().appTextStyle.styleTextDarkPrimary.copyWith(
                  fontSize: 12.sp, fontWeight: ThemeFontWeight.regular.weight),
            )),
        8.verticalSpace,
        Container(
          width: 235,
          padding: const EdgeInsets.all(16),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white.withValues(alpha: 128),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Column(
            children: [
              CustomUtils.avator(
                  width: 56.w,
                  height: 56.w,
                  Utils.toEmpty(groupInfo?.avatar) ?? '',
                  type: 2),
              8.verticalSpace,
              Text(
                LocaleKeys.text_0160.tr,
                textAlign: TextAlign.center,
                style: AppTheme().appTextStyle.styleTextDefaultSecondary,
              ),
              12.verticalSpace,
              Text(
                LocaleKeys.text_0159.trParams(
                    {"number": Utils.toEmpty(groupInfo?.joinNum) ?? ''}),
                textAlign: TextAlign.center,
                style: AppTheme()
                    .appTextStyle
                    .styleTextDefaultSecondary
                    .copyWith(
                        fontSize: 12,
                        fontWeight: ThemeFontWeight.regular.weight),
              ),
              12.verticalSpace,
              AppButton.brandPrimaryButton(LocaleKeys.text_0161.tr, () {
                callBack.call(0,groupInfo);
              },
                  height: 40.h,
                  style: AppTheme().appTextStyle.styleBrandPrimary.copyWith(
                      fontWeight: ThemeFontWeight.medium.weight,
                      fontSize: 12.sp)),
              12.verticalSpace,
              AppButton.brandPrimaryButton(LocaleKeys.text_0162.tr, () {
                callBack.call(1,groupInfo);
              },
                  height: 40.h,
                  style: AppTheme().appTextStyle.styleBrandPrimary.copyWith(
                      fontWeight: ThemeFontWeight.medium.weight,
                      fontSize: 12.sp))
            ],
          ),
        )
      ],
    );
  }
}
