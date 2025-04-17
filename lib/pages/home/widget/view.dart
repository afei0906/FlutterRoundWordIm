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
              color: AppTheme.fourthText,
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
}
