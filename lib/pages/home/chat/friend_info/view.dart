part of '../../index.dart';

class FriendInfoPage extends StatelessWidget {
  FriendInfoPage({Key? key}) : super(key: key);

  final FriendInfoLogic logic = Get.put(FriendInfoLogic());
  final FriendInfoState state = Get.find<FriendInfoLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colorFillPageGray,
      body: SingleChildScrollView(
        child: Obx(() {
          return Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              CustomUtils.avator(
                state.userInfo.value.avatar.toString() ?? '',
                width: 56.w,
                height: 56.w,
                error: Resource.assetsImagesGroupAvatarDefualtpng,
              ),
              Text(state.userInfo.value.getNick(),
                  textAlign: TextAlign.center,
                  style: AppTheme().appTextStyle.styleTextDefaultPrimary),
              if (!Utils.isEmpty(state.userInfo.value.showId))
                Text(Utils.toEmpty(state.userInfo.value.showId) ?? '',
                    textAlign: TextAlign.center,
                    style: AppTheme().appTextStyle.styleTextDefaultFourth),
              if (!Utils.isEmpty(state.userInfo.value.loginName))
                Text(
                  Utils.toEmpty(state.userInfo.value.loginName) ?? '',
                  textAlign: TextAlign.center,
                  style: AppTheme().appTextStyle.styleTextDefaultFourth,
                ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: logic.toPhone,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: AppTheme
                                .colorTextDarkPrimary /* color-fill-page-primary */,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ThemeImageWidget(
                                width: 24.w,
                                height: 24.w,
                                path: Resource.assetsSvgDefaultFriendPhoneSvg,
                              ),
                              6.verticalSpace,
                              Text(
                                LocaleKeys.text_0154.tr,
                                textAlign: TextAlign.center,
                                style: AppTheme()
                                    .appTextStyle
                                    .styleTextDefaultPrimary
                                    .copyWith(
                                        fontWeight:
                                            ThemeFontWeight.medium.weight,
                                        fontSize: 14.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: logic.toVideo,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: AppTheme
                                .colorTextDarkPrimary /* color-fill-page-primary */,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 24.w,
                                height: 24.w,
                                child: ThemeImageWidget(
                                  width: 18.w,
                                  height: 18.w,
                                  path: Resource.assetsSvgDefaultFriendVideoSvg,
                                ).marginSymmetric(vertical: 2.w),
                              ),
                              6.verticalSpace,
                              Text(
                                LocaleKeys.text_0193.tr,
                                textAlign: TextAlign.center,
                                style: AppTheme()
                                    .appTextStyle
                                    .styleTextDefaultPrimary
                                    .copyWith(
                                        fontWeight:
                                            ThemeFontWeight.medium.weight,
                                        fontSize: 14.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: logic.toText,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: AppTheme
                                .colorTextDarkPrimary /* color-fill-page-primary */,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ThemeImageWidget(
                                width: 24.w,
                                height: 24.w,
                                path: Resource.assetsSvgDefaultFriendTextSvg,
                              ),
                              6.verticalSpace,
                              Text(
                                LocaleKeys.text_0095.tr,
                                textAlign: TextAlign.center,
                                style: AppTheme()
                                    .appTextStyle
                                    .styleTextDefaultPrimary
                                    .copyWith(
                                        fontWeight:
                                            ThemeFontWeight.medium.weight,
                                        fontSize: 14.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // _channelWidget(),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                clipBehavior: Clip.antiAlias,
                decoration: CustomBoxDecoration.customDecoration(radius: 16.r),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: logic.remark,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: Text(
                          LocaleKeys.text_0240.tr,
                          style: AppTheme()
                              .appTextStyle
                              .styleTextDefaultPrimary
                              .copyWith(
                            fontSize: 14.sp,
                            fontWeight: ThemeFontWeight.regular.weight,
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 0.5,
                      color: AppTheme.colorBorderLight,
                    ),
                    GestureDetector(
                      onTap: logic.shareCard,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: Text(
                          LocaleKeys.text_0224.tr,
                          style: AppTheme()
                              .appTextStyle
                              .styleTextDefaultPrimary
                              .copyWith(
                                fontSize: 14.sp,
                                fontWeight: ThemeFontWeight.regular.weight,
                              ),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 0.5,
                      color: AppTheme.colorBorderLight,
                    ),
                    GestureDetector(
                      onTap: logic.inviteGroup,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: Text(
                          LocaleKeys.text_0225.tr,
                          style: AppTheme()
                              .appTextStyle
                              .styleTextDefaultPrimary
                              .copyWith(
                                fontSize: 14.sp,
                                fontWeight: ThemeFontWeight.regular.weight,
                              ),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 0.5,
                      color: AppTheme.colorBorderLight,
                    ),
                    GestureDetector(
                      onTap: logic.clearData,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: Text(
                          LocaleKeys.text_0206.tr,
                          style:
                              AppTheme().appTextStyle.styleBrandError.copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: ThemeFontWeight.regular.weight,
                                  ),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 0.5,
                      color: AppTheme.colorBorderLight,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: logic.deleteUser,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white /* color-fill-page-primary */,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 12,
                      children: [
                        ThemeImageWidget(
                          width: 24.w,
                          height: 24.w,
                          path: Resource.assetsSvgDefaultFriendDelSvg,
                        ),
                        Text(
                          LocaleKeys.text_0151.tr,
                          style: AppTheme().appTextStyle.styleBrandError,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }).marginSymmetric(horizontal: 16.w),
      ),
      appBar: appBar(),
    );
  }

//他的频道
  Widget _channelWidget() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white /* color-fill-page-primary */,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 11),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                SizedBox(
                  width: 311,
                  child: Text(
                    '他的频道',
                    style: TextStyle(
                      color: const Color(
                          0xFF202329) /* color-text-default-primary */,
                      fontSize: 14,
                      fontFamily: 'PingFang SC',
                      fontWeight: FontWeight.w400,
                      height: 1.57,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 0.50,
                  color: const Color(0xFFE5E5E5) /* color-border-light */,
                ),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 8,
              children: [
                Container(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.50, -0.00),
                            end: Alignment(0.50, 1.00),
                            colors: [
                              const Color(0xFFBCD6FF),
                              const Color(0xFF83ABE9)
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 10,
                              top: 10,
                              child: Container(
                                width: 20,
                                height: 20,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: Stack(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 231,
                        child: Text(
                          '频道名称',
                          style: TextStyle(
                            color: const Color(
                                0xFF202329) /* color-text-default-primary */,
                            fontSize: 14,
                            fontFamily: 'PingFang SC',
                            fontWeight: FontWeight.w500,
                            height: 1.57,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 231,
                        child: Text(
                          '20人订阅',
                          style: TextStyle(
                            color: const Color(
                                0xFF868A8F) /* color-text-default-fourth */,
                            fontSize: 12,
                            fontFamily: 'PingFang SC',
                            fontWeight: FontWeight.w400,
                            height: 1.50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 0.50,
                  color: const Color(0xFFE5E5E5) /* color-border-light */,
                ),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 8,
              children: [
                Container(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.50, -0.00),
                            end: Alignment(0.50, 1.00),
                            colors: [
                              const Color(0xFFBCD6FF),
                              const Color(0xFF83ABE9)
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 10,
                              top: 10,
                              child: Container(
                                width: 20,
                                height: 20,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: Stack(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 231,
                        child: Text(
                          '频道名称',
                          style: TextStyle(
                            color: const Color(
                                0xFF202329) /* color-text-default-primary */,
                            fontSize: 14,
                            fontFamily: 'PingFang SC',
                            fontWeight: FontWeight.w500,
                            height: 1.57,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 231,
                        child: Text(
                          '20人订阅',
                          style: TextStyle(
                            color: const Color(
                                0xFF868A8F) /* color-text-default-fourth */,
                            fontSize: 12,
                            fontFamily: 'PingFang SC',
                            fontWeight: FontWeight.w400,
                            height: 1.50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 0.50,
                  color: const Color(0xFFE5E5E5) /* color-border-light */,
                ),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 8,
              children: [
                Container(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.50, -0.00),
                            end: Alignment(0.50, 1.00),
                            colors: [
                              const Color(0xFFBCD6FF),
                              const Color(0xFF83ABE9)
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 10,
                              top: 10,
                              child: Container(
                                width: 20,
                                height: 20,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: Stack(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 231,
                        child: Text(
                          '频道名称',
                          style: TextStyle(
                            color: const Color(
                                0xFF202329) /* color-text-default-primary */,
                            fontSize: 14,
                            fontFamily: 'PingFang SC',
                            fontWeight: FontWeight.w500,
                            height: 1.57,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 231,
                        child: Text(
                          '20人订阅',
                          style: TextStyle(
                            color: const Color(
                                0xFF868A8F) /* color-text-default-fourth */,
                            fontSize: 12,
                            fontFamily: 'PingFang SC',
                            fontWeight: FontWeight.w400,
                            height: 1.50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 0.50,
                  color: const Color(0xFFE5E5E5) /* color-border-light */,
                ),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 8,
              children: [
                Container(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.50, -0.00),
                            end: Alignment(0.50, 1.00),
                            colors: [
                              const Color(0xFFBCD6FF),
                              const Color(0xFF83ABE9)
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 10,
                              top: 10,
                              child: Container(
                                width: 20,
                                height: 20,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: Stack(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 231,
                        child: Text(
                          '频道名称',
                          style: TextStyle(
                            color: const Color(
                                0xFF202329) /* color-text-default-primary */,
                            fontSize: 14,
                            fontFamily: 'PingFang SC',
                            fontWeight: FontWeight.w500,
                            height: 1.57,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 231,
                        child: Text(
                          '20人订阅',
                          style: TextStyle(
                            color: const Color(
                                0xFF868A8F) /* color-text-default-fourth */,
                            fontSize: 12,
                            fontFamily: 'PingFang SC',
                            fontWeight: FontWeight.w400,
                            height: 1.50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return CusAppBar.floatLeading(
      appBarColor: Colors.transparent,
      Get.context!,
      title: LocaleKeys.text_0204.tr,
      leadingWidth: 80.w,
    );
  }
}
