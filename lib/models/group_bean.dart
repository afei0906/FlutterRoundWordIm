part of 'index.dart';

/// ID : 42
/// UserCode : "1714181702596"
/// Name : "290593204@QQ.COM,pinergetest@gmail.com,kefang2022@..."
/// TypeID : null
/// Image : null
/// CreateDatetime : "2024-05-31T15:20:38.000Z"
/// UpdateDatetime : "2024-05-31T15:20:38.000Z"
/// Relations : [{"ID":106,"UserCode":"1714181702596","GroupID":42,"Balance":[{"Amount":"16.66","CurrencyCode":"HKD"}],"CreateDatetime":"2024-05-31T15:20:38.000Z","User":{"ID":19465,"UserCode":"1714181702596","Email":"290593204@QQ.COM","Password":"14ab0ddc202ca0eb.0d5f11401332ec1100de7187545d2b7dd2ce78aaa0903895dbcde28b4a358dd3","Country":"Hong Kong","CountryCode":"HK","Phone":null,"Nickname":"MP_QERPD","Gender":null,"AvatarUrl":null,"Points":0,"IsVIP":null,"FreeVipDays":null,"VipExpiredDate":null,"IsTried":0,"RegisterFrom":0,"InviteCode":null,"RegistrationStatus":null,"CreateDatetime":"2024-04-27T01:35:02.000Z","UpdateDatetime":"2024-05-23T06:05:22.000Z","AppleID":null,"FacebookID":null,"GoogleID":null,"AppVersion":"1.0.0","IsDeleted":0}},{"ID":107,"UserCode":"1716604581664","GroupID":42,"Balance":[{"Amount":"-13.33","CurrencyCode":"HKD"}],"CreateDatetime":"2024-05-31T15:20:38.000Z","User":{"ID":19481,"UserCode":"1716604581664","Email":"pinergetest@gmail.com","Password":null,"Country":null,"CountryCode":null,"Phone":null,"Nickname":"MP_GDYNG","Gender":null,"AvatarUrl":null,"Points":0,"IsVIP":null,"FreeVipDays":null,"VipExpiredDate":null,"IsTried":0,"RegisterFrom":0,"InviteCode":"684b6de1-46bc-41ed-9ebd-2ce50c3aff9a","RegistrationStatus":0,"CreateDatetime":"2024-05-25T02:36:21.000Z","UpdateDatetime":"2024-05-25T02:36:21.000Z","AppleID":null,"FacebookID":null,"GoogleID":null,"AppVersion":null,"IsDeleted":0}},{"ID":108,"UserCode":"1716605950664","GroupID":42,"Balance":[{"Amount":"-3.33","CurrencyCode":"HKD"}],"CreateDatetime":"2024-05-31T15:20:38.000Z","User":{"ID":19482,"UserCode":"1716605950664","Email":"kefang2022@gmail.com","Password":null,"Country":null,"CountryCode":null,"Phone":null,"Nickname":"MP_TGTNI","Gender":null,"AvatarUrl":null,"Points":0,"IsVIP":null,"FreeVipDays":null,"VipExpiredDate":null,"IsTried":0,"RegisterFrom":0,"InviteCode":"aa123ed7-710d-4a92-8f40-1368f52babd0","RegistrationStatus":0,"CreateDatetime":"2024-05-25T02:59:10.000Z","UpdateDatetime":"2024-05-25T02:59:10.000Z","AppleID":null,"FacebookID":null,"GoogleID":null,"AppVersion":null,"IsDeleted":0}}]

GroupBean groupBeanFromJson(String str) => GroupBean.fromJson(json.decode(str));

String groupBeanToJson(GroupBean data) => json.encode(data.toJson());

class GroupBean {
  GroupBean({
    this.id,
    this.userCode,
    this.ownerUserCode,
    this.name,
    this.typeID,
    this.image,
    this.createDatetime,
    this.updateDatetime,
    this.relations,
  });

  GroupBean.fromJson(dynamic json) {
    id = json['ID'];
    userCode = json['UserCode'];
    ownerUserCode = json['OwnerUserCode'];
    name = json['Name'];
    typeID = json['TypeID'];
    image = json['Image'];
    createDatetime = json['CreateDatetime'];
    updateDatetime = json['UpdateDatetime'];
    if (json['Relations'] != null) {
      relations = [];
      json['Relations'].forEach((v) {
        relations?.add(Relations.fromJson(v));
      });
    }
  }

  dynamic id;
  dynamic userCode;
  dynamic ownerUserCode;
  dynamic name;
  dynamic typeID;
  dynamic image;
  dynamic createDatetime;
  dynamic updateDatetime;
  List<Relations>? relations;

