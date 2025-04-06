part of 'index.dart';

class ResponseModel {
  ResponseModel({
    this.code,
    this.msg,
    this.data,
  });

  ResponseModel.fromJson(dynamic json) {
    if (json['Result'] != null) {
      code = int.tryParse(json['Result']['ErrCode'].toString());
      msg = json['Result']['ErrMsg']?.toString();
    }
    data = json['Data'];
  }

  int? code;
  String? msg;
  dynamic data;

  ResponseModel copyWith({
    int? code,
    String? msg,
    dynamic data,
  }) =>
      ResponseModel(
        code: code ?? this.code,
        msg: msg ?? this.msg,
        data: data ?? this.data,
      );

// Map<String, dynamic> toJson() {
//   final map = <String, dynamic>{};
//   map['code'] = code;
//   map['msg'] = msg;
//   map['Data'] = data;
//   return map;
// }
}
