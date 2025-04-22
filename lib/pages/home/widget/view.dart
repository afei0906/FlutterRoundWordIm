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
      String error = Resource.assetsImagesUserAvatarDefualtPng,
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
        error: error,
        width: width ?? 40.w,
        height: width ?? 40.w,
        radius: width ?? 40.r,
      ),
    );
  }
}
