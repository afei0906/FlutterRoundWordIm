part of '../../index.dart';

class AddNewFriendPage extends StatelessWidget {
  AddNewFriendPage({Key? key}) : super(key: key);

  final AddNewFriendLogic logic = Get.put(AddNewFriendLogic());
  final AddNewFriendState state = Get.find<AddNewFriendLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgColor,
      appBar: appBar(),
      body: Obx(() {
        return ListView.builder(
          itemCount: logic.applyList.length,
          itemBuilder: (context, index) {
            return itemWidget(index);
          },
          padding: EdgeInsets.zero,
        );
      }),
    ).marginOnly(bottom: 12.w);
  }

  Widget itemWidget(int index) {
    final UserInfo userInfo = logic.applyList[index];

    return GestureDetector(
        onTap: () {
          // logic.toGroupDetail(groupInfo);
        },
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              decoration: CustomBoxDecoration.customDecoration(),
              child: Row(
                children: [
                  Container(
                    width: 42.w,
                    height: 42.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(42.r),
                        color: AppTheme.sliderColor.withOpacity(0.3)),
                    child: ThemeImageWidget(
                      url: userInfo.avatar.toString() ?? '',
                      error: Resource.assetsImagesUserAvatarDefualtPng,
                      width: 40.w,
                      height: 40.w,
                      radius: 40.r,
                    ),
                  ),
                  12.horizontalSpace,
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Utils.toEmpty(userInfo.name) ?? '',
                        style: AppTheme().appTextStyle.textStyleTitleText,
                      ),
                      8.verticalSpace,
                      Text(
                        LocaleKeys.text_0138.tr,
                        style: AppTheme()
                            .appTextStyle
                            .textStylePrimary
                            .copyWith(fontSize: 14.sp),
                      )
                    ],
                  ))
                ],
              ),
            ),
            Container(
              color: AppTheme.lineColor,
              height: 1,
              width: double.infinity,
            ).marginOnly(
              left: 16.w,
              right: 16.w,
            ),
          ],
        ));
  }

  PreferredSizeWidget appBar() {
    return CusAppBar.floatLeading(Get.context!,
        automaticallyImplyLeading: true,
        title: LocaleKeys.text_0131.tr,
        appBarColor: AppTheme.bgColor,
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
        ]);
  }
}
