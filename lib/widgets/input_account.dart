part of 'index.dart';

typedef PrefixBuilder = Widget Function(bool hasFocus);

enum InputEnum {
  phone,
  password,
  confirmPassword,
  email,
  none,
}

class InputAccount extends StatefulWidget {
  const InputAccount(
      {super.key,
      required this.controller,
      this.confirmController,
      this.hintText,
      this.shufflePassword,
      this.isShowError = false,
      this.inputType = InputEnum.none,
      this.obscureText = false,
      this.autofocus = false,
      this.prefix,
      this.margin,
      this.textAlign,
      this.inputFormatters,
      this.lengthLimit = 50,
      this.onChanged});

  final TextEditingController controller;
  final TextEditingController? confirmController;
  final String? hintText;
  final VoidCallback? shufflePassword;
  final bool isShowError;
  final InputEnum inputType;
  final bool obscureText;
  final bool autofocus;
  final PrefixBuilder? prefix;
  final EdgeInsetsGeometry? margin;
  final List<TextInputFormatter>? inputFormatters;
  final int lengthLimit;
  final Function()? onChanged;
  final TextAlign? textAlign;

  @override
  State<InputAccount> createState() => _InputAccountState();
}

class _InputAccountState extends State<InputAccount> {
  late FocusNode _focusNode;
  bool _isShowClear = false;

  @override
  void initState() {
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      _isShowClear = _focusNode.hasFocus && widget.controller.text.isNotEmpty;
      setState(() {});
    });
    // 延迟以确保页面渲染完成
    if (widget.autofocus) {
      Future.delayed(const Duration(milliseconds: 300), () {
        FocusScope.of(context).requestFocus(_focusNode);
      });

      widget.confirmController?.addListener(() {
        setState(() {});
      });
      super.initState();
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.only(right: 4.w),
          margin: widget.margin ?? EdgeInsets.zero,
          decoration: BoxDecoration(
            color: AppTheme.black.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: _focusNode.hasFocus
                  ? widget.isShowError && getErrorText().tr.isNotEmpty
                      ? AppTheme.error
                      : Colors.transparent
                  : Colors.transparent,
              width: 1.w,
            ),
          ),
          child: Row(
            children: [
              if (widget.prefix != null) widget.prefix!(_focusNode.hasFocus),
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  focusNode: _focusNode,
                  autofocus: widget.autofocus,
                  style: AppTheme().appTextStyle.textStyleTitleText,
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: widget.textAlign ?? TextAlign.left,
                  textInputAction: TextInputAction.done,
                  onChanged: (value) {
                    _isShowClear = _focusNode.hasFocus &&
                        widget.controller.text.isNotEmpty;
                    setState(() {});
                    if (widget.onChanged != null) {
                      widget.onChanged?.call();
                    }
                  },
                  inputFormatters: [
                    if (widget.inputFormatters != null)
                      ...widget.inputFormatters!,
                    ...[LengthLimitingTextInputFormatter(widget.lengthLimit)],
                  ],
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    filled: false,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    isDense: true,
                    hintStyle: AppTheme().appTextStyle.textStyleHintText,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                  ),
                  obscureText: widget.obscureText,
                ),
              ),
              if (widget.isShowError && _isShowClear)
                InkWell(
                  onTap: () {
                    widget.controller.clear();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: const ThemeImageWidget(
                      path: Resource.assetsSvgDefaultCloseSvg,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              if (widget.shufflePassword != null)
                InkWell(
                  onTap: widget.shufflePassword,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: ThemeImageWidget(
                      path: widget.obscureText
                          ? Resource.assetsSvgDefaultEyeOffSvg
                          : Resource.assetsSvgDefaultEyeOnSvg,
                      width: 24.w,
                      height: 24.w,
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (widget.isShowError && getErrorText().isNotEmpty)
          Padding(
            padding: EdgeInsets.only(top: 8.w, bottom: 8.w, right: 4.w),
            child: Text(
              getErrorText().tr,
              style: TextStyle(
                fontSize: 12.w,
                color: AppTheme.error,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.start,
            ),
          ),
      ],
    );
  }

  String getErrorText() {
    final inputText = widget.controller.text.trim();
    if (inputText.isEmpty) {
      return '';
    }
    String errorText = '';
    switch (widget.inputType) {
      case InputEnum.phone:
        final usernameError = checkUsername(widget.controller.text);
        if (usernameError != PhoneError.none) {
          errorText = usernameError.message ?? '';
        }
      case InputEnum.password:
        final passwordError = checkPassword(widget.controller.text);
        if (passwordError != PasswordError.none) {
          errorText = passwordError.message ?? '';
        }
      case InputEnum.confirmPassword:
        if (widget.controller.text != widget.confirmController?.text) {
          errorText = LocaleKeys.text_0026.tr;
        }
      case InputEnum.email:
        final usernameError = checkNickname(widget.controller.text);
        if (usernameError != EmailError.none) {
          errorText = usernameError.message ?? '';
        }
      case InputEnum.none:
        errorText = '';
    }
    return errorText;
  }
}

enum PhoneError {
  error(LocaleKeys.text_0016),
  valid(LocaleKeys.text_0027),
  none(null);

  final String? message;

  const PhoneError(this.message);
}

PhoneError checkUsername(String account) {
  if (account.isEmpty) {
    return PhoneError.error;
  }

  if (!GetUtils.isPhoneNumber(account)) {
    return PhoneError.valid;
  }

  return PhoneError.none;
}

enum EmailError {
  error(LocaleKeys.text_0024),
  valid(LocaleKeys.text_0028),
  none(null);

  final String? message;

  const EmailError(this.message);
}

EmailError checkNickname(String name) {
  if (name.isNotEmpty) {
    return EmailError.error;
  }

  if (!GetUtils.isEmail(name)) {
    return EmailError.valid;
  }

  return EmailError.none;
}

enum PasswordError {
  length(LocaleKeys.text_0029),
  none(null);

  final String? message;

  const PasswordError(this.message);
}

PasswordError checkPassword(String password) {
  if (password.length < 6 || password.length > 32) {
    return PasswordError.length;
  }
  return PasswordError.none;
}

// enum InviteCodeError {
//   length(LocaleKeys.account_valid_invite_code_length),
//   none(null);
//
//   final String? message;
//
//   const InviteCodeError(this.message);
// }

// InviteCodeError checkInviteCode(String inviteCode) {
//   if (inviteCode.isEmpty) {
//     return InviteCodeError.none;
//   } else {
//     if (inviteCode.length < 6) {
//       return InviteCodeError.length;
//     }
//     return InviteCodeError.none;
//   }
// }

class CustomizedTextInputFormatter extends TextInputFormatter {
  final Pattern pattern;

  CustomizedTextInputFormatter({required this.pattern});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (Platform.isIOS && newValue.isComposingRangeValid) return newValue;
    return FilteringTextInputFormatter.allow(pattern)
        .formatEditUpdate(oldValue, newValue);
  }
}
