part of '../../index.dart';

class FindListPage extends StatelessWidget {
  FindListPage({Key? key}) : super(key: key);

  final FindListLogic logic = Get.put(FindListLogic());
  final FindListState state = Get.find<FindListLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Scaffold(
          backgroundColor: AppTheme.bgColor2,
          appBar: appBar(),
          body: ListView(
            padding: EdgeInsets.zero,
            children: List.generate(state.dataList.length, (int index) {
              return _itemList(state.dataList[index]['name'] ?? '',
                      state.dataList[index]['icon'] ?? '', () {
                    Get.toNamed(Routes.webView, arguments: {
                      "title": state.dataList[index]['name'] ?? '',
                      "url": state.dataList[index]['url'] ?? ''
                    });
                  })
                  .marginOnly(left: 16.w, right: 16.w, top: 12.w);
            }),
          ).marginOnly(bottom: 12.w)),
    );
  }

  Widget _itemList(String name, String png, Function? callBack) {
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
            ),
            12.horizontalSpace,
            Text(
              name,
              style: AppTheme().appTextStyle.textExtraLightStyleBlack,
            ),
            const Spacer(),
            Icon(
              Icons.chevron_right_outlined,
              size: 24.w,
              color: AppTheme.secondaryText,
            )
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return CusAppBar.floatLeading(Get.context!,
        automaticallyImplyLeading: false,
        leadingWidth: 80.w,
        leftWidget: Text(
          LocaleKeys.text_0007.tr,
          style: AppTheme().appTextStyle.textStyleSecondary,
        ).marginOnly(left: 16.w),
        actions: [
          InkWell(
            onTap: logic.toMore,
            child: ThemeImageWidget(
              path: Resource.assetsSvgDefaultFindMoreSvg,
              width: 24.w,
              height: 24.w,
            ),
          ),
          16.horizontalSpace,
        ],
        appBarColor: AppTheme.bgColor2.withAlpha(0));
  }
}
