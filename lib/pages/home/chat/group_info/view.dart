part of '../../index.dart';

class GroupInfoPage extends StatelessWidget {
  GroupInfoPage({Key? key}) : super(key: key);

  final GroupInfoLogic logic = Get.put(GroupInfoLogic());
  final GroupInfoState state = Get.find<GroupInfoLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colorFillPageGray,
      body: SingleChildScrollView(
        child: Obx(() {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomUtils.avator(
                state.groupInfo.value.avatar.toString() ?? '',
                width: 56.w,
                height: 56.w,
                error: Resource.assetsImagesGroupAvatarDefualtpng,
              ),
              12.verticalSpace,
              Text(
                '群名称',
                textAlign: TextAlign.center,
                style: AppTheme().appTextStyle.styleTextDefaultPrimary,
              ),
              Text(
                '5名成员',
                textAlign: TextAlign.center,
                style: AppTheme().appTextStyle.styleTextDefaultFourth,
              ),
              12.verticalSpace,
              Container(
                decoration: ShapeDecoration(
                  color: Colors.white /* color-fill-page-primary */,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.text_0205.tr,
                      style: AppTheme()
                          .appTextStyle
                          .styleTextDefaultPrimary
                          .copyWith(
                            fontSize: 14.sp,
                            fontWeight: ThemeFontWeight.regular.weight,
                          ),
                    ).marginSymmetric(horizontal: 16.w, vertical: 11.h),
                    Divider(
                      height: 0,
                      thickness: 0.5.w,
                      color: AppTheme.colorBorderLight,
                    ),
                    Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              logic.inviteGroupMembers();
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 28.w,
                                  height: 28.w,
                                  decoration: ShapeDecoration(
                                    color: AppTheme.colorBrandPrimary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(360),
                                    ),
                                  ),
                                  child: ThemeImageWidget(
                                    path: Resource
                                        .assetsSvgDefaultContactUserAddSvg,
                                    width: 16.w,
                                    height: 16.w,
                                    color: Colors.white,
                                  ),
                                ),
                                8.horizontalSpace,
                                Text(
                                  '邀请群成员',
                                  textAlign: TextAlign.center,
                                  style: AppTheme()
                                      .appTextStyle
                                      .textExtraLightStylePrimary
                                      .copyWith(fontSize: 14.sp),
                                ),
                              ],
                            ),
                          ),
                          8.verticalSpace,
                          Divider(
                            height: 0,
                            thickness: 0.5.w,
                            color: AppTheme.colorBorderLight,
                          ),
                          8.verticalSpace,
                          ...List.generate(
                            5,
                            (index) {
                              final isAdmin = index == 0;
                              final isCreator = index == 1;
                              final isLastItem = index == 4;
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      ThemeImageWidget(
                                        path: Resource
                                            .assetsImagesUserAvatarDefualtPng,
                                        width: 28.w,
                                        height: 28.w,
                                      ),
                                      8.horizontalSpace,
                                      Expanded(
                                        child: Text(
                                          '成员昵称',
                                          style: AppTheme()
                                              .appTextStyle
                                              .styleTextDefaultPrimary
                                              .copyWith(
                                                fontSize: 14.sp,
                                              ),
                                        ),
                                      ),
                                      if (isAdmin || isCreator)
                                        Text(
                                          isAdmin ? '管理员' : '创建者',
                                          style: AppTheme()
                                              .appTextStyle
                                              .styleTextDefaultFourth,
                                        ),
                                    ],
                                  ),
                                  if (!isLastItem) ...[
                                    8.verticalSpace,
                                    Divider(
                                      height: 0,
                                      thickness: 0.5.w,
                                      color: AppTheme.colorBorderLight,
                                    ),
                                    8.verticalSpace,
                                  ],
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              12.verticalSpace,
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white /* color-fill-page-primary */,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    logic.deleteChatRecord();
                  },
                  child: Text(
                    LocaleKeys.text_0206.tr,
                    style: AppTheme().appTextStyle.styleBrandError,
                  ),
                ),
              ),
              12.verticalSpace,
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white /* color-fill-page-primary */,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    logic.quitGroupChat();
                  },
                  child: Text(
                    LocaleKeys.text_0207.tr,
                    style: AppTheme().appTextStyle.styleBrandError,
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

  PreferredSizeWidget appBar() {
    return CusAppBar.floatLeading(
        appBarColor: Colors.transparent,
        Get.context!,
        title: LocaleKeys.text_0204.tr,
        leadingWidth: 80.w,
        actions: [
          Image.asset(Resource.assetsImagesGroupAvatarDefualtpng,
              width: 28.w, height: 28.w),
          16.horizontalSpace
        ]);
  }
}
