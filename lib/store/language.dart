part of 'index.dart';

class LanguageStore extends GetxController {
  static LanguageStore get to => Get.find<LanguageStore>();

  ui.Locale locale = ui.window.locale;

  String get languageName => 'English';

  @override
  Future<void> onInit() async {
    super.onInit();
    await initLanguage();
  }

  Future<void> initLanguage() async {
    final bool isControllerRegistered = GetInstance().isRegistered<UserStore>();
    String result = '';
    if (isControllerRegistered) {
      result = StorageService.to.getString(
        UserStore.to.userId == null
            ? kLocalLanguage
            : "${UserStore.to.userId}_$kLocalLanguage",
      );
    }
    if (Utils.isEmpty(result)) {
      result = getLanguageCode();
    }
    final Map<String, String>? languageBean =
        AppTranslation.translations[result];
    if (languageBean == null) {
      ///默认为中文
      result = 'zh-cn';
    }
    locale =
        ui.Locale(result, result.contains("zh") ? 'CN' : result.toUpperCase());
    await Get.updateLocale(locale);
  }

  void setLanguage(ui.Locale value) {
    locale = value;
    StorageService.to.setString(
      UserStore.to.userId == null
          ? kLocalLanguage
          : "${UserStore.to.userId}_$kLocalLanguage",
      getLanguageCode(locale: value),
    );
    Get.updateLocale(value);
  }

  bool isAppLanguage(String language) {
    return getLanguageCode(locale: Get.locale) == language;
  }

  bool isDeviceLanguage() {
    return getLanguageCode() == getLanguageCode(locale: Get.locale);
  }

  bool isArb() {
    return getAppLanguageCode() == 'ar';
  }

  String getAppLanguageCode() {
    return getLanguageCode(locale: locale);
  }

  String getLanguageCode({ui.Locale? locale}) {
    final ui.Locale? unlocale = locale ?? Get.deviceLocale;
    final String? localeStr = unlocale?.toString();
    if ((localeStr ?? '').contains('Hans')) {
      //中国简体
      return 'zh-cn';
    } else if ((localeStr ?? '').contains('Hant')) {
      return 'zh-tw';
    }
    return unlocale?.languageCode ?? 'en';
  }

  String localeToString(String? localeCode) {
    if ((localeCode ?? '').contains('Hans')) {
      //中国简体
      return 'zh-cn_CN';
    } else if ((localeCode ?? '').contains('Hant')) {
      return 'zh-tw_CN';
    }
    return localeCode ?? 'en_EN';
  }

  ui.Locale getLocale() {
    return ui.Locale(getLanguageCode(), getCountryCode());
  }

  String getCountryCode({ui.Locale? locale}) {
    final ui.Locale? unlocale = locale ?? Get.deviceLocale;
    final String localeStr = unlocale.toString();
    if (localeStr.contains('Hans') || localeStr.contains('Hant')) {
      return 'CN';
    }
    return unlocale?.countryCode ?? 'EN';
  }

  Future<void> removeLanguageCode() async {
    await StorageService.to.remove(
      UserStore.to.userId == null
          ? kLocalLanguage
          : "${UserStore.to.userId}_$kLocalLanguage",
    );
    await onInit();
  }
}
