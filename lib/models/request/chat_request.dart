/// channelType : "channelType"
/// channelId : "channelId"
/// mid : "mid"
/// compareType : "compareType"
/// pageSize : "pageSize"
/// sortType : "sortType"
///
///  @Schema(description = "1：私聊；2：群聊")
//     Integer channelType
part of '../index.dart';

class ChatRequest {
  ChatRequest(
      {this.channelType,
      this.channelId,
      this.mid,
      this.compareType,
      this.pageSize,
      this.sortType,
      this.title,
      this.avatar});

  ChatRequest.fromJson(dynamic json) {
    channelType = json['channelType'];
    channelId = json['channelId'];
    mid = json['mid'];
    compareType = json['compareType'];
    pageSize = json['pageSize'];
    sortType = json['sortType'];
  }

  dynamic channelType; ///@Schema(description = "1：私聊；2：群聊")
  dynamic channelId;
  dynamic mid;
  dynamic compareType;
  dynamic pageSize;
  dynamic sortType;
  String? title;
  String? avatar;

  ChatRequest copyWith({
    dynamic channelType,
    dynamic channelId,
    dynamic mid,
    dynamic compareType,
    dynamic pageSize,
    dynamic sortType,
  }) =>
      ChatRequest(
        channelType: channelType ?? this.channelType,
        channelId: channelId ?? this.channelId,
        mid: mid ?? this.mid,
        compareType: compareType ?? this.compareType,
        pageSize: pageSize ?? this.pageSize,
        sortType: sortType ?? this.sortType,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['channelType'] = channelType;
    map['channelId'] = channelId;
    map['mid'] = mid;
    map['compareType'] = compareType;
    map['pageSize'] = pageSize;
    map['sortType'] = sortType;
    return map;
  }

  Map<String, dynamic> toRequestJson() {
    final map = <String, dynamic>{};
    map['channelType'] = channelType;
    map['channelId'] = channelId;
    map['mid'] = mid ?? 0;
    map['compareType'] = compareType ?? "lt";
    map['pageSize'] = pageSize ?? 50;
    map['sortType'] = sortType ?? "desc";
    return map;
  }
}
