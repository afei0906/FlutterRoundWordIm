part of 'index.dart';

/// ID : 36
/// UserCode : "1714181702596"
/// FriendUserCode : "1716604581664"
/// Status : null
/// Balance : [{"Amount":"13.33","CurrencyCode":"HKD"}]
/// CreateDatetime : "2024-05-25T02:36:21.000Z"
/// Friend : {"ID":19481,"UserCode":"1716604581664","Email":"pinergetest@gmail.com","Password":null,"Country":null,"CountryCode":null,"Phone":null,"Nickname":"MP_GDYNG","Gender":null,"AvatarUrl":null,"Points":0,"IsVIP":null,"FreeVipDays":null,"VipExpiredDate":null,"IsTried":0,"RegisterFrom":0,"InviteCode":"684b6de1-46bc-41ed-9ebd-2ce50c3aff9a","RegistrationStatus":0,"CreateDatetime":"2024-05-25T02:36:21.000Z","UpdateDatetime":"2024-05-25T02:36:21.000Z","AppleID":null,"FacebookID":null,"GoogleID":null,"AppVersion":null,"IsDeleted":0}
/// SplitList : [{"ID":163,"UserCode":"1714181702596","CategoryID":16,"GroupID":42,"Amount":"100.00","CurrencyCode":"HKD","Description":"typhoon ","Notes":"typhoon ","Date":"2024-06-17T00:00:00.000Z","Image":null,"IsSettleUp":0,"Details":[{"UserCode":"1714181702596","PaidAmount":"50","SplitAmount":"33.34"},{"UserCode":"1716604581664","PaidAmount":"20","SplitAmount":"33.33"},{"UserCode":"1716605950664","PaidAmount":"30","SplitAmount":"33.33"}],"Repayments":[{"Amount":"13.33","ToUserCode":"1714181702596","FromUserCode":"1716604581664"},{"Amount":"3.33","ToUserCode":"1714181702596","FromUserCode":"1716605950664"}],"Payments":null,"CreateDatetime":"2024-06-17T11:02:04.000Z","UpdateDatetime":"2024-06-17T11:02:04.000Z"}]

FriendsBean friendsBeanFromJson(String str) =>
    FriendsBean.fromJson(json.decode(str));

String friendsBeanToJson(FriendsBean data) => json.encode(data.toJson());

class FriendsBean {
  FriendsBean({
    this.id,
    this.userCode,
    this.friendUserCode,
    this.status,
    this.balance,
    this.createDatetime,
    this.friend,
    this.remark,
    this.isFavorite,
    this.isBlocked,
    this.splitList,
  });

  FriendsBean.fromJson(dynamic json) {
    id = json['ID'];
    userCode = json['UserCode'];
    friendUserCode = json['FriendUserCode'];
    status = json['Status'];
    if (json['Balance'] != null) {
      balance = [];
      json['Balance'].forEach((v) {
        balance?.add(Balance.fromJson(v));
      });
    }
    createDatetime = json['CreateDatetime'];
    isFavorite = json['IsFavorite'];
    isBlocked = json['IsBlocked'];
    remark = json['Remark'];
    friend = json['Friend'] != null ? User.fromJson(json['Friend']) : null;
    if (json['SplitList'] != null) {
      splitList = [];
      json['SplitList'].forEach((v) {
        splitList?.add(SplitBean.fromJson(v));
      });
    }
  }

  dynamic id;
  dynamic userCode;
  dynamic friendUserCode;
  dynamic status;
  List<Balance>? balance;
  dynamic createDatetime;
  dynamic remark;
  dynamic isFavorite;
  dynamic isBlocked;
  User? friend;
  List<SplitBean>? splitList;

  FriendsBean copyWith({
    dynamic id,
    dynamic userCode,
    dynamic friendUserCode,
    dynamic status,
    List<Balance>? balance,
    dynamic createDatetime,
    String? remark,
    dynamic isFavorite,
    dynamic isBlocked,
    User? friend,
    List<SplitBean>? splitList,
  }) =>
      FriendsBean(
        id: id ?? this.id,
        userCode: userCode ?? this.userCode,
        friendUserCode: friendUserCode ?? this.friendUserCode,
        status: status ?? this.status,
        balance: balance ?? this.balance,
        createDatetime: createDatetime ?? this.createDatetime,
        friend: friend ?? this.friend,
        remark: remark ?? this.remark,
        isBlocked: isBlocked ?? this.isBlocked,
        isFavorite: isFavorite ?? this.isFavorite,
        splitList: splitList ?? this.splitList,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ID'] = id;
    map['UserCode'] = userCode;
    map['FriendUserCode'] = friendUserCode;
    map['Status'] = status;
    if (balance != null) {
      map['Balance'] = balance?.map((v) => v.toJson()).toList();
    }
    map['CreateDatetime'] = createDatetime;
    map['Remark'] = remark;
    map['IsFavorite'] = isFavorite;
    map['IsBlocked'] = isBlocked;
    if (friend != null) {
      map['Friend'] = friend?.toJson();
    }
    if (splitList != null) {
      map['SplitList'] = splitList?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// ID : 163
/// UserCode : "1714181702596"
/// CategoryID : 16
/// GroupID : 42
/// Amount : "100.00"
/// CurrencyCode : "HKD"
/// Description : "typhoon "
/// Notes : "typhoon "
/// Date : "2024-06-17T00:00:00.000Z"
/// Image : null
/// IsSettleUp : 0
/// Details : [{"UserCode":"1714181702596","PaidAmount":"50","SplitAmount":"33.34"},{"UserCode":"1716604581664","PaidAmount":"20","SplitAmount":"33.33"},{"UserCode":"1716605950664","PaidAmount":"30","SplitAmount":"33.33"}]
/// Repayments : [{"Amount":"13.33","ToUserCode":"1714181702596","FromUserCode":"1716604581664"},{"Amount":"3.33","ToUserCode":"1714181702596","FromUserCode":"1716605950664"}]
/// Payments : null
/// CreateDatetime : "2024-06-17T11:02:04.000Z"
/// UpdateDatetime : "2024-06-17T11:02:04.000Z"

/// UserCode : "1714181702596"
/// PaidAmount : "50"
/// SplitAmount : "33.34"

Details detailsFromJson(String str) => Details.fromJson(json.decode(str));

String detailsToJson(Details data) => json.encode(data.toJson());

class Details {
  Details({
    this.userCode,
    this.paidAmount,
    this.splitAmount,
  });

  Details.fromJson(dynamic json) {
    userCode = json['UserCode'];
    paidAmount = json['PaidAmount'];
    splitAmount = json['SplitAmount'];
  }

  dynamic userCode;
  dynamic paidAmount;
  dynamic splitAmount;

  Details copyWith({
    dynamic userCode,
    dynamic paidAmount,
    dynamic splitAmount,
  }) =>
      Details(
        userCode: userCode ?? this.userCode,
        paidAmount: paidAmount ?? this.paidAmount,
        splitAmount: splitAmount ?? this.splitAmount,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UserCode'] = userCode;
    map['PaidAmount'] = paidAmount;
    map['SplitAmount'] = splitAmount;
    return map;
  }
}
