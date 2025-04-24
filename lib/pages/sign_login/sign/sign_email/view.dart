part of '../index.dart';

class SignEmailPage extends StatelessWidget {
  SignEmailPage({Key? key}) : super(key: key);

  final SignEmailLogic logic = Get.put(SignEmailLogic());
  final SignEmailState state = Get
      .find<SignEmailLogic>()
      .state;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // 设置状态栏背景颜色
        statusBarIconBrightness: Brightness.dark, // 设置状态栏图标颜色
      ),
      child: GetBuilder<SignEmailLogic>(
        builder: (controller) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  alignment: Alignment.topCenter,
                  image: AssetImage(Resource.assetsImagesLoginBgPng),
                )),
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.transparent,
                appBar: appBar(),
                body: Column(
                  children: [
                    16.verticalSpace,
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
                                  .copyWith(
                                  fontWeight:
                                  ThemeFontWeight.semiBold.weight),
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
                                style: AppTheme()
                                    .appTextStyle
                                    .styleBrandPrimary
                                    .copyWith(
                                    fontWeight: ThemeFontWeight.medium.weight,
                                    fontSize: 12.sp),
                              ),
                            );
                          }),
                          8.horizontalSpace
                        ],
                      ),
                    ).marginSymmetric(horizontal: 24.w, vertical: 12.h),
                    InputAccount(
                      controller: state.passwordController,
                      hintText: LocaleKeys.text_0036.tr,
                      shufflePassword: controller.shufflePassword,
                      inputType: InputEnum.password,
                      isShowError: true,
                      obscureText: state.passwordObscureText,
                      onChanged: logic.onChanged,
                      inputFormatters: [
                        CustomizedTextInputFormatter(
                          pattern: RegExp("[a-zA-Z]|[0-9]"),
                        ),
                      ],
                    ).marginSymmetric(
                      horizontal: 24.w,
                    ),
                    InputAccount(
                      controller: state.prePasswordController,
                      confirmController: state.passwordController,
                      hintText: LocaleKeys.text_0037.tr,
                      shufflePassword: controller.shufflePrePassword,
                      inputType: InputEnum.confirmPassword,
                      isShowError: true,
                      obscureText: state.prePasswordObscureText,
                      onChanged: logic.onChanged,
                      inputFormatters: [
                        CustomizedTextInputFormatter(
                          pattern: RegExp("[a-zA-Z]|[0-9]"),
                        ),
                      ],
                    ).marginSymmetric(horizontal: 24.w, vertical: 12.h),
                    InputAccount(
                      controller: state.nickController,
                      hintText: LocaleKeys.text_0080.tr,
                      isShowError: true,
                      inputType: InputEnum.textType,
                      onChanged: logic.onChanged,
                    ).marginSymmetric(horizontal: 24.w),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: state.isChecked.value,
                            checkColor: AppTheme.checkColor,
                            // 勾✔️颜色
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                                    (states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return AppTheme.colorBrandPrimary; // 选中时的填充背景色
                                  }
                                  return Colors.transparent; // 未选中时背景
                                }),
                            side: const BorderSide(
                                color: AppTheme.checkColor, width: 2),
                            // 边框颜色 & 宽度
                            // 选中前的边框颜色
                            onChanged: (bool? value) {
                              logic.checkBox();
                              logic.onChanged();
                            },
                          ),
                          RichTextWidget(
                            model: RichTextModel(
                              text: LocaleKeys.text_0038.trParams({
                                'text_0003': LocaleKeys.text_0003.tr,
                                'text_0004': LocaleKeys.text_0004.tr,
                              }),
                              style: AppTheme()
                                  .appTextStyle
                                  .textExtraLightStyleBlack,
                              items: [
                                RichTextItemModel(
                                  text: LocaleKeys.text_0003.tr,
                                  onTap: logic.userAgreement,
                                  style: AppTheme()
                                      .appTextStyle
                                      .textExtraLightStylePrimary,
                                ),
                                RichTextItemModel(
                                  text: LocaleKeys.text_0004.tr,
                                  onTap: logic.privacyPolicy,
                                  style: AppTheme()
                                      .appTextStyle
                                      .textExtraLightStylePrimary,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    6.verticalSpace,
                    AppButton.fillPrimaryButton(
                        LocaleKeys.text_0039.tr, controller.toSign,
                        isPress: state.isLogin)
                        .marginSymmetric(horizontal: 24.w),
                    const Spacer(),
                    PhoneConfig.sign(controller.toSingPhone),
                    RichTextWidget(
                      model: RichTextModel(
                        text: LocaleKeys.text_0041.trParams({
                          'text_0018': LocaleKeys.text_0018.tr,
                        }),
                        style: AppTheme().appTextStyle.textExtraLightStyleBlack,
                        items: [
                          RichTextItemModel(
                            text: LocaleKeys.text_0018.tr,
                            onTap: logic.toLogin,
                            style: AppTheme()
                                .appTextStyle
                                .textExtraLightStylePrimary,
                          ),
                        ],
                      ),
                    ),
                    20.verticalSpace
                    // MediaQuery.of(context).viewInsets.bottom.verticalSpace,
                  ],
                )),
          );
        },
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return CusAppBar.leading(Get.context!,
        title: LocaleKeys.text_0033.tr, appBarColor: Colors.transparent);
  }
}
