/// id : 510
/// fromUid : 1
/// toUid : 5121
/// greet : "string"
/// status : 2
/// autoFlag : 0
/// dealTime : null
/// ip : null
/// mid : null
/// updateTime : "2025-04-18 09:29:37"
/// createTime : "2025-04-18 09:29:37"
/// nick : "快乐的猴子"
/// avatar : "https://minio.opghdm.cn/tio-domain/found/4ee105b0de974c15b15e71f56442a17b.png"
part of 'index.dart';

class ApplyFriendInfo {
  ApplyFriendInfo({
    this.id,
    this.fromUid,
    this.toUid,
    this.greet,
    this.status,
    this.autoFlag,
    this.dealTime,
    this.ip,
    this.mid,
    this.updateTime,
    this.createTime,
    this.nick,
    this.avatar,
  });

  ApplyFriendInfo.fromJson(dynamic json) {
    id = json['id'];
    fromUid = json['fromUid'];
    toUid = json['toUid'];
    greet = json['greet'];
    status = json['status'];
    autoFlag = json['autoFlag'];
    dealTime = json['dealTime'];
    ip = json['ip'];
    mid = json['mid'];
    updateTime = json['updateTime'];
    createTime = json['createTime'];
    nick = json['nick'];
    avatar = json['avatar'];
  }

  dynamic id;
  dynamic fromUid;
  dynamic toUid;
  dynamic greet;
  dynamic status;
  dynamic autoFlag;
  dynamic dealTime;
  dynamic ip;
  dynamic mid;
  dynamic updateTime;
  dynamic createTime;
  dynamic nick;
  dynamic avatar;

  ApplyFriendInfo copyWith({
    dynamic id,
    dynamic fromUid,
    dynamic toUid,
    dynamic greet,
    dynamic status,
    dynamic autoFlag,
    dynamic dealTime,
    dynamic ip,
    dynamic mid,
    dynamic updateTime,
    dynamic createTime,
    dynamic nick,
    dynamic avatar,
  }) =>
      ApplyFriendInfo(
        id: id ?? this.id,
        fromUid: fromUid ?? this.fromUid,
        toUid: toUid ?? this.toUid,
        greet: greet ?? this.greet,
        status: status ?? this.status,
        autoFlag: autoFlag ?? this.autoFlag,
        dealTime: dealTime ?? this.dealTime,
        ip: ip ?? this.ip,
        mid: mid ?? this.mid,
        updateTime: updateTime ?? this.updateTime,
        createTime: createTime ?? this.createTime,
        nick: nick ?? this.nick,
        avatar: avatar ?? this.avatar,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['fromUid'] = fromUid;
    map['toUid'] = toUid;
    map['greet'] = greet;
    map['status'] = status;
    map['autoFlag'] = autoFlag;
    map['dealTime'] = dealTime;
    map['ip'] = ip;
    map['mid'] = mid;
    map['updateTime'] = updateTime;
    map['createTime'] = createTime;
    map['nick'] = nick;
    map['avatar'] = avatar;
    return map;
  }
}
