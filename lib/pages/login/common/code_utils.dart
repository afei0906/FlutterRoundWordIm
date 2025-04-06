part of '../index.dart';

class CodeUtils extends StatefulWidget {
  final double rightLength;
  final String fromType;
  final TextEditingController codeController = TextEditingController();

  CodeUtils({
    super.key,
    this.rightLength = 0,
    this.fromType = '',
  });

  @override
  CodeUtilsState createState() => CodeUtilsState();
}

class CodeUtilsState extends State<CodeUtils> {
  /// 倒计时的计时器。
  Timer timer = Timer(const Duration(seconds: 1), () {});
  bool isButtonEnable = true; //按钮状态  是否可点击
  String buttonText = '获取验证码'; //初始文本
  int count = 60; //初始倒计时时间

  void _buttonClickListen() {}

  void _initTimer() {
    buttonText = '$count'; //更新文本内容
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      count--;
      setState(() {
        if (count == 0) {
          timer.cancel(); //倒计时结束取消定时器
          isButtonEnable = true; //按钮可点击
          count = 60; //重置时间
          buttonText = '获取验证码'; //重置按钮文本
        } else {
          isButtonEnable = false;
          buttonText = '$count'; //更新文本内容
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initTimer();
  }

  //销毁计时器
  @override
  void dispose() {
    timer.cancel(); //销毁计时器
    widget.codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {_buttonClickListen()},
      child: Container(
        alignment: Alignment.center,
        child: isButtonEnable
            ? GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Text(
                  "signUp_SendVerificationCodeAgain".tr,
                  style: AppTheme().appTextStyle.textStyleTitleText,
                ),
              )
            : RichText(
                text: TextSpan(
                  text: "${"signUp_SendVerificationCodeAgain".tr} (",
                  style: AppTheme().appTextStyle.textStyleTitleText,
                  children: [
                    TextSpan(
                      text: "$count",
                      style: AppTheme().appTextStyle.textStyleTitleText,
                    ),
                    TextSpan(
                      text: ")",
                      style: AppTheme().appTextStyle.textStyleTitleText,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
