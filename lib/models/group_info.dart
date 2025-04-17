/// id : 9007199254740991
/// name : "string"
/// uid : 9007199254740991
/// avatar : "string"
/// notice : "string"
/// intro : "string"
/// maximum : 1073741824
/// useCard : 1073741824
/// historyItem : 1073741824
/// virtualHeadCount : 1073741824
/// createTime : "2025-04-17T11:34:43.622Z"
/// joinNum : 1073741824
part of 'index.dart';

class GroupInfo {
  GroupInfo({
    this.id,
    this.name,
    this.uid,
    this.avatar,
    this.notice,
    this.intro,
    this.maximum,
    this.useCard,
    this.historyItem,
    this.virtualHeadCount,
    this.createTime,
    this.joinNum,
  });

  GroupInfo.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    uid = json['uid'];
    avatar = json['avatar'];
    notice = json['notice'];
    intro = json['intro'];
    maximum = json['maximum'];
    useCard = json['useCard'];
    historyItem = json['historyItem'];
    virtualHeadCount = json['virtualHeadCount'];
    createTime = json['createTime'];
    joinNum = json['joinNum'];
  }

  dynamic id;
  dynamic name;
  dynamic uid;
  dynamic avatar;
  dynamic notice;
  dynamic intro;
  dynamic maximum;
  dynamic useCard;
  dynamic historyItem;
  dynamic virtualHeadCount;
  dynamic createTime;
  dynamic joinNum;

  GroupInfo copyWith({
    dynamic id,
    dynamic name,
    dynamic uid,
    dynamic avatar,
    dynamic notice,
    dynamic intro,
    dynamic maximum,
    dynamic useCard,
    dynamic historyItem,
    dynamic virtualHeadCount,
    dynamic createTime,
    dynamic joinNum,
  }) =>
      GroupInfo(
        id: id ?? this.id,
        name: name ?? this.name,
        uid: uid ?? this.uid,
        avatar: avatar ?? this.avatar,
        notice: notice ?? this.notice,
        intro: intro ?? this.intro,
        maximum: maximum ?? this.maximum,
        useCard: useCard ?? this.useCard,
        historyItem: historyItem ?? this.historyItem,
        virtualHeadCount: virtualHeadCount ?? this.virtualHeadCount,
        createTime: createTime ?? this.createTime,
        joinNum: joinNum ?? this.joinNum,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['uid'] = uid;
    map['avatar'] = avatar;
    map['notice'] = notice;
    map['intro'] = intro;
    map['maximum'] = maximum;
    map['useCard'] = useCard;
    map['historyItem'] = historyItem;
    map['virtualHeadCount'] = virtualHeadCount;
    map['createTime'] = createTime;
    map['joinNum'] = joinNum;
    return map;
  }
}
