part of '../../../index.dart';

class CreateGroupWidget extends StatelessWidget {
  CreateGroupLogic logic = CreateGroupLogic.to;

  CreateGroupWidget();

  @override
  Widget build(BuildContext context) {
    logic.state.searchController.clear();
    return Obx(() {
      return Container(
        height: Get.height - 50,
        decoration: CustomBoxDecoration.topDecoration(color: AppTheme.bgColor2),
        child: logic.isNext.isFalse ? _selectFriend() : _createGroup(),
      );
    });
  }

  Widget _selectFriend() {
    return Column(
      children: [
        ViewUtils.groupTopView(
                leftStr: LocaleKeys.text_0011.tr,
                title: LocaleKeys.text_0157.tr,
                rightStr: LocaleKeys.text_0065.tr,
                msg:
                    "${logic.selectList.length}/${logic.state.dataList.length}",
                onBack: logic.toNext)
            .marginSymmetric(vertical: 12.h),
        CustomUtils.onSearchView(
          logic.state.searchController,
          LocaleKeys.text_0133.tr,
          onSubmitted: logic.onSubmitted,
          onChanged: logic.onSubmitted,
        ).marginSymmetric(horizontal: 16.w),
        12.verticalSpace,
        Visibility(
            visible: logic.selectList.isNotEmpty,
            child: Container(
              decoration: CustomBoxDecoration.customDecoration(),
              width: double.infinity,
              height: 92.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: logic.selectList.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final contact = logic.selectList[index];
                  return _itemWidget(contact, index).marginOnly(
                      left: 12.w,
                      right: index == logic.selectList.length - 1 ? 12.w : 0);
                },
              ),
            ).marginSymmetric(horizontal: 16.w)),
        Expanded(
          child: FriendListPage(
            logic,
            logic.state,
            formType: "CreteGroup",
            callBack: logic.selectUser,
            selectList: logic.selectList,
          ),
        )
      ],
    );
  }

  Widget _createGroup() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ViewUtils.groupTopView(
                onLeftBack: logic.toPre,
                leftStr: LocaleKeys.text_0180.tr,
                title: LocaleKeys.text_0181.tr,
                rightStr: LocaleKeys.text_0101.tr,
                onBack: logic.toNext)
            .marginSymmetric(vertical: 12.h),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppTheme.black.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12.r)),
          child: SizedBox(
            width: double.infinity,
            height: 43.h,
            child: InputAccount(
              decoration: const BoxDecoration(),
              controller: logic.createGroupController,
              hintText: LocaleKeys.text_0182.tr,
              autofocus: true,
              isShowClear: true,
              onSubmitted: () {},
            ),
          ),
        ).marginSymmetric(horizontal: 16.w),
        Text(
          LocaleKeys.text_0159
              .trParams({"number": logic.selectList.length.toString()}),
          style: AppTheme()
              .appTextStyle
              .textStyleHintText
              .copyWith(fontSize: 14.sp),
        ).marginSymmetric(vertical: 12.h, horizontal: 16.w),
        Expanded(
            child: Container(
          decoration: CustomBoxDecoration.customDecoration(),
          child: GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 10,
                childAspectRatio: 56 / 90),
            itemCount: logic.selectList.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext ctx, i) {
              return _itemWidget(logic.selectList[i], i);
            },
          ),
        ).marginAll(16.w))
      ],
    );
  }

  Widget _itemWidget(FriendInfo contact, int index) {
    return Container(
      height: 92.h,
      alignment: Alignment.center,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Stack(
          children: [
            CustomUtils.avator(contact.avatar.toString() ?? '',width: 56.w,height: 56.w),


            Positioned(
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    logic.reMove(contact);
                  },
                  child: ThemeImageWidget(
                    path: Resource.assetsSvgDefaultGroupCloseSvg,
                    width: 20.w,
                    height: 20.w,
                  ),
                ))
          ],
        ),
        Text(
          contact.getNick(),
          style: AppTheme().appTextStyle.textExtraLightStyleBlack.copyWith(
                fontSize: 14.sp,
                fontWeight: ThemeFontWeight.medium.weight,
              ),
        ),
      ]),
    );
  }
}
