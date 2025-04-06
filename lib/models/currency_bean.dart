part of 'index.dart';

/// ID : 1
/// CurrencyCode : "USD"
/// Symbol : "$"
/// FlagPicName : null
/// Name : "United States dollar"
/// IsTop : 1
/// IsHide : 0

CurrencyBean currencyBeanFromJson(String str) =>
    CurrencyBean.fromJson(json.decode(str));

String currencyBeanToJson(CurrencyBean data) => json.encode(data.toJson());

class CurrencyBean {
  CurrencyBean({
    this.id,
    this.currencyCode,
    this.symbol,
    this.flagPicName,
    this.name,
    this.isTop,
    this.isHide,
  });

  CurrencyBean.fromJson(dynamic json) {
    id = json['ID'];
    currencyCode = json['CurrencyCode'];
    symbol = json['Symbol'];
    flagPicName = json['FlagPicName'];
    name = json['Name'];
    isTop = json['IsTop'];
    isHide = json['IsHide'];
  }

  dynamic id;
  dynamic currencyCode;
  dynamic symbol;
  dynamic flagPicName;
  dynamic name;
  dynamic isTop;
  dynamic isHide;

  CurrencyBean copyWith({
    dynamic id,
    dynamic currencyCode,
    dynamic symbol,
    dynamic flagPicName,
    dynamic name,
    dynamic isTop,
    dynamic isHide,
  }) =>
      CurrencyBean(
        id: id ?? this.id,
        currencyCode: currencyCode ?? this.currencyCode,
        symbol: symbol ?? this.symbol,
        flagPicName: flagPicName ?? this.flagPicName,
        name: name ?? this.name,
        isTop: isTop ?? this.isTop,
        isHide: isHide ?? this.isHide,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ID'] = id;
    map['CurrencyCode'] = currencyCode;
    map['Symbol'] = symbol;
    map['FlagPicName'] = flagPicName;
    map['Name'] = name;
    map['IsTop'] = isTop;
    map['IsHide'] = isHide;
    return map;
  }
}
