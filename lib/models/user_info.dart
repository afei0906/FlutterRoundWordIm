/// id : 9007199254740991
/// loginName : "string"
/// email : "string"
/// phone : "string"
/// password : "string"
/// payPassword : "string"
/// level : 1073741824
/// inviteCode : "string"
/// inviteShow : 1073741824
/// parentInviteCode : "string"
/// pyramid : "string"
/// nick : "string"
/// avatar : "string"
/// avatarBig : "string"
/// searchFlag : 1073741824
/// msgRemindFlag : 1073741824
/// fdValidType : 1073741824
/// registerType : 1073741824
/// msgForbiddenFlag : 1073741824
/// phoneBindFlag : 1073741824
/// emailBindFlag : 1073741824
/// openFlag : 1073741824
/// openid : 9007199254740991
/// realNameFlag : 1073741824
/// remark : "string"
/// status : 1073741824
/// delFlag : 1073741824
/// idCard : "string"
/// name : "string"
/// signDay : 1073741824
/// isCreateGroup : 1073741824
/// isExclusivePacket : 1073741824
/// isGroupPacket : 1073741824
/// isFriendPacket : 1073741824
/// outUid : "string"
/// createTime : "2025-04-09T11:32:10.525Z"
/// updateTime : "2025-04-09T11:32:10.525Z"
/// showId : "string"
/// sex : 1073741824
part of 'index.dart';
class UserInfo {
  UserInfo({
      this.id, 
      this.loginName, 
      this.email, 
      this.phone, 
      this.password, 
      this.payPassword, 
      this.level, 
      this.inviteCode, 
      this.inviteShow, 
      this.parentInviteCode, 
      this.pyramid, 
      this.nick, 
      this.avatar, 
      this.avatarBig, 
      this.searchFlag, 
      this.msgRemindFlag, 
      this.fdValidType, 
      this.registerType, 
      this.msgForbiddenFlag, 
      this.phoneBindFlag, 
      this.emailBindFlag, 
      this.openFlag, 
      this.openid, 
      this.realNameFlag, 
      this.remark, 
      this.status, 
      this.delFlag, 
      this.idCard, 
      this.name, 
      this.signDay, 
      this.isCreateGroup, 
      this.isExclusivePacket, 
      this.isGroupPacket, 
      this.isFriendPacket, 
      this.outUid, 
      this.createTime, 
      this.updateTime, 
      this.showId,
       this.token,
      this.sex,});

