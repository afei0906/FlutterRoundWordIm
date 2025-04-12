part of 'index.dart';

class ResponseModel {
  ResponseModel({this.code, this.msg, this.data, this.ok});

  ResponseModel.fromJson(dynamic json) {
    code = json['code'] as int?;
    msg = json['msg']?.toString();
    data = json['data'];
    ok = json['ok']?.toString();
  }

  int? code;
  String? msg;
  dynamic data;
  String? ok;

  ResponseModel copyWith({
    int? code,
    String? msg,
    dynamic data,
    String? ok,
  }) =>
      ResponseModel(
        code: code ?? this.code,
        msg: msg ?? this.msg,
        data: data ?? this.data,
        ok: ok ?? this.ok,
      );

// Map<String, dynamic> toJson() {
//   final map = <String, dynamic>{};
//   map['code'] = code;
//   map['msg'] = msg;
//   map['Data'] = data;
//   return map;
// }
}
