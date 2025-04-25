part of '../../index.dart';

class AddNewFriendPage extends StatelessWidget {
  AddNewFriendPage({Key? key}) : super(key: key);

  final AddNewFriendLogic logic = Get.put(AddNewFriendLogic());
  final AddNewFriendState state = Get.find<AddNewFriendLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colorTextDarkPrimary,
      appBar: appBar(),
      body: Obx(() {
        return ListView.builder(
          itemCount: state.applyList.length,
          itemBuilder: (context, index) {
            return itemWidget(index);
          },
          padding: EdgeInsets.zero,
        );
      }),
    ).marginOnly(bottom: 12.w);
  }

  Widget itemWidget(int index) {
    final ApplyFriendInfo userInfo = state.applyList[index];

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
                  CustomUtils.avator(
                    userInfo.avatar.toString() ?? '',
                  ),
                  12.horizontalSpace,
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Utils.toEmpty(userInfo.nick) ?? '',
                        style: AppTheme().appTextStyle.textStyleTitleText,
                      ),
                      8.verticalSpace,
                      Text(
                        LocaleKeys.text_0138.tr,
                        style: AppTheme()
                            .appTextStyle
                            .styleBrandPrimary
                            .copyWith(fontSize: 14.sp),
                      )
                    ],
                  )),
                  8.horizontalSpace,

                  ///  // /
                  //     // * 通过
                  //     // */
                  //     // int PASS = 1;
                  //     //
                  //     // /
                  //     // * 申请中
                  //     // */
                  //     // int APPLY = 2;
                  //     //
                  //     // /**
                  //     //  * 无效：过期/拒绝
                  //     //  */
                  //     // int REJECT = 3;
                  if (userInfo.status == 2)
                    IntrinsicWidth(
                      child: AppButton.fillPrimaryButton(
                          height: 30.h,
                          LocaleKeys.text_0137.tr,
                          shape: CustomButtonShape.smallRadius,
                          style: AppTheme()
                              .appTextStyle
                              .styleBrandPrimary
                              .copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: ThemeFontWeight.medium.weight),
                          () {
                        logic.refuseFriend(userInfo);
                      }, isPress: false),
                    ),
                  8.horizontalSpace,
                  IntrinsicWidth(
                    child: AppButton.fillPrimaryButton(
                      height: 30.h,
                      LocaleKeys.text_0195.tr,
                      shape: CustomButtonShape.smallRadius,
                      style: AppTheme()
                          .appTextStyle
                          .styleTextDarkPrimary
                          .copyWith(
                              fontSize: 12.sp,
                              fontWeight: ThemeFontWeight.medium.weight),
                      () {
                        logic.lookFriend(userInfo);
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: AppTheme.colorBorderLight,
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
        appBarColor: AppTheme.colorTextDarkPrimary,
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