  UserInfo.fromJson(dynamic json) {
    id = json['id'] as  dynamic;

    loginName = json['loginName'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    payPassword = json['payPassword'];
    level = json['level'];
    inviteCode = json['inviteCode'];
    inviteShow = json['inviteShow'];
    parentInviteCode = json['parentInviteCode'];
    pyramid = json['pyramid'];
    nick = json['nick'];
    avatar = json['avatar'];
    avatarBig = json['avatarBig'];
    searchFlag = json['searchFlag'];
    msgRemindFlag = json['msgRemindFlag'];
    fdValidType = json['fdValidType'];
    registerType = json['registerType'];
    msgForbiddenFlag = json['msgForbiddenFlag'];
    phoneBindFlag = json['phoneBindFlag'];
    emailBindFlag = json['emailBindFlag'];
    openFlag = json['openFlag'];
    openid = json['openid'];
    realNameFlag = json['realNameFlag'];
    remark = json['remark'];
    status = json['status'];
    delFlag = json['delFlag'];
    idCard = json['idCard'];
    name = json['name'];
    signDay = json['signDay'];
    isCreateGroup = json['isCreateGroup'];
    isExclusivePacket = json['isExclusivePacket'];
    isGroupPacket = json['isGroupPacket'];
    isFriendPacket = json['isFriendPacket'];
    outUid = json['outUid'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
    showId = json['showId'];
    sex = json['sex'];
    token= json['token'];
  }
  dynamic id;
  dynamic loginName;
  dynamic email;
  dynamic phone;
  dynamic password;
  dynamic payPassword;
  dynamic level;
  dynamic inviteCode;
  dynamic inviteShow;
  dynamic parentInviteCode;
  dynamic pyramid;
  dynamic nick;
  dynamic avatar;
  dynamic avatarBig;
  dynamic searchFlag;
  dynamic msgRemindFlag;
  dynamic fdValidType;
  dynamic registerType;
  dynamic msgForbiddenFlag;
  dynamic phoneBindFlag;
  dynamic emailBindFlag;
  dynamic openFlag;
  dynamic openid;
  dynamic realNameFlag;
  dynamic remark;
  dynamic status;
  dynamic delFlag;
  dynamic idCard;
  dynamic name;
  dynamic signDay;
  dynamic isCreateGroup;
  dynamic isExclusivePacket;
  dynamic isGroupPacket;
  dynamic isFriendPacket;
  dynamic outUid;
  dynamic createTime;
  dynamic updateTime;
  dynamic showId;
  dynamic token;
  dynamic sex;
UserInfo copyWith({  dynamic id,
  dynamic loginName,
  dynamic email,
  dynamic phone,
  dynamic password,
  dynamic payPassword,
  dynamic level,
  dynamic inviteCode,
  dynamic inviteShow,
  dynamic parentInviteCode,
  dynamic pyramid,
  dynamic nick,
  dynamic avatar,
  dynamic avatarBig,
  dynamic searchFlag,
  dynamic msgRemindFlag,
  dynamic fdValidType,
  dynamic registerType,
  dynamic msgForbiddenFlag,
  dynamic phoneBindFlag,
  dynamic emailBindFlag,
  dynamic openFlag,
  dynamic openid,
  dynamic realNameFlag,
  dynamic remark,
  dynamic status,
  dynamic delFlag,
  dynamic idCard,
  dynamic token,
  dynamic name,
  dynamic signDay,
  dynamic isCreateGroup,
  dynamic isExclusivePacket,
  dynamic isGroupPacket,
  dynamic isFriendPacket,
  dynamic outUid,
  dynamic createTime,
  dynamic updateTime,
  dynamic showId,
  dynamic sex,
}) => UserInfo(  id: id ?? this.id,
  loginName: loginName ?? this.loginName,
  email: email ?? this.email,
  phone: phone ?? this.phone,
  password: password ?? this.password,
  payPassword: payPassword ?? this.payPassword,
  level: level ?? this.level,
  inviteCode: inviteCode ?? this.inviteCode,
  inviteShow: inviteShow ?? this.inviteShow,
  parentInviteCode: parentInviteCode ?? this.parentInviteCode,
  pyramid: pyramid ?? this.pyramid,
  nick: nick ?? this.nick,
  avatar: avatar ?? this.avatar,
  avatarBig: avatarBig ?? this.avatarBig,
  searchFlag: searchFlag ?? this.searchFlag,
  msgRemindFlag: msgRemindFlag ?? this.msgRemindFlag,
  fdValidType: fdValidType ?? this.fdValidType,
  registerType: registerType ?? this.registerType,
  msgForbiddenFlag: msgForbiddenFlag ?? this.msgForbiddenFlag,
  phoneBindFlag: phoneBindFlag ?? this.phoneBindFlag,
  emailBindFlag: emailBindFlag ?? this.emailBindFlag,
  openFlag: openFlag ?? this.openFlag,
  openid: openid ?? this.openid,
  realNameFlag: realNameFlag ?? this.realNameFlag,
  remark: remark ?? this.remark,
  status: status ?? this.status,
  delFlag: delFlag ?? this.delFlag,
  idCard: idCard ?? this.idCard,
  name: name ?? this.name,
  signDay: signDay ?? this.signDay,
  isCreateGroup: isCreateGroup ?? this.isCreateGroup,
  isExclusivePacket: isExclusivePacket ?? this.isExclusivePacket,
  isGroupPacket: isGroupPacket ?? this.isGroupPacket,
  isFriendPacket: isFriendPacket ?? this.isFriendPacket,
  outUid: outUid ?? this.outUid,
  createTime: createTime ?? this.createTime,
  updateTime: updateTime ?? this.updateTime,
  showId: showId ?? this.showId,
  sex: sex ?? this.sex,
  token: token ?? this.token,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['loginName'] = loginName;
    map['email'] = email;
    map['phone'] = phone;
    map['password'] = password;
    map['payPassword'] = payPassword;
    map['level'] = level;
    map['inviteCode'] = inviteCode;
    map['inviteShow'] = inviteShow;
    map['parentInviteCode'] = parentInviteCode;
    map['pyramid'] = pyramid;
    map['nick'] = nick;
    map['avatar'] = avatar;
    map['avatarBig'] = avatarBig;
    map['searchFlag'] = searchFlag;
    map['msgRemindFlag'] = msgRemindFlag;
    map['fdValidType'] = fdValidType;
    map['registerType'] = registerType;
    map['msgForbiddenFlag'] = msgForbiddenFlag;
    map['phoneBindFlag'] = phoneBindFlag;
    map['emailBindFlag'] = emailBindFlag;
    map['openFlag'] = openFlag;
    map['openid'] = openid;
    map['realNameFlag'] = realNameFlag;
    map['remark'] = remark;
    map['status'] = status;
    map['delFlag'] = delFlag;
    map['idCard'] = idCard;
    map['name'] = name;
    map['signDay'] = signDay;
    map['isCreateGroup'] = isCreateGroup;
    map['isExclusivePacket'] = isExclusivePacket;
    map['isGroupPacket'] = isGroupPacket;
    map['isFriendPacket'] = isFriendPacket;
    map['outUid'] = outUid;
    map['createTime'] = createTime;
    map['updateTime'] = updateTime;
    map['showId'] = showId;
    map['sex'] = sex;
    map['token']=token;
    return map;
  }

}