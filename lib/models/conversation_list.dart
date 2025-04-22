///
///  /**
//      *
//      */
//     private Long id;
//
//     /**
//      * 用户uid
//      */
//     private Long uid;
//
//     /**
//      * 聊天模式：1：私聊；2：群聊
//      */
//     private Integer chatMode;
//
//     /**
//      * 业务id；私聊：touid；群聊：groupid
//      */
//     private Long bizId;
//
//     /**
//      * 关联关系id：群：群用户id；私聊：好友id
//      */
//     private Long linkId;
//
//     /**
//      * 好友组合uid的key-twouid
//      */
//     private String fidKey;
//
//     /**
//      * 角色：1：群主；2：成员
//      */
//     private Integer bizRole;
//
//     /**
//      * 群头像/好友头像
//      */
//     private String avatar;
//
//     /**
//      * 是否删除：1：是；0：否
//      */
//     private Integer delFlag;
//
//     /**
//      * 状态：1：正常；2：封停
//      */
//     private Integer status;
//
//     /**
//      * 群名称/私聊名称
//      */
//     private String name;
//
//     /**
//      * 是否置顶：1：是；0：否
//      */
//     private Integer topFlag;
//
//     /**
//      * 从哪个消息开始有阅读权限
//      */
//     private Long starMsgId;
//
//     /**
//      * 是否免打扰：1：是；0：否
//      */
//     private Integer msgFreeFlag;
//
//     /**
//      * 记录创建时间
//      */
//     private Date createTime;
//
//     /**
//      * 记录更新时间
//      */
//     private Date updateTime;
//
//
//     ////////////////////扩展
//
//     /**
//      * 未读消息id
//      */
//     Long notReadStartMsgId;
//
//     /**
//      * 未读数量
//      */
//     Long notReadCount;
//
//     /**
//      * 缩略文字
//      */
//     private String resume;
//
//     /**
//      * 内容类型，1、普通文本消息，2、超链接卡片消息，3、文件，4、音频，5、视频，6、图片，9、名片
//      */
//     private Integer contentType;
//
//
//     /**
//      * 该条消息是否由系统发出，譬如某某进入了群聊，1、系统发送；2、非系统发送
//      */
//     private Integer sysFlag;
//
//     /**
//      * 聊天时间
//      */
//     private Date time;
//
//     Long lastMsgId;
//
//     Long lastMsgUid;
//     String lastMsgNick;
//     id : 15052
/// uid : 5121
/// chatMode : 2
/// bizId : 282
/// linkId : null
/// fidKey : ""
/// bizRole : 2
/// avatar : "https://tio-test-domain.oss-ap-southeast-1.aliyuncs.com/group.jpg"
/// delFlag : 0
/// status : 1
/// name : "aa"
/// topFlag : 0
/// starMsgId : null
/// msgFreeFlag : 0
/// createTime : "2025-04-19T10:47:36.000+00:00"
/// updateTime : "2025-04-19T10:47:36.000+00:00"
/// notReadStartMsgId : 0
/// notReadCount : 1
/// resume : "\"as\" 邀请 \"nicks\" 加入了群聊"
/// contentType : 1
/// sysFlag : 1
/// time : "2025-04-19T10:47:36.414+00:00"
/// lastMsgId : 3
/// lastMsgUid : 4865
/// lastMsgNick : "as"
part of 'index.dart';

class ConversationList {
  ConversationList({
    this.id,
    this.uid,
    this.chatMode,
    this.bizId,
    this.linkId,
    this.fidKey,
    this.bizRole,
    this.avatar,
    this.delFlag,
    this.status,
    this.name,
    this.topFlag,
    this.starMsgId,
    this.msgFreeFlag,
    this.createTime,
    this.updateTime,
    this.notReadStartMsgId,
    this.notReadCount,
    this.resume,
    this.contentType,
    this.sysFlag,
    this.time,
    this.lastMsgId,
    this.lastMsgUid,
    this.lastMsgNick,
  });

