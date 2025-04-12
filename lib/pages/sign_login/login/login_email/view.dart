part of '../index.dart';

class LoginEmailPage extends StatelessWidget {
  LoginEmailPage({Key? key}) : super(key: key);

  final LoginEmailLogic logic = Get.put(LoginEmailLogic());
  final LoginEmailState state = Get.find<LoginEmailLogic>().state;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // 设置状态栏背景颜色
        statusBarIconBrightness: Brightness.dark, // 设置状态栏图标颜色
      ),
      child: GetBuilder<LoginEmailLogic>(
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
                                  autofocus: true,
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
                                      )),
                                ),
                              ),
                            ],
                          ),
                        )).marginSymmetric(horizontal: 24.w),
                    InputAccount(
                      controller: state.passwordController,
                      hintText: LocaleKeys.text_0017.tr,
                      shufflePassword: controller.shufflePassword,
                      inputType: InputEnum.password,
                      obscureText: state.obscureText,
                      onChanged: logic.onChanged,
                      inputFormatters: [
                        CustomizedTextInputFormatter(
                          pattern: RegExp("[a-zA-Z]|[0-9]"),
                        ),
                      ],
                    ).marginSymmetric(horizontal: 24.w, vertical: 12.h),
                    AppButton.fillPrimaryButton(
                            LocaleKeys.text_0018.tr, controller.toLoginEmail,
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
                    PhoneConfig.sign(controller.toLoginPhone),
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
        title: LocaleKeys.text_0023.tr, appBarColor: Colors.transparent);
  }
}
