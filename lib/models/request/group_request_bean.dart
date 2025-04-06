part of '../index.dart';

/// Name : "Group 1"
/// TypeID : 1
/// Image : "split-8d23d905-0021-4e89-b57e-622e1e96e58a.png"
/// Members : [{"Nickname":"1","Email":"1@q.com"}]

GroupRequestBean groupRequestBeanFromJson(String str) =>
    GroupRequestBean.fromJson(json.decode(str));

String groupRequestBeanToJson(GroupRequestBean data) =>
    json.encode(data.toJson());

class GroupRequestBean {
  GroupRequestBean({
    this.name,
    this.typeID,
    this.image,
    this.members,
  });

  GroupRequestBean.fromJson(dynamic json) {
    name = json['Name'];
    typeID = json['TypeID'];
    image = json['Image'];
    if (json['Members'] != null) {
      members = [];
      json['Members'].forEach((v) {
        members?.add(Members.fromJson(v));
      });
    }
  }

  dynamic name;
  dynamic typeID;
  dynamic image;
  List<Members>? members;

  GroupRequestBean copyWith({
    dynamic name,
    dynamic typeID,
    dynamic image,
    List<Members>? members,
  }) =>
      GroupRequestBean(
        name: name ?? this.name,
        typeID: typeID ?? this.typeID,
        image: image ?? this.image,
        members: members ?? this.members,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Name'] = name;
    map['TypeID'] = typeID;
    map['Image'] = image;
    if (members != null) {
      map['Members'] = members?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// Nickname : "1"
/// Email : "1@q.com"

Members membersFromJson(String str) => Members.fromJson(json.decode(str));

String membersToJson(Members data) => json.encode(data.toJson());

class Members {
  Members({
    this.nickname,
    this.email,
  });

  Members.fromJson(dynamic json) {
    nickname = json['Nickname'];
    email = json['Email'];
  }

  dynamic nickname;
  dynamic email;

  Members copyWith({
    dynamic nickname,
    dynamic email,
  }) =>
      Members(
        nickname: nickname ?? this.nickname,
        email: email ?? this.email,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Nickname'] = nickname;
    map['Email'] = email;
    return map;
  }
}
