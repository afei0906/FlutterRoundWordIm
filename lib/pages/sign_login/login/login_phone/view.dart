part of '../index.dart';

class LoginPhonePage extends StatelessWidget {
  LoginPhonePage({Key? key}) : super(key: key);

  final LoginPhoneLogic logic = Get.put(LoginPhoneLogic());
  final LoginPhoneState state = Get.find<LoginPhoneLogic>().state;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // 设置状态栏背景颜色
        statusBarIconBrightness: Brightness.dark, // 设置状态栏图标颜色
      ),
      child: GetBuilder<LoginPhoneLogic>(
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
                      child: Column(
                        children: [
                          InkWell(
                            onTap: controller.selectPhoneCountry,
                            child: Container(
                              width: double.infinity,
                              color: Colors.transparent,
                              height: 48,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    state.countryCodeModel.name ?? '',
                                    style: AppTheme()
                                        .appTextStyle
                                        .textStyleTitleText,
                                  ),
                                  Icon(
                                    Icons.chevron_right_outlined,
                                    size: 24.w,
                                    color: AppTheme.secondaryText,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 0.5,
                            color: AppTheme.colorTextDarkPrimary,
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 12),
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
                                      .copyWith(
                                          fontWeight:
                                              ThemeFontWeight.semiBold.weight),
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
                    InputAccount(
                      controller: state.passwordController,
                      hintText: LocaleKeys.text_0017.tr,
                      shufflePassword: controller.shufflePassword,
                      inputType: InputEnum.password,
                      obscureText: state.obscureText,
                      isShowError: true,
                      onChanged: logic.onChanged,
                      inputFormatters: [
                        CustomizedTextInputFormatter(
                          pattern: RegExp("[a-zA-Z]|[0-9]"),
                        ),
                      ],
                    ).marginSymmetric(horizontal: 24.w, vertical: 12.h),
                    AppButton.fillPrimaryButton(
                            LocaleKeys.text_0018.tr, controller.toLoginPhone,
                            isPress: state.isLogin)
                        .marginSymmetric(horizontal: 24.w),
                    InkWell(
                      onTap: logic.forgetPassword,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 12.h, horizontal: 20.w),
                        child: Text(
                          LocaleKeys.text_0019.tr,
                          style: AppTheme()
                              .appTextStyle
                              .textExtraLightStylePrimary,
                        ),
                      ),
                    ),
                    const Spacer(),
                    EmailConfig.login(controller.toLoginEmail),
                    SignConfig.loginCreateUser(controller.createAccount),
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
        title: LocaleKeys.text_0015.tr, appBarColor: Colors.transparent);
  }
}
