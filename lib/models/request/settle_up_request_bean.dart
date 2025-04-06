part of '../index.dart';

/// SplitID : 1
/// FromUserCode : "xxx"
/// ToUserCode : "xxx"
/// Amount : "10.00"
/// Notes : "xxx"
/// Date : "2024-05-14T00:00:00.000Z"
/// Image : "split-8d23d905-0021-4e89-b57e-622e1e96e58a.png"

SettleUpRequestBean settleUpRequestBeanFromJson(String str) =>
    SettleUpRequestBean.fromJson(json.decode(str));

String settleUpRequestBeanToJson(SettleUpRequestBean data) =>
    json.encode(data.toJson());

class SettleUpRequestBean {
  SettleUpRequestBean(
      {this.fromUserCode,
      this.splitIDList,
      this.toUserCode,
      this.amount,
      this.notes,
      this.date,
      this.image,
      this.groupsId,
      this.currencyCode});

  SettleUpRequestBean.fromJson(dynamic json) {
    fromUserCode = json['Participant1UserCode'] as String?;
    toUserCode = json['Participant2UserCode'] as String?;
    amount = json['Amount'] as String?;
    notes = json['Notes'] as String?;
    date = json['Date'] as String?;
    image = json['Image'] as String?;
    groupsId = json['GroupID'] as num?;
    splitIDList = json['SplitIDList'] as List<num?>? ?? [];
    currencyCode = json['CurrencyCode'] as String?;
  }

  // num? splitID;
  String? fromUserCode;
  String? toUserCode;
  String? amount;
  String? notes;
  String? date;
  String? image;
  String? currencyCode;
  num? groupsId;
  List<num?>? splitIDList;

  SettleUpRequestBean copyWith({
    List<num?>? splitIDList,
    num? groupsId,
    String? fromUserCode,
    String? toUserCode,
    String? amount,
    String? notes,
    String? date,
    String? image,
    String? currencyCode,
  }) =>
      SettleUpRequestBean(
        fromUserCode: fromUserCode ?? this.fromUserCode,
        groupsId: groupsId ?? this.groupsId,
        toUserCode: toUserCode ?? this.toUserCode,
        amount: amount ?? this.amount,
        notes: notes ?? this.notes,
        date: date ?? this.date,
        image: image ?? this.image,
        currencyCode: currencyCode ?? this.currencyCode,
        splitIDList: splitIDList ?? this.splitIDList,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Participant1UserCode'] = fromUserCode;
    map['Participant2UserCode'] = toUserCode;
    map['Amount'] = amount;
    map['Notes'] = notes;
    map['Date'] = date;
    map['Image'] = image;
    map['CurrencyCode'] = currencyCode;
    map['GroupID'] = groupsId;
    map['SplitIDList'] = splitIDList;
    return map;
  }
}
