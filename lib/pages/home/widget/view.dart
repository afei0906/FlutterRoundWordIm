part of '../index.dart';

class CustomUtils {
  static Widget onSearchView(
      TextEditingController searchController, String hintText,
      {Function? onChanged,
      Function? onSubmitted,
      Function? onClear,
      bool autofocus = false,
      bool isShowClear = false}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppTheme.black.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12.r)),
      child: SizedBox(
        width: double.infinity,
        height: 43.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.search,
              color: AppTheme.colorBorderDark,
              size: 24.w,
            ).marginOnly(left: 12.h),
            Expanded(
              child: InputAccount(
                  decoration: const BoxDecoration(),
                  controller: searchController,
                  hintText: hintText,
                  autofocus: autofocus,
                  isShowClear: isShowClear,
                  onChanged: () {
                    onChanged?.call();
                  },
                  onSubmitted: () {
                    onSubmitted?.call();
                  },
                  onClear: () {
                    onClear?.call();
                  }),
            ),
          ],
        ),
      ),
    );
  }

  static Widget avator(String url,
      {double? width,
      double? height,
      int? type = 1, //用户头像，2是群组头像
      String? error,
      Color? color}) {
    return Container(
      width: width != null ? (width + 2) : 42.w,
      height: height != null ? (height + 2) : 42.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(width != null ? (width + 2) : 42.r),
          color: color ?? AppTheme.sliderColor.withOpacity(0.3)),
      child: ThemeImageWidget(
        url: url,
        error: error ??
            (type == 1
                ? Resource.assetsImagesUserAvatarDefualtPng
                : Resource.assetsImagesGroupAvatarDefualtpng),
        width: width ?? 40.w,
        height: width ?? 40.w,
        radius: width ?? 40.r,
      ),
    );
  }

  static Widget customAlert( // String? tipStr,
      {
    String? title,
    String? msg,
    String? cancel,
    String? confirm,
    void Function()? onConfirm,
    void Function()? onCancel,
  }) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r), color: Colors.white),
      margin: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Text(
                title,
                style: AppTheme().appTextStyle.styleTextDefaultPrimary,
              ),
            ),
          if (msg != null)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text(
                msg ?? '',
                style: AppTheme().appTextStyle.styleTextDefaultFourth,
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
                if (cancel != null)
                  Expanded(
                    child: InkWell(
                      onTap: onCancel ?? SmartDialog.dismiss,
                      child: Container(
                        color: Colors.transparent,
                        height: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          cancel ?? LocaleKeys.text_0011.tr,
                          style: AppTheme().appTextStyle.textStyleSliderText,
                        ),
                      ),
                    ),
                  ),
                if (confirm != null && cancel != null)
                  Container(
                    width: 1,
                    height: double.infinity,
                    color: AppTheme.colorBorderLight,
                  ),
                if (confirm != null)
                  Expanded(
                    child: InkWell(
                      onTap: onConfirm,
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.transparent,
                        height: double.infinity,
                        child: Text(
                          confirm ?? LocaleKeys.text_0094.tr,
                          style: AppTheme().appTextStyle.styleBrandPrimary,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
