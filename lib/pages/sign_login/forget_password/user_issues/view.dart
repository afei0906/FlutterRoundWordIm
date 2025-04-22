part of '../index.dart';

class UserIssuesPage extends StatelessWidget {
  UserIssuesPage({Key? key}) : super(key: key);

  final UserIssuesLogic logic = Get.put(UserIssuesLogic());
  final UserIssuesState state = Get.find<UserIssuesLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserIssuesLogic>(
      builder: (controller) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppTheme.colorTextDarkPrimary,
            appBar: appBar(),
            body: Column(
              children: [
                if (state.backIndex == 0) ...[
                  if (state.formType == 1) ...showPhone(),
                  if (state.formType == 2) ...showEmail()
                ],
                if (state.backIndex == 1)...showIssues()
              ],
            ));
      },
    );
  }

  List<Widget> showPhone() {
    List<Widget> list = [
      Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          child: Text(
            LocaleKeys.text_0119.tr,
            textAlign: TextAlign.center,
            style: AppTheme().appTextStyle.textStyleTernary,
          )),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppTheme.black.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12.r)),
        child: Column(
          children: [
            InkWell(
                onTap: logic.selectPhoneCountry,
                child: Container(
                  width: double.infinity,
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        state.countryCodeModel.name ?? '',
                        style: AppTheme().appTextStyle.textStyleTitleText,
                      ),
                      Icon(
                        Icons.chevron_right_outlined,
                        size: 24.w,
                        color: AppTheme.secondaryText,
                      )
                    ],
                  ),
                )),
            Container(
              width: double.infinity,
              height: 0.5,
              color: AppTheme.colorTextDarkPrimary,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                width: double.infinity,
                height: 0.5,
                color: AppTheme.loginLine,
              ),
            ),
            Container(
              width: double.infinity,
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    state.countryCodeModel.code ?? '',
                    style: AppTheme()
                        .appTextStyle
                        .textStyleTitleText
                        .copyWith(fontWeight: ThemeFontWeight.semiBold.weight),
                  ),
                  Expanded(
                    child: LoginInput(
                      key: const Key("login_phone"),
                      hintText: LocaleKeys.text_0016.tr,
                      controller: state.phoneController,
                      keyboardType: TextInputType.phone,
                      autofocus: true,
                      onChanged: logic.onChanged,
                      inputFormatters: const [
                        // FilteringTextInputFormatter.allow(RegExp("^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}\$"))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ).marginSymmetric(horizontal: 24.w),
      12.verticalSpace,
      AppButton.fillPrimaryButton(LocaleKeys.text_0065.tr, () {
        logic.toPhoneNext();
      }, isPress: state.phoneController.text.isNotEmpty)
          .marginSymmetric(horizontal: 24.w),
      12.verticalSpace,
      RichTextWidget(
        model: RichTextModel(
          text: LocaleKeys.text_0077.trParams({
            'text_0060': LocaleKeys.text_0060.tr,
          }),
          style: AppTheme().appTextStyle.textExtraLightStyleBlack,
          items: [
            RichTextItemModel(
              text: LocaleKeys.text_0060.tr,
              onTap: logic.contactService,
              style: AppTheme().appTextStyle.textExtraLightStylePrimary,
            ),
          ],
        ),
      ),
    ];
    return list;
  }

  List<Widget> showEmail() {
    List<Widget> list = [
      Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          child: Text(
            LocaleKeys.text_0064.tr,
            textAlign: TextAlign.center,
            style: AppTheme().appTextStyle.textStyleTernary,
          )),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppTheme.black.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12.r)),
        child: SizedBox(
          width: double.infinity,
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InputAccount(
                  decoration: const BoxDecoration(),
                  controller: state.emailFirstController,
                  hintText: LocaleKeys.text_0043.tr,
                  onChanged: logic.onChanged,
                  inputFormatters: [],
                ),
              ),
              Text(
                "@",
                style: AppTheme()
                    .appTextStyle
                    .textStyleTitleText
                    .copyWith(fontWeight: ThemeFontWeight.semiBold.weight),
              ),
              IntrinsicWidth(
                child: InputAccount(
                  textAlign: TextAlign.end,
                  decoration: const BoxDecoration(),
                  controller: state.emailLastController,
                  hintText: "gmail.com",
                  onChanged: logic.onChanged,
                  inputFormatters: [],
                  rightWidget: GestureDetector(
                    onTap: logic.selectCommonEmail,
                    child: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 24.w,
                      color: AppTheme.secondaryText,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ).marginSymmetric(horizontal: 24.w),
      12.verticalSpace,
      AppButton.fillPrimaryButton(LocaleKeys.text_0065.tr, () {
        logic.toEmailNext();
      }, isPress: state.emailFirstController.text.isNotEmpty)
          .marginSymmetric(horizontal: 24.w),
      12.verticalSpace,
      RichTextWidget(
        model: RichTextModel(
          text: LocaleKeys.text_0066.trParams({
            'text_0060': LocaleKeys.text_0060.tr,
          }),
          style: AppTheme().appTextStyle.textExtraLightStyleBlack,
          items: [
            RichTextItemModel(
              text: LocaleKeys.text_0060.tr,
              onTap: logic.contactService,
              style: AppTheme().appTextStyle.textExtraLightStylePrimary,
            ),
          ],
        ),
      ),
    ];
    return list;
  }

  List<Widget> showIssues() {
    List<Widget> list = [
      Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          child: Text(
            LocaleKeys.text_0114.trParams(
                {"number": Utils.numberToChinese(state.userIssuesList.length)}),
            textAlign: TextAlign.center,
            style: AppTheme().appTextStyle.textStyleTernary,
          )),
      Obx(() {
        return Expanded(
            child: state.userIssuesList.isNotEmpty
                ? ListView.builder(
                    itemCount: state.userIssuesList.length,
                    itemBuilder: (context, index) {
                      return itemWidget(index);
                    },
                    padding: EdgeInsets.zero,
                  )
                : SizedBox());
      }),
      25.verticalSpace,
      Obx(() {
        return AppButton.fillPrimaryButton(
            LocaleKeys.text_0065.tr, logic.submit,
            isPress: state.isSubmit.value);
      }).marginSymmetric(horizontal: 24.w),
      25.verticalSpace,
    ];
    return list;
  }

  Widget itemWidget(int index) {
    state.controllerMap[index] ??= TextEditingController();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(
              horizontal: 24.w,
            ),
            child: Text(
              "${index + 1}:${state.userIssuesList[index].qname}",
              textAlign: TextAlign.left,
              style: AppTheme()
                  .appTextStyle
                  .textStyleTitleText
                  .copyWith(fontSize: 15.sp),
            )),
        12.verticalSpace,
        InputAccount(
          controller: state.controllerMap[index]!,
          hintText: LocaleKeys.text_0050.tr,
          onChanged: logic.onQuestChanged,
        ).marginSymmetric(
          horizontal: 24.w,
        ),
        16.verticalSpace
      ],
    );
  }

  PreferredSizeWidget appBar() {
    return CusAppBar.floatLeading(Get.context!,
        title: LocaleKeys.text_0019.tr, onBack: logic.onBack);
  }
}
