part of 'index.dart';

class VipBean{
  String? orderNumber;
  int? id;
  VipBean.fromJson(dynamic json) {
    orderNumber = json['OrderNumber'] as String?;
    id = json['ID'] as int?;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['OrderNumber'] = orderNumber;
    map['ID'] = id;
    return map;
  }
}