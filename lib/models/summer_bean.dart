part of 'index.dart';

/// ID : 2
/// UserCode : "1722597751178"
/// FromUserCode : "1716346370150"
/// ToUserCode : "1722597751178"
/// Amount : "100.00"
/// Notes : null
/// Date : "2024-08-13T14:59:27.000Z"
/// Image : null
/// CreateDatetime : "2024-08-13T06:59:27.000Z"
/// UpdateDatetime : "2024-08-13T06:59:27.000Z"
/// FromUser : {"ID":19479,"UserCode":"1716346370150","Email":"2@q.com","Password":"78aa2d7121e7e45c.8dc7e9e41e58a2cce3aa9cd100f39803a962d5cb4e98d0e32506ee4823092a16","Country":"China","CountryCode":"CN","Phone":null,"Nickname":"MP_TCGFS","Gender":null,"AvatarUrl":null,"Points":0,"IsVIP":null,"FreeVipDays":null,"VipExpiredDate":null,"IsTried":0,"RegisterFrom":0,"InviteCode":null,"RegistrationStatus":null,"CreateDatetime":"2024-05-22T02:52:50.000Z","UpdateDatetime":"2024-05-22T02:54:29.000Z","AppleID":null,"FacebookID":null,"GoogleID":null,"AppVersion":null,"DeviceID":null,"IsSplitGoUser":0,"SplitGoAppleID":null,"SplitGoFacebookID":null,"SplitGoGoogleID":null,"IsSplitGoVIP":null,"FreeSplitGoVipDays":null,"IsSplitGoTried":0,"IsDeleted":0}
/// ToUser : {"ID":19546,"UserCode":"1722597751178","Email":"99ccngnjg6@privaterelay.appleid.com","Password":null,"Country":"Taiwan (Province of China)","CountryCode":"TW","Phone":null,"Nickname":"MP_YPUGN","Gender":null,"AvatarUrl":null,"Points":0,"IsVIP":null,"FreeVipDays":null,"VipExpiredDate":null,"IsTried":0,"RegisterFrom":3,"InviteCode":null,"RegistrationStatus":null,"CreateDatetime":"2024-08-02T11:22:31.000Z","UpdateDatetime":"2024-08-02T11:22:31.000Z","AppleID":null,"FacebookID":null,"GoogleID":null,"AppVersion":"1.0.1","DeviceID":"1C6801C5-877F-456C-BA7D-79619AE7641D","IsSplitGoUser":1,"SplitGoAppleID":"001417.aae8f9294c8b4d00895a1fcbdd7a827b.0458","SplitGoFacebookID":null,"SplitGoGoogleID":null,"IsSplitGoVIP":null,"FreeSplitGoVipDays":null,"IsSplitGoTried":0,"IsDeleted":0}
/// Details : [{"ID":5,"SplitID":361,"SummaryID":2,"FromUserCode":"1716346370150","ToUserCode":"1722597751178","Amount":"100.00","CreateDatetime":"2024-08-13T06:59:27.000Z","UpdateDatetime":"2024-08-13T06:59:27.000Z"}]

SummerBean summerBeanFromJson(String str) =>
    SummerBean.fromJson(json.decode(str));

String summerBeanToJson(SummerBean data) => json.encode(data.toJson());

class SummerBean {
  SummerBean({
    this.id,
    this.userCode,
    this.fromUserCode,
    this.toUserCode,
    this.amount,
    this.currencyCode,
    this.notes,
    this.date,
    this.image,
    this.createDatetime,
    this.updateDatetime,
    this.isDeleted,
    this.fromUser,
    this.toUser,
    this.details,
  });

  SummerBean.fromJson(dynamic json) {
    id = json['ID'];
    userCode = json['UserCode'];
    fromUserCode = json['FromUserCode'];
    toUserCode = json['ToUserCode'];
    currencyCode = json['CurrencyCode'];
    amount = json['Amount'];
    notes = json['Notes'];
    date = json['Date'];
    image = json['Image'];
    createDatetime = json['CreateDatetime'];
    updateDatetime = json['UpdateDatetime'];
    isDeleted = json['IsDeleted'];
    fromUser =
        json['FromUser'] != null ? User.fromJson(json['FromUser']) : null;
    toUser = json['ToUser'] != null ? User.fromJson(json['ToUser']) : null;
    if (json['Details'] != null) {
      details = [];
      json['Details'].forEach((v) {
        details?.add(SummerDetails.fromJson(v));
      });
    }
  }

