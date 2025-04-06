part of 'index.dart';

/// ID : 3
/// Type : 0
/// UserCode : "1722597751178"
/// SplitID : 369
/// Content : null
/// OriginalData : {"Amount":"300.00","Description":"tuijkxc","CurrencyCode":"ARS"}
/// NewData : {"Amount":"400","Description":"tuijkxcugvv ","CurrencyCode":"AMD"}
/// CreateDatetime : "2024-08-15T15:22:00.000Z"
/// UpdateDatetime : "2024-08-15T15:22:00.000Z"

SettleUpComments settleUpCommentsFromJson(String str) =>
    SettleUpComments.fromJson(json.decode(str));

String settleUpCommentsToJson(SettleUpComments data) =>
    json.encode(data.toJson());

class SettleUpComments {
  SettleUpComments({
    this.id,
    this.type,
    this.userCode,
    this.splitID,
    this.content,
    this.originalData,
    this.newData,
    this.createDatetime,
    this.updateDatetime,
  });

  SettleUpComments.fromJson(dynamic json) {
    id = json['ID'] as num?;
    type = json['Type'] as num?;
    userCode = json['UserCode'] as String?;
    splitID = json['SplitID'] as num?;
    content = json['Content'];
    originalData = json['OriginalData'] != null
        ? OriginalData.fromJson(json['OriginalData'])
        : null;
    newData =
        json['NewData'] != null ? NewData.fromJson(json['NewData']) : null;
    createDatetime = json['CreateDatetime'] as String?;
    updateDatetime = json['UpdateDatetime'] as String?;
  }

  num? id;
  num? type;
  String? userCode;
  num? splitID;
  dynamic content;
  OriginalData? originalData;
  NewData? newData;
  String? createDatetime;
  String? updateDatetime;

  SettleUpComments copyWith({
    num? id,
    num? type,
    String? userCode,
    num? splitID,
    dynamic content,
    OriginalData? originalData,
    NewData? newData,
    String? createDatetime,
    String? updateDatetime,
  }) =>
      SettleUpComments(
        id: id ?? this.id,
        type: type ?? this.type,
        userCode: userCode ?? this.userCode,
        splitID: splitID ?? this.splitID,
        content: content ?? this.content,
        originalData: originalData ?? this.originalData,
        newData: newData ?? this.newData,
        createDatetime: createDatetime ?? this.createDatetime,
        updateDatetime: updateDatetime ?? this.updateDatetime,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ID'] = id;
    map['Type'] = type;
    map['UserCode'] = userCode;
    map['SplitID'] = splitID;
    map['Content'] = content;
    if (originalData != null) {
      map['OriginalData'] = originalData?.toJson();
    }
    if (newData != null) {
      map['NewData'] = newData?.toJson();
    }
    map['CreateDatetime'] = createDatetime;
    map['UpdateDatetime'] = updateDatetime;
    return map;
  }
}

/// Amount : "400"
/// Description : "tuijkxcugvv "
/// CurrencyCode : "AMD"

NewData newDataFromJson(String str) => NewData.fromJson(json.decode(str));

String newDataToJson(NewData data) => json.encode(data.toJson());

class NewData {
  NewData({
    this.amount,
    this.description,
    this.currencyCode,
  });

  NewData.fromJson(dynamic json) {
    amount = json['Amount'] as String?;
    description = json['Description'] as String?;
    currencyCode = json['CurrencyCode'] as String?;
  }

  String? amount;
  String? description;
  String? currencyCode;

  NewData copyWith({
    String? amount,
    String? description,
    String? currencyCode,
  }) =>
      NewData(
        amount: amount ?? this.amount,
        description: description ?? this.description,
        currencyCode: currencyCode ?? this.currencyCode,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Amount'] = amount;
    map['Description'] = description;
    map['CurrencyCode'] = currencyCode;
    return map;
  }
}

/// Amount : "300.00"
/// Description : "tuijkxc"
/// CurrencyCode : "ARS"

OriginalData originalDataFromJson(String str) =>
    OriginalData.fromJson(json.decode(str));

String originalDataToJson(OriginalData data) => json.encode(data.toJson());

class OriginalData {
  OriginalData({
    this.amount,
    this.description,
    this.currencyCode,
  });

  OriginalData.fromJson(dynamic json) {
    amount = json['Amount'] as String?;
    description = json['Description'] as String?;
    currencyCode = json['CurrencyCode'] as String?;
  }

  String? amount;
  String? description;
  String? currencyCode;

  OriginalData copyWith({
    String? amount,
    String? description,
    String? currencyCode,
  }) =>
      OriginalData(
        amount: amount ?? this.amount,
        description: description ?? this.description,
        currencyCode: currencyCode ?? this.currencyCode,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Amount'] = amount;
    map['Description'] = description;
    map['CurrencyCode'] = currencyCode;
    return map;
  }
}
