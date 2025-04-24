part of '../../index.dart';

class ContactListPage extends StatelessWidget {
  ContactListPage({Key? key}) : super(key: key);

  final ContactListLogic logic = ContactListLogic.to;
  final FriendListState state = Get
      .find<ContactListLogic>()
      .state;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppTheme.bgColor2,
        appBar: appBar(),
        body: FriendListPage(
          logic,
          state,
        ));
  }

  PreferredSizeWidget appBar() {
    return CusAppBar.floatLeading(Get.context!,
        automaticallyImplyLeading: false,
        leadingWidth: 80.w,
        leftWidget: Text(
          LocaleKeys.text_0006.tr,
          style: AppTheme().appTextStyle.textStyleSecondary,
        ).marginOnly(left: 16.w),
        actions: [
          InkWell(
            onTap: logic.toAdd,
            child: ThemeImageWidget(
              path: Resource.assetsSvgDefaultContactUserAddSvg,
              width: 24.w,
              height: 24.w,
            ),
          ),
          16.horizontalSpace,
        ],
        appBarColor: AppTheme.bgColor2,
        bottom: Column(
          children: [
            CustomUtils.onSearchView(
                state.searchController, LocaleKeys.text_0133.tr,
                onChanged: logic.onSubmitted,
                onSubmitted: logic.onSubmitted)
                .marginSymmetric(horizontal: 16.w),
            12.verticalSpace,
            Obx(() {
              return _topMune(
                  LocaleKeys.text_0131.tr,
                  Resource.assetsSvgDefaultChatUserAddSvg,
                  (logic.applyList.isNotEmpty
                      ? logic.applyList.length.toString()
                      : null),
                  logic.toNewFriends);
            })
                .marginSymmetric(horizontal: 16.w),
            12.verticalSpace,
            _topMune(
                LocaleKeys.text_0132.tr,
                Resource.assetsSvgDefaultChatGroupAddSvg,
                null,
                logic.toMyGroup)
                .marginSymmetric(horizontal: 16.w),
          ],
        ),
        bottomBarHeight: 185.h);
  }

  Widget _topMune(String name, String png, String? count, Function? callBack) {
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
            const Spacer(),
            if (!Utils.isEmpty(count))
              Container(
                width: 20.w,
                height: 20.w,
                alignment: Alignment.center,
                decoration: CustomBoxDecoration.customDecoration(
                  color: AppTheme.colorBrandError,
                  radius: 30.r,
                ),
                child: Text(
                  count ?? '',
                  style: AppTheme()
                      .appTextStyle
                      .styleTextDarkPrimary
                      .copyWith(fontSize: 13.sp),
                ),
              )
          ],
        ),
      ),
    );
  }
}
