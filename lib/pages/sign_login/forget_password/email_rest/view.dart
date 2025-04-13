part of '../index.dart';

class EmailRestPage extends StatelessWidget {
  EmailRestPage({Key? key}) : super(key: key);

  final EmailRestLogic logic = Get.put(EmailRestLogic());
  final EmailRestState state = Get.find<EmailRestLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmailRestLogic>(
      builder: (controller) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppTheme.bgColor,
            appBar: appBar(),
            body: Column(
              children: [
                if (state.backIndex == 0) ..._resetView(),
                if (state.backIndex == 1) ..._getCode()
              ],
            ));
      },
    );
  }

  List<Widget> _resetView() {
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
      AppButton.fillPrimaryButton(LocaleKeys.text_0065.tr, logic.toNext,
              isPress: state.emailFirstController.text.isNotEmpty)
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

  List<Widget> _getCode() {
    List<Widget> list = [
      Center(
        child: ThemeImageWidget(
          path: Resource.assetsSvgDefaultPasswordProtectSvg,
          width: 120.w,
          height: 120.w,
        ).marginSymmetric(vertical: 12.h),
      ),
      Text(
        LocaleKeys.text_0067.trParams({"email": logic.getEmail()}),
        style: AppTheme().appTextStyle.textStyleTernary,
      ).marginSymmetric(horizontal: 24.w, vertical: 12.h),
      10.verticalSpace,
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppTheme.black.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12.r)),
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InputAccount(
                decoration: const BoxDecoration(),
                controller: state.codeController,
                hintText: LocaleKeys.text_0035.tr,
                inputType: InputEnum.password,
                onChanged: logic.onChanged,
                inputFormatters: [],
              ),
            ),
            Obx(() {
              return InkWell(
                onTap: logic.getCode,
                child: Text(
                  state.buttonText.value,
                  style: AppTheme().appTextStyle.textStylePrimary.copyWith(
                      fontWeight: ThemeFontWeight.medium.weight,
                      fontSize: 12.sp),
                ),
              );
            }),
            8.horizontalSpace
          ],
        ),
      ).marginSymmetric(
        horizontal: 24.w,
      ),
      12.verticalSpace,
      AppButton.fillPrimaryButton(LocaleKeys.text_0065.tr, logic.toNext,
              isPress: state.codeController.text.isNotEmpty)
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

  PreferredSizeWidget appBar() {
    return CusAppBar.floatLeading(Get.context!,
        title: LocaleKeys.text_0019.tr, onBack: logic.onBack);
  }
}