  dynamic id;
  dynamic userCode;
  dynamic fromUserCode;
  dynamic toUserCode;
  dynamic amount;
  dynamic currencyCode;
  dynamic notes;
  dynamic date;
  dynamic image;
  dynamic createDatetime;
  dynamic updateDatetime;
  dynamic isDeleted;
  User? fromUser;
  User? toUser;
  List<SummerDetails>? details;

  SummerBean copyWith({
    dynamic id,
    dynamic userCode,
    dynamic fromUserCode,
    dynamic toUserCode,
    dynamic amount,
    dynamic currencyCode,
    dynamic notes,
    dynamic date,
    dynamic image,
    dynamic createDatetime,
    dynamic updateDatetime,
    dynamic isDeleted,
    User? fromUser,
    User? toUser,
    List<SummerDetails>? details,
  }) =>
      SummerBean(
        id: id ?? this.id,
        userCode: userCode ?? this.userCode,
        fromUserCode: fromUserCode ?? this.fromUserCode,
        toUserCode: toUserCode ?? this.toUserCode,
        amount: amount ?? this.amount,
        currencyCode: currencyCode ?? this.currencyCode,
        notes: notes ?? this.notes,
        date: date ?? this.date,
        image: image ?? this.image,
        createDatetime: createDatetime ?? this.createDatetime,
        updateDatetime: updateDatetime ?? this.updateDatetime,
        isDeleted: isDeleted ?? this.isDeleted,
        fromUser: fromUser ?? this.fromUser,
        toUser: toUser ?? this.toUser,
        details: details ?? this.details,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ID'] = id;
    map['UserCode'] = userCode;
    map['FromUserCode'] = fromUserCode;
    map['ToUserCode'] = toUserCode;
    map['Amount'] = amount;
    map['CurrencyCode'] = currencyCode;
    map['Notes'] = notes;
    map['Date'] = date;
    map['Image'] = image;
    map['CreateDatetime'] = createDatetime;
    map['UpdateDatetime'] = updateDatetime;
    map['IsDeleted'] = isDeleted;
    if (fromUser != null) {
      map['FromUser'] = fromUser?.toJson();
    }
    if (toUser != null) {
      map['ToUser'] = toUser?.toJson();
    }
    if (details != null) {
      map['Details'] = details?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// ID : 5
/// SplitID : 361
/// SummaryID : 2
/// FromUserCode : "1716346370150"
/// ToUserCode : "1722597751178"
/// Amount : "100.00"
/// CreateDatetime : "2024-08-13T06:59:27.000Z"
/// UpdateDatetime : "2024-08-13T06:59:27.000Z"

SummerDetails summerDetailsFromJson(String str) =>
    SummerDetails.fromJson(json.decode(str));

String summerDetailsToJson(SummerDetails data) => json.encode(data.toJson());

class SummerDetails {
  SummerDetails(
      {this.id,
      this.splitID,
      this.summaryID,
      this.fromUserCode,
      this.toUserCode,
      this.amount,
      this.currencyCode,
      this.createDatetime,
      this.updateDatetime,
      this.isDeleted,
      this.summaryDetailsCount,
      this.split});

  SummerDetails.fromJson(dynamic json) {
    id = json['ID'];
    splitID = json['SplitID'];
    summaryID = json['SummaryID'];
    fromUserCode = json['FromUserCode'];
    toUserCode = json['ToUserCode'];
    amount = json['Amount'];
    currencyCode = json['CurrencyCode'];
    createDatetime = json['CreateDatetime'];
    updateDatetime = json['UpdateDatetime'];
    isDeleted = json['IsDeleted'];
    summaryDetailsCount = json['SummaryDetailsCount'];
    split = SplitBean.fromJson(json['Split']);
  }

  dynamic id;
  dynamic splitID;
  dynamic summaryID;
  dynamic fromUserCode;
  dynamic toUserCode;
  dynamic amount;
  dynamic currencyCode;
  dynamic createDatetime;
  dynamic updateDatetime;
  dynamic isDeleted;
  dynamic summaryDetailsCount;
  SplitBean? split;

  SummerDetails copyWith({
    dynamic id,
    dynamic splitID,
    dynamic summaryID,
    dynamic fromUserCode,
    dynamic toUserCode,
    dynamic amount,
    dynamic currencyCode,
    dynamic createDatetime,
    dynamic updateDatetime,
    dynamic isDeleted,
    dynamic summaryDetailsCount,
    SplitBean? split,
  }) =>
      SummerDetails(
        id: id ?? this.id,
        splitID: splitID ?? this.splitID,
        summaryID: summaryID ?? this.summaryID,
        fromUserCode: fromUserCode ?? this.fromUserCode,
        toUserCode: toUserCode ?? this.toUserCode,
        amount: amount ?? this.amount,
        currencyCode: currencyCode ?? this.currencyCode,
        createDatetime: createDatetime ?? this.createDatetime,
        updateDatetime: updateDatetime ?? this.updateDatetime,
        isDeleted: isDeleted ?? this.isDeleted,
        summaryDetailsCount: summaryDetailsCount ?? this.summaryDetailsCount,
        split: split ?? this.split,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ID'] = id;
    map['SplitID'] = splitID;
    map['SummaryID'] = summaryID;
    map['FromUserCode'] = fromUserCode;
    map['ToUserCode'] = toUserCode;
    map['Amount'] = amount;
    map['CurrencyCode'] = currencyCode;
    map['CreateDatetime'] = createDatetime;
    map['UpdateDatetime'] = updateDatetime;
    map['IsDeleted'] = isDeleted;
    map['SummaryDetailsCount'] = summaryDetailsCount;

    map['Split'] = split?.toJson();
    return map;
  }
}

/// ID : 19546
/// UserCode : "1722597751178"
/// Email : "99ccngnjg6@privaterelay.appleid.com"
/// Password : null
/// Country : "Taiwan (Province of China)"
/// CountryCode : "TW"
/// Phone : null
/// Nickname : "MP_YPUGN"
/// Gender : null
/// AvatarUrl : null
/// Points : 0
/// IsVIP : null
/// FreeVipDays : null
/// VipExpiredDate : null
/// IsTried : 0
/// RegisterFrom : 3
/// InviteCode : null
/// RegistrationStatus : null
/// CreateDatetime : "2024-08-02T11:22:31.000Z"
/// UpdateDatetime : "2024-08-02T11:22:31.000Z"
/// AppleID : null
/// FacebookID : null
/// GoogleID : null
/// AppVersion : "1.0.1"
/// DeviceID : "1C6801C5-877F-456C-BA7D-79619AE7641D"
/// IsSplitGoUser : 1
/// SplitGoAppleID : "001417.aae8f9294c8b4d00895a1fcbdd7a827b.0458"
/// SplitGoFacebookID : null
/// SplitGoGoogleID : null
/// IsSplitGoVIP : null
/// FreeSplitGoVipDays : null
/// IsSplitGoTried : 0
/// IsDeleted : 0

/// ID : 19479
/// UserCode : "1716346370150"
/// Email : "2@q.com"
/// Password : "78aa2d7121e7e45c.8dc7e9e41e58a2cce3aa9cd100f39803a962d5cb4e98d0e32506ee4823092a16"
/// Country : "China"
/// CountryCode : "CN"
/// Phone : null
/// Nickname : "MP_TCGFS"
/// Gender : null
/// AvatarUrl : null
/// Points : 0
/// IsVIP : null
/// FreeVipDays : null
/// VipExpiredDate : null
/// IsTried : 0
/// RegisterFrom : 0
/// InviteCode : null
/// RegistrationStatus : null
/// CreateDatetime : "2024-05-22T02:52:50.000Z"
/// UpdateDatetime : "2024-05-22T02:54:29.000Z"
/// AppleID : null
/// FacebookID : null
/// GoogleID : null
/// AppVersion : null
/// DeviceID : null
/// IsSplitGoUser : 0
/// SplitGoAppleID : null
/// SplitGoFacebookID : null
/// SplitGoGoogleID : null
/// IsSplitGoVIP : null
/// FreeSplitGoVipDays : null
/// IsSplitGoTried : 0
/// IsDeleted : 0
