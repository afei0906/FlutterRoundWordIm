part of 'index.dart';

enum ThemeFontWeight {
  thick,
  extraLight,
  light,
  regular,
  medium,
  semiBold,
  bold,
  extraBold,
  black
}

extension ThemeFontWeightX on ThemeFontWeight {
  FontWeight get weight => [
        FontWeight.w100,
        FontWeight.w200,
        FontWeight.w300,
        FontWeight.w400,
        if (Platform.isAndroid) FontWeight.w600 else FontWeight.w500,
        FontWeight.w600,
        FontWeight.w700,
        FontWeight.w800,
        FontWeight.w900,
      ][index];
}
