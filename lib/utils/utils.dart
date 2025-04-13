part of 'index.dart';

class Utils {
  //检查email
  static bool checkEmail(String val) {
    const String email =
        "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";
    return RegExp(email).hasMatch(val);
  }

  static bool isEmpty(dynamic str) {
    if (str == null ||
        str.toString() == '' ||
        str.toString() == 'null' ||
        str.toString().trim() == '') {
      return true;
    }
    return false;
  }

  static String numberToChinese(int number) {
    // const units = ['', '十', '百', '千'];
    var nums = [
      LocaleKeys.text_0103.tr,
      LocaleKeys.text_0104.tr,
      LocaleKeys.text_0105.tr,
      LocaleKeys.text_0106.tr,
      LocaleKeys.text_0107.tr,
      LocaleKeys.text_0108.tr,
      LocaleKeys.text_0109.tr,
      LocaleKeys.text_0110.tr,
      LocaleKeys.text_0111.tr,
      LocaleKeys.text_0112.tr,
    ];

    if (number < 10) return nums[number];
    if (number == 10) return LocaleKeys.text_0113.tr;
    if (number < 20) return '${LocaleKeys.text_0113.tr}${nums[number % 10]}';

    final ten = number ~/ 10;
    final unit = number % 10;
    return '${nums[ten]}${LocaleKeys.text_0113.tr}${unit > 0 ? nums[unit] : ''}';
  }

  static String? toEmpty(dynamic str) {
    if (str == null ||
        str.toString() == '' ||
        str.toString() == 'null' ||
        str.toString().trim() == '') {
      return null;
    }
    return str.toString();
  }

  //获取一个月有多少天
  static int monthToDayFormat(int year, int month) {
    final dayCount = DateTime(year, month + 1, 0).day;
    return dayCount;
  }

  static DateTime toDate(String dataStr) {
    final List<String> strArr = dataStr.split("-");
    final dayCount = DateTime(
      int.parse(strArr[0]),
      int.parse(strArr[1]),
      int.parse(strArr[2]),
    );
    return dayCount;
  }

  static String dateFormatYearMonthDay(DateTime date) {
    return DateFormat("yyyy-MM-dd").format(date);
  }

  static String dateFormatYearMonthDayStr(String datestr) {
    try {
      final DateTime times = DateFormat('yyyy-MM-dd') //"yyyy-MM-dd hh:mm"
          .parse(datestr);
      return DateFormat("yyyy-MM-dd").format(times);
    } catch (e) {}
    return datestr;
  }

  //获取一年有多少个周
  static int numOfWeeks(int year) {
    final DateTime dec28 = DateTime(year, 12, 28);
    final int dayOfDec28 = int.parse(DateFormat("D").format(dec28));
    return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
  }

  //当前周
  static int weekNumber(DateTime date) {
    final int dayOfYear = int.parse(DateFormat("D").format(date));
    int woy = ((dayOfYear - date.weekday + 10) / 7).floor();
    if (woy < 1) {
      woy = numOfWeeks(date.year - 1);
    } else if (woy > numOfWeeks(date.year)) {
      woy = 1;
    }
    return woy;
  }

  //根据转换周
  static dynamic checkWiket(int index) {
    final List wiket = [
      '',
      'Monday'.tr,
      'Tuesday'.tr,
      'Wednesday'.tr,
      'Thursday'.tr,
      'Friday'.tr,
      'Saturday'.tr,
      'Sunday'.tr,
    ];
    return wiket[index];
  }
}

String formatTime(DateTime dateTime, String formatStr) {
  return DateFormat(formatStr).format(dateTime);
}
