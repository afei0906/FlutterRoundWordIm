part of '../../index.dart';

class ShopHomePage extends StatelessWidget {
  ShopHomePage({Key? key}) : super(key: key);

  final ShopHomeLogic logic = Get.put(ShopHomeLogic());
  final ShopHomeState state = Get.find<ShopHomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        alignment: Alignment.topCenter,
        image: AssetImage(Resource.assetsImagesShopBgPng),
      )),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: appBar(),
          body: Column(
            children: [
              // MediaQuery.of(context).viewInsets.bottom.verticalSpace,
            ],
          )),
    );
  }

  PreferredSizeWidget appBar() {
    return CusAppBar.floatLeading(
      Get.context!,
      automaticallyImplyLeading: false,
      leadingWidth: 80.w,
      leftWidget: Text(
        LocaleKeys.text_0096.tr,
        style: AppTheme().appTextStyle.textStyleSecondary,
      ).marginOnly(left: 16.w),
      actions: [
        InkWell(
          onTap: logic.toLocation,
          child: ThemeImageWidget(
            path: Resource.assetsSvgDefaultShopLocationSvg,
            width: 30.w,
            height: 30.w,
          ),
        ),
        16.horizontalSpace,
        InkWell(
          onTap: logic.toLocation,
          child: ThemeImageWidget(
            path: Resource.assetsSvgDefaultShopListSvg,
            width: 30.w,
            height: 30.w,
          ),
        ),
        16.horizontalSpace,
      ],
      appBarColor: AppTheme.colorTextDarkPrimary.withAlpha(0)
    );
  }
}
