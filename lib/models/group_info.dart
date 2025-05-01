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
  GroupInfo(
      {this.id,
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
      this.groupRole,
      this.groupDetail});

  void setGroupDetail(GroupDetail? groupDetail) {
    if (groupDetail != null) {
      avatar = groupDetail.avatar;
      name = groupDetail.name;
      joinNum = groupDetail.joinNum;
    }
    this.groupDetail = groupDetail;
  }

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
    groupRole = json['groupRole'];
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

  ///    1：群主；2：成员
  dynamic groupRole;
  GroupDetail? groupDetail;

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
    dynamic groupRole,
    GroupDetail? groupDetail,
  }) =>
      GroupInfo(
          id: id ?? this.id,
          groupRole: groupRole ?? this.groupRole,
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
          groupDetail: groupDetail ?? this.groupDetail);

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
    map['groupRole'] = groupRole;
    return map;
  }
}

class GroupDetail {
  GroupDetail({
    this.params,
    this.id,
    this.name,
    this.uid,
    this.joinMode,
    this.friendFlag,
    this.applyFlag,
    this.msgActFlag,
    this.avatar,
    this.notice,
    this.noticeRoll,
    this.noticeTime,
    this.status,
    this.autoFlag,
    this.avatarAutoFlag,
    this.intro,
    this.remark,
    this.maximum,
    this.useCard,
    this.showRedMsg,
    this.msgBack,
    this.newJoinHistoryCount,
    this.historyItem,
    this.virtualHeadCount,
    this.createTime,
    this.updateTime,
    this.showMember,
    this.realNameJoin,
    this.msgInterval,
    this.kickedJoin,
    this.modifyGroupNick,
    this.forbiddenFlag,
    this.joinNum,
  });

