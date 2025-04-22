part of 'index.dart';

class CustomDialog extends StatelessWidget {
  final Widget child;
  final Widget? title;
  final Widget? cancel;
  final Widget? confirm;
  final void Function()? onCancel;
  final void Function()? onConfirm;

  const CustomDialog({
    super.key,
    required this.child,
    this.title,
    this.cancel,
    this.confirm,
    this.onCancel,
    this.onConfirm,
  });

  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    Widget? title,
    Widget? confirm,
    Widget? cancel,
    void Function()? onConfirm,
    void Function()? onCancel,
    bool? barrierDismissible = true,
  }) {
    return showDialog<T>(
      barrierDismissible: barrierDismissible ?? true,
      context: context,
      builder: (context) => CustomDialog(
        title: title,
        confirm: confirm,
        cancel: cancel,
        onConfirm: onConfirm,
        onCancel: onCancel,
        child: builder(context),
      ),
    );
  }

  static Future<T?> showLoginMsg<T>({
    String? tipStr,
    String? title0,
    String? title1,
    String? title2,
    String? confirm,
    void Function()? onConfirm,
  }) {
    return show(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
              child: Text(
                title1 ?? '',
                style: AppTheme().appTextStyle.textStyleTitleText,
              ),
              // child: StringUtils.formatWidget(
              //     title1 ?? '',
              //     AppTheme.tsFF000000W40012,
              //     [title0 ?? '', title2 ?? ''],
              //     [AppTheme.tsFF5D38C4W40012, AppTheme.tsFF5D38C4W40012])
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 40.h,
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: AppTheme.colorBorderLight)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: onConfirm,
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.transparent,
                        height: double.infinity,
                        child: Text(
                          confirm ?? '',
                          style: AppTheme().appTextStyle.textStyleTitleText,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<T?> showInfo<T>({
    String? msg,
    List<Widget>? childWidgets,
    TextAlign? msgAlign = TextAlign.center,
    String? confirm,
    void Function()? onConfirm,
  }) {
    return show(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text(
                textAlign: msgAlign,
                msg ?? '',
                style: AppTheme().appTextStyle.textStyleTitleText,
              ),
            ),
            if (childWidgets != null) ...childWidgets,
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 40.h,
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: AppTheme.colorBorderLight)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: onConfirm,
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.transparent,
                        height: double.infinity,
                        child: Text(
                          confirm ?? '',
                          style: AppTheme().appTextStyle.textStyleTitleText,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<T?> showMsg<T>({
    String? tipStr,
    String? title,
    String? msg,
    TextAlign? msgAlign = TextAlign.center,
    String? confirm,
    void Function()? onConfirm,
  }) {
    return show(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (tipStr != null)
              Container(
                margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Text(
                  tipStr,
                  style: AppTheme().appTextStyle.textStyleTitleText,
                ),
              ),
            if (title != null)
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                child: Text(
                  title,
                  style: AppTheme().appTextStyle.textStyleTitleText,
                ),
              ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text(
                textAlign: msgAlign,
                msg ?? '',
                style: AppTheme().appTextStyle.textStyleTitleText,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 40.h,
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: AppTheme.colorBorderLight)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: onConfirm,
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.transparent,
                        height: double.infinity,
                        child: Text(
                          confirm ?? '',
                          style: AppTheme().appTextStyle.textStyleTitleText,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<T?> showDelete<T>({
    String? tipStr,
    String? title,
    String? msg,
    String? cancel,
    String? confirm,
    void Function()? onConfirm,
    void Function()? onCancel,
  }) {
    return show(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (tipStr != null)
              Container(
                margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Text(
                  tipStr,
                  style: AppTheme().appTextStyle.textStyleTitleText,
                ),
              ),
            if (title != null)
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                child: Text(
                  title,
                  style: AppTheme().appTextStyle.textStyleTitleText,
                ),
              ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text(
                msg ?? '',
                style: AppTheme().appTextStyle.textStyleTitleText,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 40.h,
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: AppTheme.colorBorderLight)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: onCancel,
                      child: Container(
                        color: Colors.transparent,
                        height: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          cancel ?? '',
                          style: AppTheme().appTextStyle.textStyleTitleText,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: double.infinity,
                    color: AppTheme.colorBorderLight,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: onConfirm,
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.transparent,
                        height: double.infinity,
                        child: Text(
                          confirm ?? '',
                          style: AppTheme().appTextStyle.textStyleTitleText,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<T?> showTextDialog<T>({
    String? title,
    String? hintStr,
    String? cancel,
    String? confirm,
    TextEditingController? textController,
    void Function()? onConfirm,
    void Function()? onCancel,
    // String Function()? onChange,
  }) {
    return show(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: AppTheme.colorTextDarkPrimary,
            borderRadius: BorderRadius.circular(8),
          ),
          width: 316,
          height: 358,
          child: Column(
            children: [
              const SizedBox(
                height: 6,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    // color: AppTheme.cFFF3F3F3,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: TextField(
                    maxLines: null,
                    // 设置为null表示TextField可以根据内容自动扩展
                    expands: true,
                    // key: const Key('Search'),
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: title ?? LocaleKeys.text_0010.tr,
                      fillColor: const Color(0xffF3F3F3),
                      enabledBorder: OutlineInputBorder(
                        // borderRadius:
                        // const BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          color: const Color(0xffF3F3F3).withOpacity(0.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color(0xffF3F3F3).withOpacity(0.0),
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      filled: true,
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xff999999),
                      ),
                    ),
                    // maxLength: 25,
                    controller: textController,
                    // onChanged: (String text) {
                    //   onChange?.call(text);
                    // }
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: CustomButton(
                      width: double.infinity,
                      shape: CustomButtonShape.radius,
                      type: CustomButtonType.ghost,
                      foregroundColor: AppTheme.colorBrandPrimary,
                      backgroundColor: AppTheme.colorTextDarkPrimary,
                      onPressed: () {
                        onCancel?.call();
                      },
                      child: Text(
                        cancel ?? LocaleKeys.text_0011.tr,
                        style: AppTheme().appTextStyle.textStyleTitleText,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: CustomButton(
                      width: double.infinity,
                      shape: CustomButtonShape.radius,
                      foregroundColor: AppTheme.colorBrandPrimary,
                      backgroundColor: AppTheme.colorBrandPrimary,
                      onPressed: () {
                        onConfirm?.call();
                      },
                      child: Text(
                        confirm ?? LocaleKeys.text_0010.tr,
                        style: AppTheme().appTextStyle.textStyleTitleText,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<T?> showTextFieldDialog<T>({
    String? title,
    String? hintText,
    String? cancel,
    String? confirm,
    TextEditingController? textController,
    void Function()? onConfirm,
    void Function()? onCancel,
    int? maxLength = 50,
    CustomLogic? logic,
  }) {
    textController ??= TextEditingController();
    logic ??= CustomLogic.to;
    return show(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: AppTheme.colorTextDarkPrimary,
            borderRadius: BorderRadius.circular(8),
          ),
          width: 316,
          height: 170,
          child: Column(
            children: [
              const Spacer(),
              Text(
                title ?? 'Group name',
                style: AppTheme().appTextStyle.textStyleTitleText,
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  // color: AppTheme.cFFF3F3F3,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: hintText ?? LocaleKeys.text_0010.tr,
                    fillColor: const Color(0xffF3F3F3),
                    enabledBorder: OutlineInputBorder(
                      // borderRadius:
                      // const BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: const Color(0xffF3F3F3).withOpacity(0.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color(0xffF3F3F3).withOpacity(0.0),
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    filled: true,
                    suffixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        GetBuilder<CustomLogic>(
                          id: "maxTextId",
                          builder: (logic) {
                            return Text(
                              '${textController?.text.length ?? 0}/$maxLength',
                              style: AppTheme().appTextStyle.textStyleTitleText,
                            );
                          },
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                    hintStyle: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(0xff999999),
                    ),
                  ),
                  // maxLength: 10,
                  controller: textController,
                  onChanged: (String text) {
                    final String memo = text;
                    if (text.length > maxLength!) {
                      textController?.value = TextEditingValue(
                        text: memo.substring(0, maxLength),
                        selection: TextSelection.fromPosition(
                          TextPosition(
                            offset: memo.substring(0, maxLength).length,
                          ),
                        ),
                      );
                      return;
                    }
                    logic?.upText(text);
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: CustomButton(
                      width: double.infinity,
                      shape: CustomButtonShape.radius,
                      type: CustomButtonType.ghost,
                      foregroundColor: AppTheme.colorBrandPrimary,
                      backgroundColor: AppTheme.colorTextDarkPrimary,
                      onPressed: () {
                        Get.back();
                        onCancel?.call();
                      },
                      child: Text(
                        cancel ?? LocaleKeys.text_0011.tr,
                        style: AppTheme().appTextStyle.textStyleTitleText,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: CustomButton(
                      width: double.infinity,
                      shape: CustomButtonShape.radius,
                      foregroundColor: AppTheme.colorBrandPrimary,
                      backgroundColor: AppTheme.colorBrandPrimary,
                      onPressed: () {
                        onConfirm?.call();
                      },
                      child: Text(
                        confirm ?? LocaleKeys.text_0010.tr,
                        style: AppTheme().appTextStyle.textStyleTitleText,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final buttonGroup = <Widget>[];
    if (cancel != null) {
      buttonGroup.add(
        Expanded(
          child: CustomButton(
            foregroundColor: Theme.of(context).colorScheme.onSurface,
            onPressed: onCancel,
            child: cancel!,
          ),
        ),
      );
    }
    if (confirm != null && cancel != null) {
      buttonGroup.add(const SizedBox(width: 12));
    }
    if (confirm != null) {
      buttonGroup.add(
        Expanded(
          child: CustomButton(
            onPressed: onConfirm,
            child: confirm!,
          ),
        ),
      );
    }
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (title != null)
              Padding(
                padding: const EdgeInsets.all(16),
                child: DefaultTextStyle.merge(
                  textAlign: TextAlign.center,
                  style: DialogTheme.of(context).titleTextStyle,
                  child: title!,
                ),
              ),
            Flexible(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: DefaultTextStyle.merge(
                  textAlign: TextAlign.center,
                  style: DialogTheme.of(context).contentTextStyle?.copyWith(
                        fontSize: title != null ? 18 : null,
                      ),
                  child: Container(
                    alignment: Alignment.center,
                    constraints: const BoxConstraints(minHeight: 80),
                    child: child,
                  ),
                ),
              ),
            ),
            if (buttonGroup.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(children: buttonGroup),
              ),
          ],
        ),
      ),
    );
  }
}

class CustomLogic extends GetxController {
  static CustomLogic get to {
    final bool isControllerRegistered =
        GetInstance().isRegistered<CustomLogic>();
    if (isControllerRegistered) {
      return Get.find();
    } else {
      return Get.put(CustomLogic());
    }
  }

  void upText(String str) {
    update(["maxTextId"]);
  }
}
