part of 'index.dart';

class ObjectUtils {
  /// isEmpty.
  static bool isEmpty(dynamic value) {
    if (value is String && value.isEmpty) {
      return true;
    }
    return false;
  }

  //list length == 0  || list == null
  static bool isListEmpty(dynamic value) {
    if (value is List && value.isEmpty) {
      return true;
    }
    return false;
  }

  static String jsonFormat(Map<dynamic, dynamic> map) {
    final Map _map = Map<String, Object>.from(map);
    final JsonEncoder encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(_map);
  }
}
