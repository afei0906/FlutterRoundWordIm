part of '../index.dart';

class CustomUtils {
  static Widget onSearchView(
      TextEditingController searchController, String hintText,
      {Function? onChanged, Function? onSubmitted, bool autofocus = false}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppTheme.black.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12.r)),
      child: SizedBox(
        width: double.infinity,
        height: 48.h,
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
                onChanged: () {
                  onChanged?.call();
                },
                onSubmitted: () {
                  onSubmitted?.call();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
