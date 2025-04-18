part of '../../../index.dart';

class CreateGroupWidget extends StatelessWidget {
  CreateGroupLogic logic = Get.put(CreateGroupLogic());

  CreateGroupWidget();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: Get.height - 50,
        decoration: CustomBoxDecoration.topDecoration(color: AppTheme.bgColor2),
        child: Column(
          children: [
            ViewUtils.groupTopView(
                    title: LocaleKeys.text_0157.tr,
                    msg: "0/${logic.state.dataList.length}")
                .marginSymmetric(vertical: 12.h),
            CustomUtils.onSearchView(
              logic.state.searchController,
              LocaleKeys.text_0133.tr,
              onSubmitted: logic.onSubmitted,
              onChanged: logic.onSubmitted,
            ).marginSymmetric(horizontal: 16.w),
            12.verticalSpace,
            Expanded(
              child: FriendListPage(
                logic,
                logic.state,
              ),
            )
          ],
        ),
      );
    });
  }
}
