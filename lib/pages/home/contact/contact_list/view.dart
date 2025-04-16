part of '../../index.dart';

class ContactListPage extends StatelessWidget {
  ContactListPage({Key? key}) : super(key: key);

  final ContactListLogic logic = Get.put(ContactListLogic());
  final ContactListState state = Get.find<ContactListLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppTheme.bgColor2,
        appBar: appBar(),
        body: AzListView(
          data: state.userList,
          itemCount: state.userList.length,
          itemScrollController: state.scroll,
          itemBuilder: (BuildContext itemContext, int index) {
            return _itemWidget(context, index);
          },
          indexBarOptions: IndexBarOptions(
              textStyle: AppTheme()
                  .appTextStyle
                  .textExtraLightStylePrimary
                  .copyWith(fontWeight: ThemeFontWeight.semiBold.weight)),
          padding: EdgeInsets.zero,
          indexBarData: SuspensionUtil.getTagIndexList(state.userList),
          susItemBuilder: (BuildContext context, int index) {
            return susItem(state.userList[index].getSuspensionTag());
          },
        ));
  }

  Widget _itemWidget(BuildContext itemContext, int index) {
    return Container();
  }

  Widget susItem(String tag) {
    return Container(
      width: double.infinity,
      height: 24.h,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      // decoration: const BoxDecoration(
      //   color: AppTheme.cFFFFFFFF,
      //   border: Border(bottom: BorderSide(color: AppTheme.cFFF2EFEF)),
      // ),
      child: Text(
        tag,
        textAlign: TextAlign.left,
        style: AppTheme().appTextStyle.textStyleTernary.copyWith(
              fontSize: 12.sp,
              fontWeight: ThemeFontWeight.medium.weight,
            ),
      ),
    );
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
                    onChanged: logic.onChanged, onSubmitted: logic.onSubmitted)
                .marginSymmetric(horizontal: 16.w),
            12.verticalSpace,
            _topMune(LocaleKeys.text_0131.tr,
                    Resource.assetsSvgDefaultChatUserAddSvg, "2",logic.toNewFriends)
                .marginSymmetric(horizontal: 16.w),
            12.verticalSpace,
            _topMune(LocaleKeys.text_0132.tr,
                    Resource.assetsSvgDefaultChatGroupAddSvg, null,logic.toMyGroup)
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
              color: AppTheme.primary,
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
                  color: AppTheme.error,
                  radius: 30.r,
                ),
                child: Text(
                  count ?? '',
                  style: AppTheme()
                      .appTextStyle
                      .textStyleBgColor
                      .copyWith(fontSize: 13.sp),
                ),
              )
          ],
        ),
      ),
    );
  }
}
