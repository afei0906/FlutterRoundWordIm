//
//  Generated code. Do not modify.
//  source: message.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class MessageNotify extends $pb.GeneratedMessage {
  factory MessageNotify({
    $core.int? channelType,
    $fixnum.Int64? channelId,
    $core.String? fid,
    $core.int? msgType,
    $core.int? oper,
    $core.String? bizData,
    $fixnum.Int64? mid,
    $core.String? content,
    $fixnum.Int64? time,
    $core.int? contentType,
    $core.bool? sysFlag,
    $core.String? sysMsgKey,
    $core.String? operNick,
    $core.String? toNicks,
    $core.String? serverIp,
    $core.String? traceId,
    $core.String? remark,
    $core.bool? singleFlag,
    $fixnum.Int64? singleUid,
    $fixnum.Int64? fromMsgId,
    $fixnum.Int64? replyMid,
    $core.String? replyMsgResume,
    $fixnum.Int64? replyUid,
    $core.String? replyNick,
    $core.String? nick,
    $core.String? avatar,
    $fixnum.Int64? from,
    $fixnum.Int64? uid,
    $core.String? at,
    $core.bool? readFlag,
    $fixnum.Int64? readTime,
  }) {
    final $result = create();
    if (channelType != null) {
      $result.channelType = channelType;
    }
    if (channelId != null) {
      $result.channelId = channelId;
    }
    if (fid != null) {
      $result.fid = fid;
    }
    if (msgType != null) {
      $result.msgType = msgType;
    }
    if (oper != null) {
      $result.oper = oper;
    }
    if (bizData != null) {
      $result.bizData = bizData;
    }
    if (mid != null) {
      $result.mid = mid;
    }
    if (content != null) {
      $result.content = content;
    }
    if (time != null) {
      $result.time = time;
    }
    if (contentType != null) {
      $result.contentType = contentType;
    }
    if (sysFlag != null) {
      $result.sysFlag = sysFlag;
    }
    if (sysMsgKey != null) {
      $result.sysMsgKey = sysMsgKey;
    }
    if (operNick != null) {
      $result.operNick = operNick;
    }
    if (toNicks != null) {
      $result.toNicks = toNicks;
    }
    if (serverIp != null) {
      $result.serverIp = serverIp;
    }
    if (traceId != null) {
      $result.traceId = traceId;
    }
    if (remark != null) {
      $result.remark = remark;
    }
    if (singleFlag != null) {
      $result.singleFlag = singleFlag;
    }
    if (singleUid != null) {
      $result.singleUid = singleUid;
    }
    if (fromMsgId != null) {
      $result.fromMsgId = fromMsgId;
    }
    if (replyMid != null) {
      $result.replyMid = replyMid;
    }
    if (replyMsgResume != null) {
      $result.replyMsgResume = replyMsgResume;
    }
    if (replyUid != null) {
      $result.replyUid = replyUid;
    }
    if (replyNick != null) {
      $result.replyNick = replyNick;
    }
    if (nick != null) {
      $result.nick = nick;
    }
    if (avatar != null) {
      $result.avatar = avatar;
    }
    if (from != null) {
      $result.from = from;
    }
    if (uid != null) {
      $result.uid = uid;
    }
    if (at != null) {
      $result.at = at;
    }
    if (readFlag != null) {
      $result.readFlag = readFlag;
    }
    if (readTime != null) {
      $result.readTime = readTime;
    }
    return $result;
  }
  MessageNotify._() : super();
  factory MessageNotify.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MessageNotify.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MessageNotify', package: const $pb.PackageName(_omitMessageNames ? '' : 'org.globalim.gimclient'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'channelType', $pb.PbFieldType.O3)
    ..aInt64(2, _omitFieldNames ? '' : 'channelId')
    ..aOS(3, _omitFieldNames ? '' : 'fid')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'msgType', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'oper', $pb.PbFieldType.O3)
    ..aOS(6, _omitFieldNames ? '' : 'bizData')
    ..aInt64(7, _omitFieldNames ? '' : 'mid')
    ..aOS(8, _omitFieldNames ? '' : 'content')
    ..aInt64(9, _omitFieldNames ? '' : 'time')
    ..a<$core.int>(10, _omitFieldNames ? '' : 'contentType', $pb.PbFieldType.O3)
    ..aOB(11, _omitFieldNames ? '' : 'sysFlag')
    ..aOS(12, _omitFieldNames ? '' : 'sysMsgKey')
    ..aOS(13, _omitFieldNames ? '' : 'operNick')
    ..aOS(14, _omitFieldNames ? '' : 'toNicks')
    ..aOS(15, _omitFieldNames ? '' : 'serverIp')
    ..aOS(16, _omitFieldNames ? '' : 'traceId')
    ..aOS(17, _omitFieldNames ? '' : 'remark')
    ..aOB(18, _omitFieldNames ? '' : 'singleFlag')
    ..aInt64(19, _omitFieldNames ? '' : 'singleUid')
    ..aInt64(20, _omitFieldNames ? '' : 'fromMsgId')
    ..aInt64(21, _omitFieldNames ? '' : 'replyMid')
    ..aOS(22, _omitFieldNames ? '' : 'replyMsgResume')
    ..aInt64(23, _omitFieldNames ? '' : 'replyUid')
    ..aOS(24, _omitFieldNames ? '' : 'replyNick')
    ..aOS(25, _omitFieldNames ? '' : 'nick')
    ..aOS(26, _omitFieldNames ? '' : 'avatar')
    ..aInt64(27, _omitFieldNames ? '' : 'from')
    ..aInt64(28, _omitFieldNames ? '' : 'uid')
    ..aOS(29, _omitFieldNames ? '' : 'at')
    ..aOB(30, _omitFieldNames ? '' : 'readFlag')
    ..aInt64(31, _omitFieldNames ? '' : 'readTime')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MessageNotify clone() => MessageNotify()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MessageNotify copyWith(void Function(MessageNotify) updates) => super.copyWith((message) => updates(message as MessageNotify)) as MessageNotify;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MessageNotify create() => MessageNotify._();
  MessageNotify createEmptyInstance() => create();
  static $pb.PbList<MessageNotify> createRepeated() => $pb.PbList<MessageNotify>();
  @$core.pragma('dart2js:noInline')
  static MessageNotify getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MessageNotify>(create);
  static MessageNotify? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get channelType => $_getIZ(0);
  @$pb.TagNumber(1)
  set channelType($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChannelType() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannelType() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get channelId => $_getI64(1);
  @$pb.TagNumber(2)
  set channelId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChannelId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChannelId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get fid => $_getSZ(2);
  @$pb.TagNumber(3)
  set fid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFid() => $_has(2);
  @$pb.TagNumber(3)
  void clearFid() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get msgType => $_getIZ(3);
  @$pb.TagNumber(4)
  set msgType($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMsgType() => $_has(3);
  @$pb.TagNumber(4)
  void clearMsgType() => $_clearField(4);

  /// Code message for msg_type = 2
  @$pb.TagNumber(5)
  $core.int get oper => $_getIZ(4);
  @$pb.TagNumber(5)
  set oper($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOper() => $_has(4);
  @$pb.TagNumber(5)
  void clearOper() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get bizData => $_getSZ(5);
  @$pb.TagNumber(6)
  set bizData($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasBizData() => $_has(5);
  @$pb.TagNumber(6)
  void clearBizData() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get mid => $_getI64(6);
  @$pb.TagNumber(7)
  set mid($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMid() => $_has(6);
  @$pb.TagNumber(7)
  void clearMid() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get content => $_getSZ(7);
  @$pb.TagNumber(8)
  set content($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasContent() => $_has(7);
  @$pb.TagNumber(8)
  void clearContent() => $_clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get time => $_getI64(8);
  @$pb.TagNumber(9)
  set time($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasTime() => $_has(8);
  @$pb.TagNumber(9)
  void clearTime() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get contentType => $_getIZ(9);
  @$pb.TagNumber(10)
  set contentType($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasContentType() => $_has(9);
  @$pb.TagNumber(10)
  void clearContentType() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.bool get sysFlag => $_getBF(10);
  @$pb.TagNumber(11)
  set sysFlag($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasSysFlag() => $_has(10);
  @$pb.TagNumber(11)
  void clearSysFlag() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get sysMsgKey => $_getSZ(11);
  @$pb.TagNumber(12)
  set sysMsgKey($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasSysMsgKey() => $_has(11);
  @$pb.TagNumber(12)
  void clearSysMsgKey() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get operNick => $_getSZ(12);
  @$pb.TagNumber(13)
  set operNick($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasOperNick() => $_has(12);
  @$pb.TagNumber(13)
  void clearOperNick() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.String get toNicks => $_getSZ(13);
  @$pb.TagNumber(14)
  set toNicks($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasToNicks() => $_has(13);
  @$pb.TagNumber(14)
  void clearToNicks() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.String get serverIp => $_getSZ(14);
  @$pb.TagNumber(15)
  set serverIp($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasServerIp() => $_has(14);
  @$pb.TagNumber(15)
  void clearServerIp() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.String get traceId => $_getSZ(15);
  @$pb.TagNumber(16)
  set traceId($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasTraceId() => $_has(15);
  @$pb.TagNumber(16)
  void clearTraceId() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.String get remark => $_getSZ(16);
  @$pb.TagNumber(17)
  set remark($core.String v) { $_setString(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasRemark() => $_has(16);
  @$pb.TagNumber(17)
  void clearRemark() => $_clearField(17);

  @$pb.TagNumber(18)
  $core.bool get singleFlag => $_getBF(17);
  @$pb.TagNumber(18)
  set singleFlag($core.bool v) { $_setBool(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasSingleFlag() => $_has(17);
  @$pb.TagNumber(18)
  void clearSingleFlag() => $_clearField(18);

  @$pb.TagNumber(19)
  $fixnum.Int64 get singleUid => $_getI64(18);
  @$pb.TagNumber(19)
  set singleUid($fixnum.Int64 v) { $_setInt64(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasSingleUid() => $_has(18);
  @$pb.TagNumber(19)
  void clearSingleUid() => $_clearField(19);

  @$pb.TagNumber(20)
  $fixnum.Int64 get fromMsgId => $_getI64(19);
  @$pb.TagNumber(20)
  set fromMsgId($fixnum.Int64 v) { $_setInt64(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasFromMsgId() => $_has(19);
  @$pb.TagNumber(20)
  void clearFromMsgId() => $_clearField(20);

  @$pb.TagNumber(21)
  $fixnum.Int64 get replyMid => $_getI64(20);
  @$pb.TagNumber(21)
  set replyMid($fixnum.Int64 v) { $_setInt64(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasReplyMid() => $_has(20);
  @$pb.TagNumber(21)
  void clearReplyMid() => $_clearField(21);

  @$pb.TagNumber(22)
  $core.String get replyMsgResume => $_getSZ(21);
  @$pb.TagNumber(22)
  set replyMsgResume($core.String v) { $_setString(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasReplyMsgResume() => $_has(21);
  @$pb.TagNumber(22)
  void clearReplyMsgResume() => $_clearField(22);

  @$pb.TagNumber(23)
  $fixnum.Int64 get replyUid => $_getI64(22);
  @$pb.TagNumber(23)
  set replyUid($fixnum.Int64 v) { $_setInt64(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasReplyUid() => $_has(22);
  @$pb.TagNumber(23)
  void clearReplyUid() => $_clearField(23);

  @$pb.TagNumber(24)
  $core.String get replyNick => $_getSZ(23);
  @$pb.TagNumber(24)
  set replyNick($core.String v) { $_setString(23, v); }
  @$pb.TagNumber(24)
  $core.bool hasReplyNick() => $_has(23);
  @$pb.TagNumber(24)
  void clearReplyNick() => $_clearField(24);

  @$pb.TagNumber(25)
  $core.String get nick => $_getSZ(24);
  @$pb.TagNumber(25)
  set nick($core.String v) { $_setString(24, v); }
  @$pb.TagNumber(25)
  $core.bool hasNick() => $_has(24);
  @$pb.TagNumber(25)
  void clearNick() => $_clearField(25);

  @$pb.TagNumber(26)
  $core.String get avatar => $_getSZ(25);
  @$pb.TagNumber(26)
  set avatar($core.String v) { $_setString(25, v); }
  @$pb.TagNumber(26)
  $core.bool hasAvatar() => $_has(25);
  @$pb.TagNumber(26)
  void clearAvatar() => $_clearField(26);

  @$pb.TagNumber(27)
  $fixnum.Int64 get from => $_getI64(26);
  @$pb.TagNumber(27)
  set from($fixnum.Int64 v) { $_setInt64(26, v); }
  @$pb.TagNumber(27)
  $core.bool hasFrom() => $_has(26);
  @$pb.TagNumber(27)
  void clearFrom() => $_clearField(27);

  @$pb.TagNumber(28)
  $fixnum.Int64 get uid => $_getI64(27);
  @$pb.TagNumber(28)
  set uid($fixnum.Int64 v) { $_setInt64(27, v); }
  @$pb.TagNumber(28)
  $core.bool hasUid() => $_has(27);
  @$pb.TagNumber(28)
  void clearUid() => $_clearField(28);

  @$pb.TagNumber(29)
  $core.String get at => $_getSZ(28);
  @$pb.TagNumber(29)
  set at($core.String v) { $_setString(28, v); }
  @$pb.TagNumber(29)
  $core.bool hasAt() => $_has(28);
  @$pb.TagNumber(29)
  void clearAt() => $_clearField(29);

  @$pb.TagNumber(30)
  $core.bool get readFlag => $_getBF(29);
  @$pb.TagNumber(30)
  set readFlag($core.bool v) { $_setBool(29, v); }
  @$pb.TagNumber(30)
  $core.bool hasReadFlag() => $_has(29);
  @$pb.TagNumber(30)
  void clearReadFlag() => $_clearField(30);

  @$pb.TagNumber(31)
  $fixnum.Int64 get readTime => $_getI64(30);
  @$pb.TagNumber(31)
  set readTime($fixnum.Int64 v) { $_setInt64(30, v); }
  @$pb.TagNumber(31)
  $core.bool hasReadTime() => $_has(30);
  @$pb.TagNumber(31)
  void clearReadTime() => $_clearField(31);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
