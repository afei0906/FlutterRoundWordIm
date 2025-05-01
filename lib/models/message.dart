/// channelType : 2
/// channelId : 293
/// fid : null
/// msgType : null
/// oper : null
/// bizData : null
/// mid : 14
/// content : "\"test\" 邀请 \"nicks\" 加入了群聊"
/// time : 1745650643419
/// contentType : 1
/// sysFlag : 1
/// sysMsgKey : "create"
/// operNick : "test"
/// toNicks : "nicks"
/// serverIp : null
/// traceId : "12ab2b724d254f3ba45f2921d2325038"
/// remark : null
/// singleFlag : 0
/// singleUid : -1
/// fromMsgId : null
/// replyMid : null
/// replyMsgResume : null
/// replyUid : null
/// replyNick : null
/// nick : "test"
/// avatar : "https://minio.opghdm.cn/tio-domain/found/a6d222ae7a914dcfabc94a8129897ef0.jpg"
/// from : 5633
/// uid : null
/// at : null
/// localIpUtil : null
part of 'index.dart';

class Message {
  Message({
    this.channelType,
    this.channelId,
    this.fid,
    this.msgType,
    this.oper,
    this.bizData,
    this.mid,
    this.content,
    this.time,
    this.contentType,
    this.sysFlag,
    this.sysMsgKey,
    this.operNick,
    this.toNicks,
    this.serverIp,
    this.traceId,
    this.remark,
    this.singleFlag,
    this.singleUid,
    this.fromMsgId,
    this.replyMid,
    this.replyMsgResume,
    this.replyUid,
    this.replyNick,
    this.nick,
    this.avatar,
    this.from,
    this.uid,
    this.at,
    this.localIpUtil,
  });

  Message.fromJson(dynamic json) {
    channelType = json['channelType'];
    channelId = json['channelId'];
    fid = json['fid'];
    msgType = json['msgType'];
    oper = json['oper'];
    bizData = json['bizData'];
    mid = json['mid'];
    content = json['content'];
    time = json['time'];
    contentType = json['contentType'];
    sysFlag = json['sysFlag'];
    sysMsgKey = json['sysMsgKey'];
    operNick = json['operNick'];
    toNicks = json['toNicks'];
    serverIp = json['serverIp'];
    traceId = json['traceId'];
    remark = json['remark'];
    singleFlag = json['singleFlag'];
    singleUid = json['singleUid'];
    fromMsgId = json['fromMsgId'];
    replyMid = json['replyMid'];
    replyMsgResume = json['replyMsgResume'];
    replyUid = json['replyUid'];
    replyNick = json['replyNick'];
    nick = json['nick'];
    avatar = json['avatar'];
    from = json['from'];
    uid = json['uid'];
    at = json['at'];
    localIpUtil = json['localIpUtil'];
  }

  dynamic channelType;
  dynamic channelId;
  dynamic fid;
  dynamic msgType;
  dynamic oper;
  dynamic bizData;
  dynamic mid;
  dynamic content;
  dynamic time;
  dynamic contentType;
  dynamic sysFlag;
  dynamic sysMsgKey;
  dynamic operNick;
  dynamic toNicks;
  dynamic serverIp;
  dynamic traceId;
  dynamic remark;
  dynamic singleFlag;
  dynamic singleUid;
  dynamic fromMsgId;
  dynamic replyMid;
  dynamic replyMsgResume;
  dynamic replyUid;
  dynamic replyNick;
  dynamic nick;
  dynamic avatar;
  dynamic from;
  dynamic uid;
  dynamic at;
  dynamic localIpUtil;

  Message copyWith({
    dynamic channelType,
    dynamic channelId,
    dynamic fid,
    dynamic msgType,
    dynamic oper,
    dynamic bizData,
    dynamic mid,
    dynamic content,
    dynamic time,
    dynamic contentType,
    dynamic sysFlag,
    dynamic sysMsgKey,
    dynamic operNick,
    dynamic toNicks,
    dynamic serverIp,
    dynamic traceId,
    dynamic remark,
    dynamic singleFlag,
    dynamic singleUid,
    dynamic fromMsgId,
    dynamic replyMid,
    dynamic replyMsgResume,
    dynamic replyUid,
    dynamic replyNick,
    dynamic nick,
    dynamic avatar,
    dynamic from,
    dynamic uid,
    dynamic at,
    dynamic localIpUtil,
  }) =>
      Message(
        channelType: channelType ?? this.channelType,
        channelId: channelId ?? this.channelId,
        fid: fid ?? this.fid,
        msgType: msgType ?? this.msgType,
        oper: oper ?? this.oper,
        bizData: bizData ?? this.bizData,
        mid: mid ?? this.mid,
        content: content ?? this.content,
        time: time ?? this.time,
        contentType: contentType ?? this.contentType,
        sysFlag: sysFlag ?? this.sysFlag,
        sysMsgKey: sysMsgKey ?? this.sysMsgKey,
        operNick: operNick ?? this.operNick,
        toNicks: toNicks ?? this.toNicks,
        serverIp: serverIp ?? this.serverIp,
        traceId: traceId ?? this.traceId,
        remark: remark ?? this.remark,
        singleFlag: singleFlag ?? this.singleFlag,
        singleUid: singleUid ?? this.singleUid,
        fromMsgId: fromMsgId ?? this.fromMsgId,
        replyMid: replyMid ?? this.replyMid,
        replyMsgResume: replyMsgResume ?? this.replyMsgResume,
        replyUid: replyUid ?? this.replyUid,
        replyNick: replyNick ?? this.replyNick,
        nick: nick ?? this.nick,
        avatar: avatar ?? this.avatar,
        from: from ?? this.from,
        uid: uid ?? this.uid,
        at: at ?? this.at,
        localIpUtil: localIpUtil ?? this.localIpUtil,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['channelType'] = channelType;
    map['channelId'] = channelId;
    map['fid'] = fid;
    map['msgType'] = msgType;
    map['oper'] = oper;
    map['bizData'] = bizData;
    map['mid'] = mid;
    map['content'] = content;
    map['time'] = time;
    map['contentType'] = contentType;
    map['sysFlag'] = sysFlag;
    map['sysMsgKey'] = sysMsgKey;
    map['operNick'] = operNick;
    map['toNicks'] = toNicks;
    map['serverIp'] = serverIp;
    map['traceId'] = traceId;
    map['remark'] = remark;
    map['singleFlag'] = singleFlag;
    map['singleUid'] = singleUid;
    map['fromMsgId'] = fromMsgId;
    map['replyMid'] = replyMid;
    map['replyMsgResume'] = replyMsgResume;
    map['replyUid'] = replyUid;
    map['replyNick'] = replyNick;
    map['nick'] = nick;
    map['avatar'] = avatar;
    map['from'] = from;
    map['uid'] = uid;
    map['at'] = at;
    map['localIpUtil'] = localIpUtil;
    return map;
  }
}
