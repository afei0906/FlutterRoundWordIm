import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/utils/index.dart';
import 'package:store/widgets/index.dart';

class AppTheme {
  late AppTextStyle appTextStyle;
  static AppTheme? _instance;

  factory AppTheme() {
    _instance ??= AppTheme._();
    return _instance!;
  }

  AppTheme._() {
    appTextStyle = AppTextStyle();
  }

  static const bgColor = Color(0xffffffff);
  static const primary = Color(0xff126BF6);
  static const defaultText = Color(0x0D000000);
  static const secondaryText = Color(0xFF262626);
  static const fourthText = Color(0xffA3A3A3);
  static const ternaryText = Color(0xff525252);
  static const titleText = Color(0xff0A0A0A);
  static const black = Color(0xff000000);
  static const loginLine = Color(0xffD9D9D9);
  static const checkColor = Color(0xffD4D4D4);
  static const sliderColor = Color(0xffDCE2E3);
  static const bgColor2= Color(0xffF0F3F4);

  static const onPrimary = Color(0xffB1B1B1);
  static const success = Color(0xFF28CE88);
  static const warning = Color(0xFFFFD575);
  static const error = Color(0xFFFA6677);
  static const info = Color(0xFF2FA7FF);
  static const lineColor = Color(0xffEDEEF2);
  static const letter = 0.2;
  static String? fontFamily = ThemeOfFont.fontName[AppTheme.notoSans];

  static FontTheme fontTheme = FontTheme.roboto;
  static FontTheme fontRough = FontTheme.rough;
  static FontTheme notoSans = FontTheme.notoSans;

  static ThemeMode mode = ThemeMode.system;

