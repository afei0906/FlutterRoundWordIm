//
//  Generated code. Do not modify.
//  source: message.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use messageNotifyDescriptor instead')
const MessageNotify$json = {
  '1': 'MessageNotify',
  '2': [
    {'1': 'channel_type', '3': 1, '4': 1, '5': 5, '10': 'channelType'},
    {'1': 'channel_id', '3': 2, '4': 1, '5': 3, '10': 'channelId'},
    {'1': 'fid', '3': 3, '4': 1, '5': 9, '10': 'fid'},
    {'1': 'msg_type', '3': 4, '4': 1, '5': 5, '10': 'msgType'},
    {'1': 'oper', '3': 5, '4': 1, '5': 5, '10': 'oper'},
    {'1': 'biz_data', '3': 6, '4': 1, '5': 9, '10': 'bizData'},
    {'1': 'mid', '3': 7, '4': 1, '5': 3, '10': 'mid'},
    {'1': 'content', '3': 8, '4': 1, '5': 9, '10': 'content'},
    {'1': 'time', '3': 9, '4': 1, '5': 3, '10': 'time'},
    {'1': 'content_type', '3': 10, '4': 1, '5': 5, '10': 'contentType'},
    {'1': 'sys_flag', '3': 11, '4': 1, '5': 8, '10': 'sysFlag'},
    {'1': 'sys_msg_key', '3': 12, '4': 1, '5': 9, '10': 'sysMsgKey'},
    {'1': 'oper_nick', '3': 13, '4': 1, '5': 9, '10': 'operNick'},
    {'1': 'to_nicks', '3': 14, '4': 1, '5': 9, '10': 'toNicks'},
    {'1': 'server_ip', '3': 15, '4': 1, '5': 9, '10': 'serverIp'},
    {'1': 'trace_id', '3': 16, '4': 1, '5': 9, '10': 'traceId'},
    {'1': 'remark', '3': 17, '4': 1, '5': 9, '10': 'remark'},
    {'1': 'single_flag', '3': 18, '4': 1, '5': 8, '10': 'singleFlag'},
    {'1': 'single_uid', '3': 19, '4': 1, '5': 3, '10': 'singleUid'},
    {'1': 'from_msg_id', '3': 20, '4': 1, '5': 3, '10': 'fromMsgId'},
    {'1': 'reply_mid', '3': 21, '4': 1, '5': 3, '10': 'replyMid'},
    {'1': 'reply_msg_resume', '3': 22, '4': 1, '5': 9, '10': 'replyMsgResume'},
    {'1': 'reply_uid', '3': 23, '4': 1, '5': 3, '10': 'replyUid'},
    {'1': 'reply_nick', '3': 24, '4': 1, '5': 9, '10': 'replyNick'},
    {'1': 'nick', '3': 25, '4': 1, '5': 9, '10': 'nick'},
    {'1': 'avatar', '3': 26, '4': 1, '5': 9, '10': 'avatar'},
    {'1': 'from', '3': 27, '4': 1, '5': 3, '10': 'from'},
    {'1': 'uid', '3': 28, '4': 1, '5': 3, '10': 'uid'},
    {'1': 'at', '3': 29, '4': 1, '5': 9, '10': 'at'},
    {'1': 'read_flag', '3': 30, '4': 1, '5': 8, '10': 'readFlag'},
    {'1': 'read_time', '3': 31, '4': 1, '5': 3, '10': 'readTime'},
  ],
};

/// Descriptor for `MessageNotify`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageNotifyDescriptor = $convert.base64Decode(
    'Cg1NZXNzYWdlTm90aWZ5EiEKDGNoYW5uZWxfdHlwZRgBIAEoBVILY2hhbm5lbFR5cGUSHQoKY2'
    'hhbm5lbF9pZBgCIAEoA1IJY2hhbm5lbElkEhAKA2ZpZBgDIAEoCVIDZmlkEhkKCG1zZ190eXBl'
    'GAQgASgFUgdtc2dUeXBlEhIKBG9wZXIYBSABKAVSBG9wZXISGQoIYml6X2RhdGEYBiABKAlSB2'
    'JpekRhdGESEAoDbWlkGAcgASgDUgNtaWQSGAoHY29udGVudBgIIAEoCVIHY29udGVudBISCgR0'
    'aW1lGAkgASgDUgR0aW1lEiEKDGNvbnRlbnRfdHlwZRgKIAEoBVILY29udGVudFR5cGUSGQoIc3'
    'lzX2ZsYWcYCyABKAhSB3N5c0ZsYWcSHgoLc3lzX21zZ19rZXkYDCABKAlSCXN5c01zZ0tleRIb'
    'CglvcGVyX25pY2sYDSABKAlSCG9wZXJOaWNrEhkKCHRvX25pY2tzGA4gASgJUgd0b05pY2tzEh'
    'sKCXNlcnZlcl9pcBgPIAEoCVIIc2VydmVySXASGQoIdHJhY2VfaWQYECABKAlSB3RyYWNlSWQS'
    'FgoGcmVtYXJrGBEgASgJUgZyZW1hcmsSHwoLc2luZ2xlX2ZsYWcYEiABKAhSCnNpbmdsZUZsYW'
    'cSHQoKc2luZ2xlX3VpZBgTIAEoA1IJc2luZ2xlVWlkEh4KC2Zyb21fbXNnX2lkGBQgASgDUglm'
    'cm9tTXNnSWQSGwoJcmVwbHlfbWlkGBUgASgDUghyZXBseU1pZBIoChByZXBseV9tc2dfcmVzdW'
    '1lGBYgASgJUg5yZXBseU1zZ1Jlc3VtZRIbCglyZXBseV91aWQYFyABKANSCHJlcGx5VWlkEh0K'
    'CnJlcGx5X25pY2sYGCABKAlSCXJlcGx5TmljaxISCgRuaWNrGBkgASgJUgRuaWNrEhYKBmF2YX'
    'RhchgaIAEoCVIGYXZhdGFyEhIKBGZyb20YGyABKANSBGZyb20SEAoDdWlkGBwgASgDUgN1aWQS'
    'DgoCYXQYHSABKAlSAmF0EhsKCXJlYWRfZmxhZxgeIAEoCFIIcmVhZEZsYWcSGwoJcmVhZF90aW'
    '1lGB8gASgDUghyZWFkVGltZQ==');

