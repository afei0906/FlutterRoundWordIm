/// friendId : 1
/// remarkName : ""
/// nick : "as"
/// avatar : "https://minio.opghdm.cn/tio-domain/found/4ee105b0de974c15b15e71f56442a17b.png"
/// phone : ""
/// remark : ""
/// status : 1
/// chatIndex : "K"
/// updatetime : "2025-04-10T12:35:41.000+00:00"
/// createtime : "2025-04-10T12:35:41.000+00:00"
part of 'index.dart';

class FriendInfo extends ISuspensionBean {
  FriendInfo({
    this.friendId,
    this.remarkName,
    this.showId,
    this.nick,
    this.avatar,
    this.phone,
    this.remark,
    this.status,
    this.chatIndex,
    this.updatetime,
    this.createtime,
  });

  FriendInfo.fromJson(dynamic json) {
    friendId = json['friendId'];
    remarkName = json['remarkName'];
    showId = json['showId'];
    nick = json['nick'];
    avatar = json['avatar'];
    phone = json['phone'];
    remark = json['remark'];
    status = json['status'];
    chatIndex = json['chatIndex'];
    updatetime = json['updatetime'];
    createtime = json['createtime'];
  }

  dynamic friendId;
  dynamic showId;
  dynamic remarkName;
  dynamic nick;
  dynamic avatar;
  dynamic phone;
  dynamic remark;
  dynamic status;
  dynamic chatIndex;
  dynamic updatetime;
  dynamic createtime;

  FriendInfo copyWith({
    dynamic friendId,
    dynamic remarkName,
    dynamic showId,
    dynamic nick,
    dynamic avatar,
    dynamic phone,
    dynamic remark,
    dynamic status,
    dynamic chatIndex,
    dynamic updatetime,
    dynamic createtime,
  }) =>
      FriendInfo(
        friendId: friendId ?? this.friendId,
        remarkName: remarkName ?? this.remarkName,
        showId: showId ?? this.showId,
        nick: nick ?? this.nick,
        avatar: avatar ?? this.avatar,
        phone: phone ?? this.phone,
        remark: remark ?? this.remark,
        status: status ?? this.status,
        chatIndex: chatIndex ?? this.chatIndex,
        updatetime: updatetime ?? this.updatetime,
        createtime: createtime ?? this.createtime,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['friendId'] = friendId;
    map['showId'] = showId;
    map['remarkName'] = remarkName;
    map['nick'] = nick;
    map['avatar'] = avatar;
    map['phone'] = phone;
    map['remark'] = remark;
    map['status'] = status;
    map['chatIndex'] = chatIndex;
    map['updatetime'] = updatetime;
    map['createtime'] = createtime;
    return map;
  }

  @override
  String getSuspensionTag() {
    // tag ?? =
    // if (Utils.isEmpty(chatIndex)) {
    //   final String pinyin = PinyinHelper.getPinyinE(nick.toString());
    //   String tag = pinyin.substring(0, 1).toUpperCase();
    //   if (!RegExp("[A-Z]").hasMatch(tag)) {
    //     tag = "#";
    //   }
    //   chatIndex ??= tag;
    // }
    return chatIndex.toString();
  }

  String getNick() {
    return Utils.toEmpty(nick) ?? '';
  }
}