  static SystemUiOverlayStyle get systemStyle => const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      );

  static SystemUiOverlayStyle get systemStyleLight => systemStyle.copyWith(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      );

  static SystemUiOverlayStyle get systemStyleDark => systemStyle.copyWith(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: const Color(0xFF0D0D0D),
        systemNavigationBarIconBrightness: Brightness.light,
      );

  static ThemeData get light {
    final scheme = ColorScheme.light(
      onSurface: const Color(0xFF333333),
      primary: primary,
      onSecondary: const Color(0xFF9A9AA8),
      onTertiary: const Color(0xFF8D97A6),
      outline: lineColor,
      shadow: const Color(0xFFD0DAD6).withOpacity(0.22),
      error: error,
      onPrimaryContainer: const Color(0xffE6E6E6),
    );
    return _getTheme(scheme);
  }

  static ThemeData get dark {
    final scheme = ColorScheme.dark(
      surface: const Color(0xFF252525),
      primary: primary,
      onPrimary: Colors.white,
      secondary: const Color(0xFFFFB800),
      onSecondary: Colors.white,
      tertiary: const Color(0xFF141414),
      outline: const Color(0xFF252525),
      shadow: const Color(0xFF777777).withOpacity(0.08),
      error: error,
      onError: Colors.white,
    );
    return _getTheme(scheme);
  }

  static ThemeData _getTheme(ColorScheme scheme) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      fontFamily: "NotoSans",
      scaffoldBackgroundColor: scheme.surface,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      dialogTheme: DialogTheme(
        elevation: 0,
        titleTextStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        contentTextStyle: const TextStyle(fontSize: 17),
        backgroundColor: scheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        elevation: 0,
        backgroundColor: scheme.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        scrolledUnderElevation: 0,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 44,
        iconTheme: IconThemeData(
          color: scheme.primary,
          size: 24,
        ),
        titleTextStyle: TextStyle(
          color: scheme.onSurface,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          height: 1.2,
        ),
        toolbarTextStyle: TextStyle(
          color: scheme.onSurface,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          height: 1.2,
        ),
      ),
      textTheme: TextTheme(
        titleLarge: const TextStyle(
          fontSize: 12,
          color: primary,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: const TextStyle(
          fontSize: 12,
          color: onPrimary,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          color: scheme.onSurface,
          height: 1.2,
        ),
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        elevation: 0,
        color: scheme.surface,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: scheme.surface,
        unselectedItemColor: scheme.onSurface.withOpacity(0.5),
        selectedItemColor: scheme.primary,
        unselectedLabelStyle: TextStyle(
          fontSize: 12.sp,
          color: onPrimary,
          fontWeight: ThemeFontWeight.medium.weight,
          fontFamily: fontFamily,
        ),
        selectedLabelStyle: TextStyle(
          fontSize: 12.sp,
          color: primary,
          fontWeight: ThemeFontWeight.medium.weight,
          fontFamily: fontFamily,
        ),
        unselectedIconTheme: IconThemeData(
          size: 22,
          color: scheme.onSurface.withOpacity(0.5),
        ),
        selectedIconTheme: IconThemeData(
          size: 22,
          color: scheme.primary,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0),
          minimumSize: WidgetStateProperty.all(Size.zero),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          overlayColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        isCollapsed: true,
        isDense: true,
        filled: true,
        fillColor: scheme.surface,
        labelStyle: TextStyle(
          fontSize: 16,
          color: scheme.onSurface,
          fontWeight: FontWeight.w600,
          height: 1.2,
        ),
        hintStyle: TextStyle(color: scheme.onTertiary),
        helperStyle: TextStyle(
          fontSize: 14,
          color: scheme.onSecondary,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 12,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: scheme.primary),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: error),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: error),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: scheme.onSurface,
        unselectedLabelColor: scheme.onSurface.withOpacity(0.5),
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: scheme.primary,
      ),
      dividerColor: lineColor,
      dividerTheme: const DividerThemeData(
        thickness: 0.5,
        color: lineColor,
      ),
      popupMenuTheme: PopupMenuThemeData(
        elevation: 4,
        color: scheme.surface,
        textStyle: TextStyle(
          fontSize: 14,
          color: scheme.onSurface.withOpacity(0.8),
          height: 1.2,
        ),
        position: PopupMenuPosition.over,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

enum FontTheme { roboto, rough, notoSans }

class ThemeOfFont {
  static final Map<FontTheme, String> fontName = {
// FontTheme.roboto: "Roboto-Regular, Roboto",
// FontTheme.rough: "Prohibition",
    FontTheme.notoSans: "PingFang SC",
  };
}

class AppTextStyle {
  static AppTextStyle? _instance;

  factory AppTextStyle() {
    _instance ??= AppTextStyle._();
    return _instance!;
  }

  AppTextStyle._() {}

  static const letter = 0.2;

  static final fontFamily = ThemeOfFont.fontName[AppTheme.notoSans];

  late TextStyle textStyleSecondary = TextStyle(
      fontFamily: fontFamily,
      fontWeight: ThemeFontWeight.medium.weight,
      letterSpacing: letter,
      color: AppTheme.secondaryText,
      fontSize: 20.sp);

  late TextStyle textStyleSecondaryNor = TextStyle(
      fontFamily: fontFamily,
      fontWeight: ThemeFontWeight.regular.weight,
      letterSpacing: letter,
      color: AppTheme.secondaryText,
      fontSize: 14.sp);


  late TextStyle textStylePrimary = TextStyle(
      fontFamily: fontFamily,
      fontWeight: ThemeFontWeight.regular.weight,
      letterSpacing: letter,
      color: AppTheme.primary,
      fontSize: 16.sp);

  late TextStyle textExtraLightStylePrimary = TextStyle(
      fontFamily: fontFamily,
      fontWeight: ThemeFontWeight.medium.weight,
      letterSpacing: letter,
      color: AppTheme.primary,
      fontSize: 12.sp);

  late TextStyle textExtraLightStyleBlack = TextStyle(
      fontFamily: fontFamily,
      fontWeight: ThemeFontWeight.medium.weight,
      letterSpacing: letter,
      color: AppTheme.titleText,
      fontSize: 12.sp);

  late TextStyle textStyleTernary = TextStyle(
      fontFamily: fontFamily,
      fontWeight: ThemeFontWeight.light.weight,
      letterSpacing: letter,
      color: AppTheme.ternaryText,
      height: 1.5,
      fontSize: 14.sp);

  late TextStyle textStyleTitleText = TextStyle(
      fontFamily: fontFamily,
      fontWeight: ThemeFontWeight.medium.weight,
      letterSpacing: letter,
      color: AppTheme.titleText,
      fontSize: 16.sp);

  late TextStyle textStyleSliderText = TextStyle(
      fontFamily: fontFamily,
      fontWeight: ThemeFontWeight.medium.weight,
      letterSpacing: letter,
      color: Color(0xff8E8E93),
      fontSize: 16.sp);

  late TextStyle textStyleSliderTitleText = TextStyle(
      fontFamily: fontFamily,
      fontWeight: ThemeFontWeight.regular.weight,
      letterSpacing: letter,
      color: Color(0xff525252),
      fontSize: 16.sp);

  
  late TextStyle textStyleHintText = TextStyle(
      fontFamily: fontFamily,
      fontWeight: ThemeFontWeight.regular.weight,
      letterSpacing: letter,
      color: AppTheme.fourthText,
      fontSize: 15.sp);

  late TextStyle textStyleBgColor = TextStyle(
      fontFamily: fontFamily,
      fontWeight: ThemeFontWeight.medium.weight,
      letterSpacing: letter,
      color: AppTheme.bgColor,
      fontSize: 16.sp);
}

class AppButton {
  static CustomButton brandPrimaryButton(String title, Function()? onPressed) =>
      CustomButton(
        height: 48.h,
        width: double.infinity,
        foregroundColor: AppTheme.primary,
        backgroundColor: AppTheme.bgColor,
        type: CustomButtonType.ghost,
        shape: CustomButtonShape.radius,
        onPressed: onPressed,
        child: Text(
          title,
          style: AppTheme()
              .appTextStyle
              .textStylePrimary
              .copyWith(fontWeight: ThemeFontWeight.medium.weight),
        ),
      );

  static CustomButton fillPrimaryButton(String title, Function()? onPressed,
          {bool isPress = true}) =>
      CustomButton(
        height: 48.h,
        width: double.infinity,
        foregroundColor:
            isPress ? AppTheme.primary : AppTheme.black.withOpacity(0.05),
        backgroundColor:
            isPress ? AppTheme.primary : AppTheme.black.withOpacity(0.05),
        shape: CustomButtonShape.radius,
        onPressed: onPressed,
        child: Text(
          title,
          style: AppTheme()
              .appTextStyle
              .textStyleBgColor
              .copyWith(color:  isPress ? AppTheme.bgColor :  AppTheme.black.withOpacity(0.2)),
        ),
      );
}
