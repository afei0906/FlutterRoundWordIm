part of '../index.dart';

class LoginBotton extends StatelessWidget {
  final String text;
  final String? img;
  final Function()? onTap;

  const LoginBotton({super.key, required this.text, this.img, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.colorTextDarkPrimary,
          borderRadius: BorderRadius.all(Radius.circular(24.r)),
        ),
        padding: EdgeInsets.only(
          left: 41.w,
          top: 9.h,
          right: 41.w,
          bottom: 9.h,
        ),
        child: Row(
          children: [
            Container(
              child: Text(
                text,
                style: AppTheme().appTextStyle.textStyleTitleText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
