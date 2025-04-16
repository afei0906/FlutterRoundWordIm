part of '../../index.dart';

class MeCenterPage extends StatelessWidget {
  MeCenterPage({Key? key}) : super(key: key);

  final MeCenterLogic logic = Get.put(MeCenterLogic());
  final MeCenterState state = Get.find<MeCenterLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        alignment: Alignment.topCenter,
        image: AssetImage(Resource.assetsImagesMeBgPng),
      )),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                70.verticalSpace,
                _userInfo(),
                12.verticalSpace,
                _shareWidget(),
                ..._itemWidget()
              ],
            ).marginOnly(bottom: 12.w),
          )),
    );
  }

  Widget _userInfo() {
    return Row(
      children: [
        Container(
          width: 67.w,
          height: 67.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(64.r),
              color: AppTheme.bgColor.withOpacity(0.3)),
          child: ThemeImageWidget(
            url: UserStore.to.userInfo.value.avatar.toString(),
            placeholder: Resource.assetsImagesUserAvatarDefualtPng,
            width: 64.w,
            height: 64.w,
            radius: 64.r,
          ),
        ),
        12.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              UserStore.to.userInfo.value.nick.toString(),
              style: AppTheme().appTextStyle.textStyleSecondary,
            ),
            Row(
              children: [
                Text(
                  Utils.toEmpty(UserStore.to.userInfo.value.showId) ?? '',
                  style: AppTheme().appTextStyle.textStyleTernary,
                ),
                12.horizontalSpace,
                GestureDetector(
                  onTap: () {
                    logic.copy(
                        Utils.toEmpty(UserStore.to.userInfo.value.showId) ??
                            '');
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ThemeImageWidget(
                        path: Resource.assetsSvgDefaultCopySvg,
                        width: 16.w,
                        height: 16.w,
                      ),
                      2.horizontalSpace,
                      Text(
                        LocaleKeys.text_0123.tr,
                        style: AppTheme().appTextStyle.textStyleTernary,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            logic.copy(
                Utils.toEmpty(UserStore.to.userInfo.value.loginName) ?? '');
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ThemeImageWidget(
                path: Resource.assetsSvgDefaultSignInSvg,
                width: 20.w,
                height: 20.w,
              ),
              2.horizontalSpace,
              Text(
                LocaleKeys.text_0164.tr,
                style:
                    AppTheme().appTextStyle.textExtraLightStylePrimary.copyWith(
                          fontSize: 14.sp,
                          fontWeight: ThemeFontWeight.regular.weight,
                        ),
              ),
            ],
          ),
        ),
      ],
    ).marginSymmetric(horizontal: 16.w);
  }

  Widget _shareWidget() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          gradient: const LinearGradient(
            colors: [AppTheme.primary, AppTheme.primary2],
          )),
      child: Row(
        children: [
          ThemeImageWidget(
            path: Resource.assetsImagesMeShareLeftPng,
            height: 46.w,
            width: 46.w,
          ),
          12.horizontalSpace,
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LocaleKeys.text_0165.tr,
                  style: AppTheme().appTextStyle.textStyleBgColor),
              6.verticalSpace,
              Text(LocaleKeys.text_0166.tr,
                  style: AppTheme().appTextStyle.textStyleBgColor.copyWith(
                        fontSize: 12.sp,
                        fontWeight: ThemeFontWeight.regular.weight,
                      ))
            ],
          )),
          ThemeImageWidget(
            path: Resource.assetsSvgDefaultMeShareRightSvg,
            height: 24.w,
            width: 24.w,
          ),
        ],
      ).marginSymmetric(horizontal: 16.w, vertical: 16.h),
    ).marginSymmetric(horizontal: 16.w);
  }

  List<Widget> _itemWidget() {
    List<Widget> list = [];
    state.itemList.forEach((action) {
      list.add(GestureDetector(
        onTap: () {
          action.callBack?.call();
        },
        child: Column(
          children: [
            Container(
              height: 50.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: action.isTopRoudis
                        ? Radius.circular(12.r)
                        : Radius.zero,
                    bottom: action.isBotRoudis
                        ? Radius.circular(12.r)
                        : Radius.zero,
                  ),
                  color: AppTheme.bgColor),
              child: Row(
                children: [
                  ThemeImageWidget(
                    path: action.icon,
                    width: 20.w,
                    height: 20.w,
                  ),
                  12.horizontalSpace,
                  Text(
                    (action.title ?? '').tr,
                    style: AppTheme()
                        .appTextStyle
                        .textExtraLightStyleBlack
                        .copyWith(
                          fontSize: 16.sp,
                          fontWeight: ThemeFontWeight.regular.weight,
                        ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.chevron_right_outlined,
                    size: 24.w,
                    color: AppTheme.secondaryText,
                  )
                ],
              ),
            ).marginOnly(
              left: 16.w,
              right: 16.w,
              top: action.isTopRoudis ? 12.h : 0,
            ),
            if (!action.isBotRoudis)
              Container(
                color: AppTheme.bgColor,
                width: double.infinity,
                child: Container(
                  color: AppTheme.lineColor,
                  height: 1,
                  width: double.infinity,
                ).marginOnly(
                  left: 48.w,
                  right: 16.w,
                ),
              ),
          ],
        ),
      ));
    });
    return list;
  }
}