  GroupBean copyWith({
    dynamic id,
    dynamic userCode,
    dynamic ownerUserCode,
    dynamic name,
    dynamic typeID,
    dynamic image,
    dynamic createDatetime,
    dynamic updateDatetime,
    List<Relations>? relations,
  }) =>
      GroupBean(
        id: id ?? this.id,
        userCode: userCode ?? this.userCode,
        ownerUserCode: ownerUserCode ?? this.ownerUserCode,
        name: name ?? this.name,
        typeID: typeID ?? this.typeID,
        image: image ?? this.image,
        createDatetime: createDatetime ?? this.createDatetime,
        updateDatetime: updateDatetime ?? this.updateDatetime,
        relations: relations ?? this.relations,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ID'] = id;
    map['UserCode'] = userCode;
    map['OwnerUserCode'] = ownerUserCode;
    map['Name'] = name;
    map['TypeID'] = typeID;
    map['Image'] = image;
    map['CreateDatetime'] = createDatetime;
    map['UpdateDatetime'] = updateDatetime;
    if (relations != null) {
      map['Relations'] = relations?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// ID : 106
/// UserCode : "1714181702596"
/// GroupID : 42
/// Balance : [{"Amount":"16.66","CurrencyCode":"HKD"}]
/// CreateDatetime : "2024-05-31T15:20:38.000Z"
/// User : {"ID":19465,"UserCode":"1714181702596","Email":"290593204@QQ.COM","Password":"14ab0ddc202ca0eb.0d5f11401332ec1100de7187545d2b7dd2ce78aaa0903895dbcde28b4a358dd3","Country":"Hong Kong","CountryCode":"HK","Phone":null,"Nickname":"MP_QERPD","Gender":null,"AvatarUrl":null,"Points":0,"IsVIP":null,"FreeVipDays":null,"VipExpiredDate":null,"IsTried":0,"RegisterFrom":0,"InviteCode":null,"RegistrationStatus":null,"CreateDatetime":"2024-04-27T01:35:02.000Z","UpdateDatetime":"2024-05-23T06:05:22.000Z","AppleID":null,"FacebookID":null,"GoogleID":null,"AppVersion":"1.0.0","IsDeleted":0}

Relations relationsFromJson(String str) => Relations.fromJson(json.decode(str));

String relationsToJson(Relations data) => json.encode(data.toJson());

class Relations {
  Relations({
    this.id,
    this.userCode,
    this.groupID,
    this.balance,
    this.createDatetime,
    this.remark,
    this.isFavorite,
    this.user,
  });

  Relations.fromJson(dynamic json) {
    id = json['ID'];
    userCode = json['UserCode'];
    groupID = json['GroupID'];
    if (json['Balance'] != null) {
      balance = [];
      json['Balance'].forEach((v) {
        balance?.add(Balance.fromJson(v));
      });
    }
    isFavorite = json['IsFavorite'];
    remark = json['Remark'];
    createDatetime = json['CreateDatetime'];
    user = json['User'] != null ? User.fromJson(json['User']) : null;
  }

  dynamic id;
  dynamic userCode;
  dynamic groupID;
  List<Balance>? balance;
  dynamic createDatetime;
  dynamic remark;
  dynamic isFavorite;

  User? user;

  Relations copyWith({
    dynamic id,
    dynamic userCode,
    dynamic groupID,
    List<Balance>? balance,
    dynamic createDatetime,
    String? remark,
    dynamic isFavorite,
    User? user,
  }) =>
      Relations(
        id: id ?? this.id,
        userCode: userCode ?? this.userCode,
        groupID: groupID ?? this.groupID,
        balance: balance ?? this.balance,
        createDatetime: createDatetime ?? this.createDatetime,
        remark: remark ?? this.remark,
        isFavorite: isFavorite ?? this.isFavorite,
        user: user ?? this.user,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ID'] = id;
    map['UserCode'] = userCode;
    map['GroupID'] = groupID;
    if (balance != null) {
      map['Balance'] = balance?.map((v) => v.toJson()).toList();
    }
    map['CreateDatetime'] = createDatetime;
    map['Remark'] = remark;
    map['IsFavorite'] = isFavorite;
    if (user != null) {
      map['User'] = user?.toJson();
    }
    return map;
  }
}

/// Amount : "16.66"
/// CurrencyCode : "HKD"

Balance balanceFromJson(String str) => Balance.fromJson(json.decode(str));

String balanceToJson(Balance data) => json.encode(data.toJson());

class Balance {
  Balance({
    this.amount,
    this.currencyCode,
  });

  Balance.fromJson(dynamic json) {
    amount = json['Amount'];
    currencyCode = json['CurrencyCode'];
  }

  dynamic amount;
  dynamic currencyCode;

  Balance copyWith({
    dynamic amount,
    dynamic currencyCode,
  }) =>
      Balance(
        amount: amount ?? this.amount,
        currencyCode: currencyCode ?? this.currencyCode,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Amount'] = amount;
    map['CurrencyCode'] = currencyCode;
    return map;
  }
}
