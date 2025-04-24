part of '../../index.dart';

class GroupListPage extends StatelessWidget {
  GroupListPage({Key? key}) : super(key: key);

  final GroupListLogic logic = Get.put(GroupListLogic());
  final GroupListState state = Get.find<GroupListLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colorTextDarkPrimary,
      appBar: appBar(),
      body: Obx(() {
        return ListView.builder(
          itemCount: state.dataList.isEmpty ? 0 : state.dataList.length + 1,
          itemBuilder: (context, index) {
            return itemWidget(index);
          },
          padding: EdgeInsets.zero,
        );
      }),
    ).marginOnly(bottom: 12.w);
  }

  Widget itemWidget(int index) {
    if (index == state.dataList.length) {
      return Container(
        width: Get.width,
        alignment: Alignment.center,
        height: 74.h,
        child: Text(
          "- ${LocaleKeys.text_0176.trParams({
                "number": "${state.dataList.length}"
              })} -",
          style: AppTheme().appTextStyle.textStyleCheck,
        ),
      );
    }
    final GroupInfo groupInfo = state.dataList[index];

    bool isGroup = groupInfo.groupRole.toString() == '1';
    return GestureDetector(
        onTap: () {
          logic.toGroupDetail(groupInfo);
        },
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              decoration: CustomBoxDecoration.customDecoration(),
              child: Row(
                children: [
                  CustomUtils.avator(
                    groupInfo.avatar.toString() ?? '',
                    width: 48.w,
                    height: 48.w,
                    type: 2,
                    error: Resource.assetsImagesGroupAvatarDefualtpng,
                  ),
                  12.horizontalSpace,
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Utils.toEmpty(groupInfo.name) ?? '',
                        style: AppTheme().appTextStyle.textStyleTitleText,
                      ),
                      8.verticalSpace,
                      Row(
                        children: [
                          Container(
                            decoration: CustomBoxDecoration.customDecoration(
                                color: isGroup
                                    ? AppTheme.colorBrandPrimary
                                        .withOpacity(0.15)
                                    : AppTheme.bgColor2,
                                radius: 8),
                            child: Text(
                              isGroup
                                  ? LocaleKeys.text_0141.tr
                                  : LocaleKeys.text_0144.tr,
                              style: isGroup
                                  ? AppTheme()
                                      .appTextStyle
                                      .styleBrandPrimary
                                      .copyWith(fontSize: 14.sp)
                                  : AppTheme()
                                      .appTextStyle
                                      .textStyleHintText
                                      .copyWith(fontSize: 14.sp),
                            ).marginSymmetric(vertical: 3, horizontal: 4),
                          ),
                          8.horizontalSpace,
                          Text(
                            LocaleKeys.text_0142.trParams({
                              "number": Utils.toEmpty(groupInfo.joinNum) ?? ''
                            }),
                            style: AppTheme()
                                .appTextStyle
                                .textStyleHintText
                                .copyWith(fontSize: 14.sp),
                          )
                        ],
                      )
                    ],
                  ))
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
        title: LocaleKeys.text_0100.tr,
        appBarColor: AppTheme.colorTextDarkPrimary,
        bottom: Column(
          children: [
            CustomUtils.onSearchView(
                    state.searchController, LocaleKeys.text_0134.tr,
                    onChanged: logic.onChanged, onSubmitted: logic.onSubmitted)
                .marginSymmetric(horizontal: 16.w),
            12.verticalSpace,
          ],
        ),
        bottomBarHeight: 65.h);
  }
}
