part of 'index.dart';

/// _id : "664adef2d714040982075639"
/// Type : "CreateExpense"
/// SourceType : 0
/// BelongUserCode : "1699360123"
/// BelongUserName : "MP_SJJVH"
/// SplitID : 30
/// SplitDesc : "1"
/// MemberUserCode : "1715671127882"
/// MemberUserName : "MP_NMIIB"
/// Repayments : [{"Amount":"0.5","ToUserCode":"1699360123","FromUserCode":"1715671127882"}]
/// Users : [{"UserCode":"1699360123","NetBalance":"0.5","OwedAmount":"0.5","PaidAmount":"1","RemainingBalance":"0"},{"UserCode":"1715671127882","NetBalance":"-0.5","OwedAmount":"0.5","PaidAmount":"0","RemainingBalance":0}]
/// GroupID : 16
/// GroupName : "1009828775@qq.com,1@q.com"
/// CreateUserCode : "1699360123"
/// CreateUserName : "MP_SJJVH"
/// CreateDatetime : "2024-05-20T05:26:10.136Z"
/// __v : 0

SplitActivity splitActivityFromJson(String str) =>
    SplitActivity.fromJson(json.decode(str));

String splitActivityToJson(SplitActivity data) => json.encode(data.toJson());

class SplitActivityType {
  static const String createExpense = 'CreateExpense';
  static const String updateExpense = 'UpdateExpense';
  static const String deleteExpense = 'DeleteExpense';
  static const String restoreExpense = 'RestoreExpense';
  static const String createGroup = 'CreateGroup';
  static const String deleteGroup = 'DeleteGroup';
  static const String restoreGroup = 'RestoreGroup';
  static const String joinGroup = 'JoinGroup';
  static const String leaveGroup = 'LeaveGroup';
  static const String addGroupMember = 'AddGroupMember';
  static const String removeGroupMember = 'RemoveGroupMember';
  static const String createSettleUpSummary = 'CreateSettleUpSummary';
  static const String deleteSettleUpSummary = 'DeleteSettleUpSummary';
  static const String createSettleUpDetail = 'CreateSettleUpDetail';
  static const String deleteSettleUpDetail = 'DeleteSettleUpDetail';
}

class SplitActivity {
  SplitActivity(
      {this.id,
      this.type,
      this.sourceType,
      this.belongUserCode,
      this.belongUserName,
      this.splitID,
      this.splitDesc,
      this.memberUserCode,
      this.memberUserName,
      this.repayments,
      this.users,
      this.groupID,
      this.groupName,
      this.settleUpDetailID,
      this.paymentID,
      this.createUserCode,
      this.createUserName,
      this.createDatetime,
      this.fromUserCode,
      this.fromUserName,
      this.toUserCode,
      this.toUserName,
      this.currencyCode,
      this.amount,
      this.settleUpSummaryID,
      this.v,
      this.isSettleUpSummaryDeleted});

  SplitActivity.fromJson(dynamic json) {
    id = json['_id'];
    type = json['Type'];
    sourceType = json['SourceType'];
    belongUserCode = json['BelongUserCode'];
    belongUserName = json['BelongUserName'];
    splitID = json['SplitID'];
    splitDesc = json['SplitDesc'];
    memberUserCode = json['MemberUserCode'];
    memberUserName = json['MemberUserName'];

    if (json['Repayments'] != null) {
      repayments = [];
      json['Repayments'].forEach((v) {
        repayments?.add(Repayments.fromJson(v));
      });
    }
    if (json['Users'] != null) {
      users = [];
      json['Users'].forEach((v) {
        users?.add(Users.fromJson(v));
      });
    }
    groupID = json['GroupID'];
    groupName = json['GroupName'];
    settleUpDetailID = json['SettleUpDetailID'];
    paymentID = json['PaymentID'];
    createUserCode = json['CreateUserCode'];
    createUserName = json['CreateUserName'];
    createDatetime = json['CreateDatetime'];
    fromUserCode = json['FromUserCode'];
    fromUserName = json['FromUserName'];
    toUserCode = json['ToUserCode'];
    toUserName = json['ToUserName'];
    currencyCode = json['CurrencyCode'];
    amount = json['Amount'];
    settleUpSummaryID = json['SettleUpSummaryID'];
    v = json['__v'];
    isSettleUpSummaryDeleted = json['IsSettleUpSummaryDeleted'];
  }