  ConversationList.fromJson(dynamic json) {
    id = json['id'];
    uid = json['uid'];
    chatMode = json['chatMode'];
    bizId = json['bizId'];
    linkId = json['linkId'];
    fidKey = json['fidKey'];
    bizRole = json['bizRole'];
    avatar = json['avatar'];
    delFlag = json['delFlag'];
    status = json['status'];
    name = json['name'];
    topFlag = json['topFlag'];
    starMsgId = json['starMsgId'];
    msgFreeFlag = json['msgFreeFlag'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
    notReadStartMsgId = json['notReadStartMsgId'];
    notReadCount = json['notReadCount'];
    resume = json['resume'];
    contentType = json['contentType'];
    sysFlag = json['sysFlag'];
    time = json['time'];
    lastMsgId = json['lastMsgId'];
    lastMsgUid = json['lastMsgUid'];
    lastMsgNick = json['lastMsgNick'];
  }

  dynamic id;
  dynamic uid;
  dynamic chatMode;
  dynamic bizId;
  dynamic linkId;
  dynamic fidKey;
  dynamic bizRole;
  dynamic avatar;
  dynamic delFlag;
  dynamic status;
  dynamic name;
  dynamic topFlag;
  dynamic starMsgId;
  dynamic msgFreeFlag;
  dynamic createTime;
  dynamic updateTime;
  dynamic notReadStartMsgId;
  dynamic notReadCount;
  dynamic resume;
  dynamic contentType;
  dynamic sysFlag;
  dynamic time;
  dynamic lastMsgId;
  dynamic lastMsgUid;
  dynamic lastMsgNick;

  ConversationList copyWith({
    dynamic id,
    dynamic uid,
    dynamic chatMode,
    dynamic bizId,
    dynamic linkId,
    dynamic fidKey,
    dynamic bizRole,
    dynamic avatar,
    dynamic delFlag,
    dynamic status,
    dynamic name,
    dynamic topFlag,
    dynamic starMsgId,
    dynamic msgFreeFlag,
    dynamic createTime,
    dynamic updateTime,
    dynamic notReadStartMsgId,
    dynamic notReadCount,
    dynamic resume,
    dynamic contentType,
    dynamic sysFlag,
    dynamic time,
    dynamic lastMsgId,
    dynamic lastMsgUid,
    dynamic lastMsgNick,
  }) =>
      ConversationList(
        id: id ?? this.id,
        uid: uid ?? this.uid,
        chatMode: chatMode ?? this.chatMode,
        bizId: bizId ?? this.bizId,
        linkId: linkId ?? this.linkId,
        fidKey: fidKey ?? this.fidKey,
        bizRole: bizRole ?? this.bizRole,
        avatar: avatar ?? this.avatar,
        delFlag: delFlag ?? this.delFlag,
        status: status ?? this.status,
        name: name ?? this.name,
        topFlag: topFlag ?? this.topFlag,
        starMsgId: starMsgId ?? this.starMsgId,
        msgFreeFlag: msgFreeFlag ?? this.msgFreeFlag,
        createTime: createTime ?? this.createTime,
        updateTime: updateTime ?? this.updateTime,
        notReadStartMsgId: notReadStartMsgId ?? this.notReadStartMsgId,
        notReadCount: notReadCount ?? this.notReadCount,
        resume: resume ?? this.resume,
        contentType: contentType ?? this.contentType,
        sysFlag: sysFlag ?? this.sysFlag,
        time: time ?? this.time,
        lastMsgId: lastMsgId ?? this.lastMsgId,
        lastMsgUid: lastMsgUid ?? this.lastMsgUid,
        lastMsgNick: lastMsgNick ?? this.lastMsgNick,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['uid'] = uid;
    map['chatMode'] = chatMode;
    map['bizId'] = bizId;
    map['linkId'] = linkId;
    map['fidKey'] = fidKey;
    map['bizRole'] = bizRole;
    map['avatar'] = avatar;
    map['delFlag'] = delFlag;
    map['status'] = status;
    map['name'] = name;
    map['topFlag'] = topFlag;
    map['starMsgId'] = starMsgId;
    map['msgFreeFlag'] = msgFreeFlag;
    map['createTime'] = createTime;
    map['updateTime'] = updateTime;
    map['notReadStartMsgId'] = notReadStartMsgId;
    map['notReadCount'] = notReadCount;
    map['resume'] = resume;
    map['contentType'] = contentType;
    map['sysFlag'] = sysFlag;
    map['time'] = time;
    map['lastMsgId'] = lastMsgId;
    map['lastMsgUid'] = lastMsgUid;
    map['lastMsgNick'] = lastMsgNick;
    return map;
  }
}
