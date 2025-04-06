part of 'index.dart';

/// unsettledGroupNames : ["group-0","vinx zzz, J77, 司家峰, 593093345, 290593204, wuyang3511","J77, vinx zzz, 司家峰, 593093345, 290593204, wuyang3511, Vinx Zhu, 1009828775","司家峰, 1009828775, ji12345, wuyang3511, 593093345, 290593204, Vinx Zhu, vinx zzz, J77"]
/// unsettledGroupCount : 4

LeaveWidthFriend leaveWidthFriendFromJson(String str) =>
    LeaveWidthFriend.fromJson(json.decode(str));

String leaveWidthFriendToJson(LeaveWidthFriend data) =>
    json.encode(data.toJson());

class LeaveWidthFriend {
  LeaveWidthFriend({
    this.unsettledGroupNames,
    this.unsettledGroupCount,
    this.type,
  });

  LeaveWidthFriend.fromJson(dynamic json) {
    unsettledGroupNames = (json['unsettledGroupNames'] != null
        ? json['unsettledGroupNames'].cast<String>()
        : []) as List<String>?;
    unsettledGroupCount = json['unsettledGroupCount'] as num?;
  }

  List<String>? unsettledGroupNames;
  num? unsettledGroupCount;
  int? type;

  LeaveWidthFriend copyWith({
    List<String>? unsettledGroupNames,
    num? unsettledGroupCount,
  }) =>
      LeaveWidthFriend(
        unsettledGroupNames: unsettledGroupNames ?? this.unsettledGroupNames,
        unsettledGroupCount: unsettledGroupCount ?? this.unsettledGroupCount,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['unsettledGroupNames'] = unsettledGroupNames;
    map['unsettledGroupCount'] = unsettledGroupCount;
    return map;
  }
}
