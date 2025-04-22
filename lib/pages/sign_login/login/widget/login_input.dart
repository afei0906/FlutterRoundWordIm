part of '../index.dart';

class LoginInput extends StatelessWidget {
  final String? leftTitle;
  final String? hintText;
  final Widget? rightWidget;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Function()? onClick;
  final bool autofocus;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onSubmitted;
  final Function()? onChanged;

  const LoginInput(
      {super.key,
      this.leftTitle,
      this.rightWidget,
      this.hintText,
      this.controller,
      this.keyboardType,
      this.obscureText = false,
      this.autofocus = false,
      this.inputFormatters,
      this.onClick,
      this.onSubmitted,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.colorTextDarkPrimary.withOpacity(0),
          borderRadius: BorderRadius.all(Radius.circular(24.r)),
        ),
        padding: EdgeInsets.only(
          left: 19.w,
          top: 9.h,
          right: 19.w,
          bottom: 9.h,
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 5.w),
              child: Text(
                leftTitle ?? '',
                style: AppTheme().appTextStyle.textStyleTitleText,
              ),
            ),
            Expanded(
              child: TextField(
                controller: controller,
                obscureText: obscureText,
                autofocus: autofocus,
                // 备用焦点方案
                style: AppTheme().appTextStyle.textStyleTitleText,
                keyboardType: keyboardType,
                cursorColor: AppTheme.colorBrandPrimary,
                inputFormatters: inputFormatters,
                onSubmitted: onSubmitted,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                  hintText: hintText,
                  fillColor: Colors.transparent,
                  hintStyle: AppTheme().appTextStyle.textStyleHintText,
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                ),
                onChanged: (val) {
                  onChanged?.call();
                },
              ),
            ),
            rightWidget ?? Container(),
          ],
        ),
      ),
    );
  }
}