  dynamic id;
  dynamic type;
  dynamic sourceType;
  dynamic belongUserCode;
  dynamic belongUserName;
  dynamic splitID;
  dynamic splitDesc;
  dynamic memberUserCode;
  dynamic memberUserName;
  List<Repayments>? repayments;
  List<Users>? users;
  dynamic groupID;
  dynamic groupName;
  dynamic settleUpDetailID;
  dynamic paymentID;
  dynamic createUserCode;
  dynamic createUserName;
  dynamic createDatetime;
  dynamic fromUserCode;
  dynamic fromUserName;
  dynamic toUserCode;
  dynamic toUserName;
  dynamic currencyCode;
  dynamic amount;
  dynamic settleUpSummaryID;
  dynamic v;
  dynamic isSettleUpSummaryDeleted;

  SplitActivity copyWith({
    dynamic id,
    dynamic type,
    dynamic sourceType,
    dynamic belongUserCode,
    dynamic belongUserName,
    dynamic splitID,
    dynamic splitDesc,
    dynamic memberUserCode,
    dynamic memberUserName,
    List<Repayments>? repayments,
    List<Users>? users,
    dynamic groupID,
    dynamic groupName,
    dynamic settleUpDetailID,
    dynamic paymentID,
    dynamic createUserCode,
    dynamic createUserName,
    dynamic createDatetime,
    dynamic fromUserCode,
    dynamic fromUserName,
    dynamic toUserCode,
    dynamic toUserName,
    dynamic currencyCode,
    dynamic amount,
    dynamic settleUpSummaryID,
    dynamic v,
    dynamic isSettleUpSummaryDeleted,
  }) =>
      SplitActivity(
        id: id ?? this.id,
        type: type ?? this.type,
        sourceType: sourceType ?? this.sourceType,
        belongUserCode: belongUserCode ?? this.belongUserCode,
        belongUserName: belongUserName ?? this.belongUserName,
        splitID: splitID ?? this.splitID,
        splitDesc: splitDesc ?? this.splitDesc,
        memberUserCode: memberUserCode ?? this.memberUserCode,
        memberUserName: memberUserName ?? this.memberUserName,
        repayments: repayments ?? this.repayments,
        users: users ?? this.users,
        groupID: groupID ?? this.groupID,
        groupName: groupName ?? this.groupName,
        settleUpDetailID: settleUpDetailID ?? this.settleUpDetailID,
        paymentID: paymentID ?? this.paymentID,
        createUserCode: createUserCode ?? this.createUserCode,
        createUserName: createUserName ?? this.createUserName,
        createDatetime: createDatetime ?? this.createDatetime,
        fromUserCode: fromUserCode ?? this.fromUserCode,
        fromUserName: fromUserName ?? this.fromUserName,
        toUserCode: createUserName ?? this.toUserCode,
        toUserName: createDatetime ?? this.toUserName,
        currencyCode: currencyCode ?? this.currencyCode,
        amount: amount ?? this.amount,
        settleUpSummaryID: settleUpSummaryID ?? this.settleUpSummaryID,
        v: v ?? this.v,
        isSettleUpSummaryDeleted:
            isSettleUpSummaryDeleted ?? this.isSettleUpSummaryDeleted,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['Type'] = type;
    map['SourceType'] = sourceType;
    map['BelongUserCode'] = belongUserCode;
    map['BelongUserName'] = belongUserName;
    map['SplitID'] = splitID;
    map['SplitDesc'] = splitDesc;
    map['MemberUserCode'] = memberUserCode;
    map['MemberUserName'] = memberUserName;
    if (repayments != null) {
      map['Repayments'] = repayments?.map((v) => v.toJson()).toList();
    }
    if (users != null) {
      map['Users'] = users?.map((v) => v.toJson()).toList();
    }
    map['GroupID'] = groupID;
    map['GroupName'] = groupName;
    map['SettleUpDetailID'] = settleUpDetailID;
    map['PaymentID'] = paymentID;
    map['CreateUserCode'] = createUserCode;
    map['CreateUserName'] = createUserName;
    map['CreateDatetime'] = createDatetime;
    map['FromUserCode'] = fromUserCode;
    map['FromUserName'] = fromUserName;
    map['ToUserCode'] = toUserCode;
    map['ToUserName'] = toUserName;
    map['CurrencyCode'] = currencyCode;
    map['Amount'] = amount;
    map['SettleUpSummaryID'] = settleUpSummaryID;
    map['__v'] = v;
    map['IsSettleUpSummaryDeleted'] = isSettleUpSummaryDeleted;

    return map;
  }
}

/// UserCode : "1699360123"
/// NetBalance : "0.5"
/// OwedAmount : "0.5"
/// PaidAmount : "1"
/// RemainingBalance : "0"

/// Amount : "0.5"
/// ToUserCode : "1699360123"
/// FromUserCode : "1715671127882"
