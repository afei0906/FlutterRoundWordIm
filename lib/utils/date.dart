part of 'index.dart';

abstract class Date {
  ///dd/MMM/yyyy
  static String fromTime(DateTime? date, [String? pattern]) {
    if (date == null) return '';
    return DateFormat(
      pattern ?? 'y-MM-dd',
    ).format(date.toLocal());
  }

  static DateTime? fromStr(String? date, [String? pattern]) {
    if (Utils.isEmpty(date ?? '')) return null;
    return DateFormat(
      pattern ?? 'yyyy-MM-dd',
    ).parse(date!).toLocal();
  }

  static DateTime fromMilli(int date, [String? pattern]) {
    return DateTime.fromMicrosecondsSinceEpoch(date * 1000);
  }

  static String fromMilliToString(int date, [String? pattern]) {
    return fromTime(
      DateTime.fromMillisecondsSinceEpoch(date).toUtc(),
      pattern ?? 'yyyy-MM-dd HH:mm',
    );
  }

  static int fromStrToMilli(String? date, [String? pattern]) {
    return fromStr(date, pattern)?.toUtc().millisecondsSinceEpoch ?? 0;
  }

  static int fromTimeToMilli(DateTime? date, [String? pattern]) {
    return fromStrToMilli(fromTime(date, pattern), pattern);
  }

  static String fromMilliToStr(int? date, [String? pattern]) {
    if (date == null) return '';
    return fromTime(DateTime.fromMillisecondsSinceEpoch(date), pattern);
  }

  static int fromTimesTampToDateStr(int timestamp) {
    return fromStrToMilli(fromMilliToString(timestamp, 'yyyy-MM-dd'));
  }

  static bool isSameDay(int timestampA, int timestampB) {
    final DateTime dateA = fromMilli(timestampA);
    final DateTime dateB = fromMilli(timestampB);
    return dateA.day == dateB.day &&
        dateA.month == dateB.month &&
        dateA.year == dateB.year;
  }

  static String? parseISOTimeByInt(int? isoTime, [String? pattern]) {
    if (Utils.isEmpty(isoTime ?? 0)) return null;
    DateTime dateTime = DateTime.parse(fromMilliToString(isoTime!));
    return formatTime(dateTime,pattern);
  }

  /// 解析ISO 8601格式的时间字符串
  /// 例如: 2025-04-19T10:47:36.414+00:00
  static String? parseISOTime(String? isoTime, [String? pattern]) {
    // log(">>>>111>>>>$isoTime");
    if (Utils.isEmpty(isoTime ?? '')) return null;
    DateTime dateTime = DateTime.parse(isoTime!);
    return formatTime(dateTime,pattern);
  }

  static String? fromDate(String? date, [String? pattern]) {
    if (Utils.isEmpty(date ?? '')) return null;
    final DateTime? dateTime = fromStr(date, "yyyy-mm-dd HH:mm:ss");
    return formatTime(dateTime!);
  }

  /// 格式化时间显示
  /// 如果时间大于今天0点，显示 HH:mm
  /// 如果时间小于今天0点，显示 yyyy-MM-dd
  static String formatTime(DateTime dateTime, [String? pattern]) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final inputDate = DateTime(dateTime.year, dateTime.month, dateTime.day);

    if (inputDate.isAtSameMomentAs(today)) {
      // 如果是今天，显示 HH:mm
      return DateFormat('HH:mm').format(dateTime);
    } else {
      // 如果不是今天，显示 yyyy-MM-dd
      return DateFormat(pattern ?? 'yyyy/MM/dd').format(dateTime);
    }
  }
}
