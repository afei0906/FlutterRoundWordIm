/// channelType : 1073741824
/// channelId : 9007199254740991
/// fid : "string"
/// replyMid : 9007199254740991
/// contentType : 1073741824
/// payload : "string"
/// at : "string"
///
/// channelTypeintegerint32
// channelIdintegerint64
// fidCollapse allstring
// 前端id
//
// replyMidCollapse allintegerint64
// 回复的消息id
//
// contentTypeCollapse allintegerint32
// /** int TEXT = 1; int FILE = 3; int AUDIO = 4; int VIDEO = 5; int IMG = 6; int INVITE_INTO_GROUP = 8; int MSG_CARD = 9; int CALL_VIDEO = 10; int CALL_AUDIO = 11; int REDPACKET = 12; int GROUP_APPLY = 13; int POSITION = 14; int MOMENT = 15; int LIKES = 16; int COMMENT = 17; int TRANSFER_MONEY = 18; int TEMPLATE = 88;
//
// payloadCollapse allstring
// 内容
//
// at  at就是艾特了谁，群聊时候会有，这个传用户id用逗号分割

part of '../index.dart';

class MessageRequest {
  MessageRequest({
    this.channelType,
    this.channelId,
    this.fid,
    this.replyMid,
    this.contentType,
    this.payload,
    this.at,
  });

  MessageRequest.fromJson(dynamic json) {
    channelType = json['channelType'];
    channelId = json['channelId'];
    fid = json['fid'];
    replyMid = json['replyMid'];
    contentType = json['contentType'];
    payload = json['payload'];
    at = json['at'];
  }

  dynamic channelType;
  dynamic channelId;
  dynamic fid;
  dynamic replyMid;
  dynamic contentType;
  dynamic payload;
  dynamic at;

  MessageRequest copyWith({
    dynamic channelType,
    dynamic channelId,
    dynamic fid,
    dynamic replyMid,
    dynamic contentType,
    dynamic payload,
    dynamic at,
  }) =>
      MessageRequest(
        channelType: channelType ?? this.channelType,
        channelId: channelId ?? this.channelId,
        fid: fid ?? this.fid,
        replyMid: replyMid ?? this.replyMid,
        contentType: contentType ?? this.contentType,
        payload: payload ?? this.payload,
        at: at ?? this.at,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['channelType'] = channelType;
    map['channelId'] = channelId;
    map['fid'] = fid;
    map['replyMid'] = replyMid;
    map['contentType'] = contentType;
    map['payload'] = payload;
    map['at'] = at;
    return map;
  }
}
