part of '../index.dart';

/// CategoryID : 1
/// Amount : "10.00"
/// CurrencyCode : "USD"
/// Description : "xxx"
/// Notes : "xxx"
/// Date : "2024-05-14T00:00:00.000Z"
/// Image : "split-8d23d905-0021-4e89-b57e-622e1e96e58a.png"
/// SplitList : [{"UserCode":"1714359978556","PaidAmount":"1","OwedAmount":"0.33"}]

SplitRequestBean splitRequestBeanFromJson(String str) =>
    SplitRequestBean.fromJson(json.decode(str));

String splitRequestBeanToJson(SplitRequestBean data) =>
    json.encode(data.toJson());

class SplitRequestBean {
  SplitRequestBean(
      {this.categoryID,
      this.amount,
      this.currencyCode,
      this.description,
      this.notes,
      this.date,
      this.image,
      this.groupId,
      this.method,
      this.splitList,
      this.data});

  SplitRequestBean.fromJson(dynamic json) {
    categoryID = json['CategoryID'] as num?;
    amount = json['Amount'] as String?;
    currencyCode = json['CurrencyCode'] as String?;
    description = json['Description'] as String?;
    notes = json['Notes'] as String?;
    date = json['Date'] as String?;
    image = json['Image'] as String?;
    groupId = json['GroupID'] as num?;
    method = json['Method'] as num?;
    data = json['Data'] as Map<String, dynamic>?;
    if (json['SplitList'] != null) {
      splitList = [];
      json['SplitList'].forEach((v) {
        splitList?.add(Details.fromJson(v));
      });
    }
  }

  num? categoryID;
  String? amount;
  String? currencyCode;
  String? description;
  String? notes;
  String? date;
  String? image;
  num? method;
  num? groupId;
  List<Details>? splitList;
  Map<String, dynamic>? data;

  SplitRequestBean copyWith({
    num? categoryID,
    String? amount,
    String? currencyCode,
    String? description,
    String? notes,
    String? date,
    String? image,
    num? method,
    num? groupId,
    List<Details>? splitList,
    Map<String, dynamic>? data,
  }) =>
      SplitRequestBean(
        categoryID: categoryID ?? this.categoryID,
        amount: amount ?? this.amount,
        currencyCode: currencyCode ?? this.currencyCode,
        description: description ?? this.description,
        notes: notes ?? this.notes,
        date: date ?? this.date,
        image: image ?? this.image,
        method: method ?? this.method,
        groupId: groupId ?? this.groupId,
        splitList: splitList ?? this.splitList,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['CategoryID'] = categoryID;
    map['Amount'] = amount;
    map['CurrencyCode'] = currencyCode;
    map['Description'] = description;
    map['Notes'] = notes;
    map['Date'] = date;
    map['Image'] = image;
    map['GroupID'] = groupId;
    map['Method'] = method;
    map['Data'] = data;
    if (splitList != null) {
      map['SplitList'] = splitList?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