  GroupDetail.fromJson(dynamic json) {
    params = json['params'];
    id = json['id'];
    name = json['name'];
    uid = json['uid'];
    joinMode = json['joinMode'];
    friendFlag = json['friendFlag'];
    applyFlag = json['applyFlag'];
    msgActFlag = json['msgActFlag'];
    avatar = json['avatar'];
    notice = json['notice'];
    noticeRoll = json['noticeRoll'];
    noticeTime = json['noticeTime'];
    status = json['status'];
    autoFlag = json['autoFlag'];
    avatarAutoFlag = json['avatarAutoFlag'];
    intro = json['intro'];
    remark = json['remark'];
    maximum = json['maximum'];
    useCard = json['useCard'];
    showRedMsg = json['showRedMsg'];
    msgBack = json['msgBack'];
    newJoinHistoryCount = json['newJoinHistoryCount'];
    historyItem = json['historyItem'];
    virtualHeadCount = json['virtualHeadCount'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
    showMember = json['showMember'];
    realNameJoin = json['realNameJoin'];
    msgInterval = json['msgInterval'];
    kickedJoin = json['kickedJoin'];
    modifyGroupNick = json['modifyGroupNick'];
    forbiddenFlag = json['forbiddenFlag'];
    joinNum = json['joinNum'];
  }

  dynamic params;
  dynamic id;
  dynamic name;
  dynamic uid;
  dynamic joinMode;
  dynamic friendFlag;
  dynamic applyFlag;
  dynamic msgActFlag;
  dynamic avatar;
  dynamic notice;
  dynamic noticeRoll;
  dynamic noticeTime;
  dynamic status;
  dynamic autoFlag;
  dynamic avatarAutoFlag;
  dynamic intro;
  dynamic remark;
  dynamic maximum;
  dynamic useCard;
  dynamic showRedMsg;
  dynamic msgBack;
  dynamic newJoinHistoryCount;
  dynamic historyItem;
  dynamic virtualHeadCount;
  dynamic createTime;
  dynamic updateTime;
  dynamic showMember;
  dynamic realNameJoin;
  dynamic msgInterval;
  dynamic kickedJoin;
  dynamic modifyGroupNick;
  dynamic forbiddenFlag;
  dynamic joinNum;

  GroupDetail copyWith({
    dynamic params,
    dynamic id,
    dynamic name,
    dynamic uid,
    dynamic joinMode,
    dynamic friendFlag,
    dynamic applyFlag,
    dynamic msgActFlag,
    dynamic avatar,
    dynamic notice,
    dynamic noticeRoll,
    dynamic noticeTime,
    dynamic status,
    dynamic autoFlag,
    dynamic avatarAutoFlag,
    dynamic intro,
    dynamic remark,
    dynamic maximum,
    dynamic useCard,
    dynamic showRedMsg,
    dynamic msgBack,
    dynamic newJoinHistoryCount,
    dynamic historyItem,
    dynamic virtualHeadCount,
    dynamic createTime,
    dynamic updateTime,
    dynamic showMember,
    dynamic realNameJoin,
    dynamic msgInterval,
    dynamic kickedJoin,
    dynamic modifyGroupNick,
    dynamic forbiddenFlag,
    dynamic joinNum,
  }) =>
      GroupDetail(
        params: params ?? this.params,
        id: id ?? this.id,
        name: name ?? this.name,
        uid: uid ?? this.uid,
        joinMode: joinMode ?? this.joinMode,
        friendFlag: friendFlag ?? this.friendFlag,
        applyFlag: applyFlag ?? this.applyFlag,
        msgActFlag: msgActFlag ?? this.msgActFlag,
        avatar: avatar ?? this.avatar,
        notice: notice ?? this.notice,
        noticeRoll: noticeRoll ?? this.noticeRoll,
        noticeTime: noticeTime ?? this.noticeTime,
        status: status ?? this.status,
        autoFlag: autoFlag ?? this.autoFlag,
        avatarAutoFlag: avatarAutoFlag ?? this.avatarAutoFlag,
        intro: intro ?? this.intro,
        remark: remark ?? this.remark,
        maximum: maximum ?? this.maximum,
        useCard: useCard ?? this.useCard,
        showRedMsg: showRedMsg ?? this.showRedMsg,
        msgBack: msgBack ?? this.msgBack,
        newJoinHistoryCount: newJoinHistoryCount ?? this.newJoinHistoryCount,
        historyItem: historyItem ?? this.historyItem,
        virtualHeadCount: virtualHeadCount ?? this.virtualHeadCount,
        createTime: createTime ?? this.createTime,
        updateTime: updateTime ?? this.updateTime,
        showMember: showMember ?? this.showMember,
        realNameJoin: realNameJoin ?? this.realNameJoin,
        msgInterval: msgInterval ?? this.msgInterval,
        kickedJoin: kickedJoin ?? this.kickedJoin,
        modifyGroupNick: modifyGroupNick ?? this.modifyGroupNick,
        forbiddenFlag: forbiddenFlag ?? this.forbiddenFlag,
            joinNum: joinNum ?? this.joinNum,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['params'] = params;
    map['id'] = id;
    map['name'] = name;
    map['uid'] = uid;
    map['joinMode'] = joinMode;
    map['friendFlag'] = friendFlag;
    map['applyFlag'] = applyFlag;
    map['msgActFlag'] = msgActFlag;
    map['avatar'] = avatar;
    map['notice'] = notice;
    map['noticeRoll'] = noticeRoll;
    map['noticeTime'] = noticeTime;
    map['status'] = status;
    map['autoFlag'] = autoFlag;
    map['avatarAutoFlag'] = avatarAutoFlag;
    map['intro'] = intro;
    map['remark'] = remark;
    map['maximum'] = maximum;
    map['useCard'] = useCard;
    map['showRedMsg'] = showRedMsg;
    map['msgBack'] = msgBack;
    map['newJoinHistoryCount'] = newJoinHistoryCount;
    map['historyItem'] = historyItem;
    map['virtualHeadCount'] = virtualHeadCount;
    map['createTime'] = createTime;
    map['updateTime'] = updateTime;
    map['showMember'] = showMember;
    map['realNameJoin'] = realNameJoin;
    map['msgInterval'] = msgInterval;
    map['kickedJoin'] = kickedJoin;
    map['modifyGroupNick'] = modifyGroupNick;
    map['forbiddenFlag'] = forbiddenFlag;
    map['joinNum'] = joinNum;

    return map;
  }
}
