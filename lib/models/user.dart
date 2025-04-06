part of 'index.dart';

class UserModel {
  UserModel({this.ID, this.Email, this.token,this.isNewUser});

  UserModel.fromJson(dynamic json) {
    if (json == null) {
      return;
    }
    ID = json['ID'].toString();
    Email = json['Email'].toString();
    token = json['token'].toString();
    isNewUser = json['isNewUser'] as bool?;
    if (!Utils.isEmpty(json['useInfo'])) {
      useInfoBean = useInfoBeanFromJson(jsonEncode(json['useInfo']));
    }
    if (!Utils.isEmpty(json['userSetting'])) {
      userSetting = UserSettingBean.fromJson(json['userSetting']);
    }
  }

  String? ID;
  String? Email;
  String? token;
  bool? isNewUser;
  UseInfoBean? useInfoBean;
  UserSettingBean? userSetting;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ID'] = ID;
    map['Email'] = Email;
    map['token'] = token;
    map['isNewUser'] = isNewUser;
    map['useInfo'] = useInfoBean?.toJson();
    map['userSetting'] = userSetting?.toJson();
    return map;
  }
}

UseInfoBean useInfoBeanFromJson(String str) => UseInfoBean.fromJson(json.decode(str));
String useInfoBeanToJson(UseInfoBean data) => json.encode(data.toJson());
class UseInfoBean {
  UseInfoBean({
    this.id,
    this.userCode,
    this.email,
    this.country,
    this.countryCode,
    this.phone,
    this.nickname,
    this.gender,
    this.avatarUrl,
    this.points,
    this.isVIP,
    this.freeVipDays,
    this.vipExpiredDate,
    this.isTried,
    this.registerFrom,
    this.inviteCode,
    this.registrationStatus,
    this.createDatetime,
    this.updateDatetime,
    this.appleID,
    this.facebookID,
    this.googleID,
    this.appVersion,
    this.deviceID,
    this.fcmToken,
    this.isSplitGoUser,
    this.splitGoAppleID,
    this.splitGoFacebookID,
    this.splitGoGoogleID,
    this.isSplitGoVIP,
    this.freeSplitGoVipDays,
    this.isSplitGoTried,
    this.splitGoVip,});

  UseInfoBean.fromJson(dynamic json) {
    id = json['ID'] as  num?;
    userCode = json['UserCode'] as  String?;
    email = json['Email']  as  String?;
    country = json['Country'] as  String?;
    countryCode = json['CountryCode'] as  String?;
    phone = json['Phone'];
    nickname = json['Nickname'] as  String?;
    gender = json['Gender'];
    avatarUrl = json['AvatarUrl'];
    points = json['Points'] as  num?;
    isVIP = json['IsVIP'] as  num?;
    freeVipDays = json['FreeVipDays'];
    vipExpiredDate = json['VipExpiredDate'];
    isTried = json['IsTried'] as num?;
    registerFrom = json['RegisterFrom'] as  num?;
    inviteCode = json['InviteCode'];
    registrationStatus = json['RegistrationStatus'];
    createDatetime = json['CreateDatetime'] as  String?;
    updateDatetime = json['UpdateDatetime'] as  String?;
    appleID = json['AppleID'];
    facebookID = json['FacebookID'];
    googleID = json['GoogleID'];
    appVersion = json['AppVersion'] as  String?;
    deviceID = json['DeviceID'] as  String?;
    fcmToken = json['FcmToken'] as  String?;
    isSplitGoUser = json['IsSplitGoUser'] as  num?;
    splitGoAppleID = json['SplitGoAppleID'];
    splitGoFacebookID = json['SplitGoFacebookID'];
    splitGoGoogleID = json['SplitGoGoogleID'];
    isSplitGoVIP = json['IsSplitGoVIP'];
    freeSplitGoVipDays = json['FreeSplitGoVipDays'];
    isSplitGoTried = json['IsSplitGoTried'] as  num?;
    splitGoVip = json['SplitGoVip']==null?null:SplitGoVip.fromJson(json['SplitGoVip']);
  }
  num? id;
  String? userCode;
  String? email;
  String? country;
  String? countryCode;
  dynamic phone;
  String? nickname;
  dynamic gender;
  dynamic avatarUrl;
  num? points;
  num? isVIP;
  dynamic freeVipDays;
  dynamic vipExpiredDate;
  num? isTried;
  num? registerFrom;
  dynamic inviteCode;
  dynamic registrationStatus;
  String? createDatetime;
  String? updateDatetime;
  dynamic appleID;
  dynamic facebookID;
  dynamic googleID;
  String? appVersion;
  String? deviceID;
  String? fcmToken;
  num? isSplitGoUser;
  dynamic splitGoAppleID;
  dynamic splitGoFacebookID;
  dynamic splitGoGoogleID;
  dynamic isSplitGoVIP;
  dynamic freeSplitGoVipDays;
  num? isSplitGoTried;
  SplitGoVip? splitGoVip;
  UseInfoBean copyWith({  num? id,
    String? userCode,
    String? email,
    String? country,
    String? countryCode,
    dynamic phone,
    String? nickname,
    dynamic gender,
    dynamic avatarUrl,
    num? points,
    num? isVIP,
    dynamic freeVipDays,
    dynamic vipExpiredDate,
    num? isTried,
    num? registerFrom,
    dynamic inviteCode,
    dynamic registrationStatus,
    String? createDatetime,
    String? updateDatetime,
    dynamic appleID,
    dynamic facebookID,
    dynamic googleID,
    String? appVersion,
    String? deviceID,
    String? fcmToken,
    num? isSplitGoUser,
    dynamic splitGoAppleID,
    dynamic splitGoFacebookID,
    dynamic splitGoGoogleID,
    dynamic isSplitGoVIP,
    dynamic freeSplitGoVipDays,
    num? isSplitGoTried,
    SplitGoVip? splitGoVip,
  }) => UseInfoBean(  id: id ?? this.id,
    userCode: userCode ?? this.userCode,
    email: email ?? this.email,
    country: country ?? this.country,
    countryCode: countryCode ?? this.countryCode,
    phone: phone ?? this.phone,
    nickname: nickname ?? this.nickname,
    gender: gender ?? this.gender,
    avatarUrl: avatarUrl ?? this.avatarUrl,
    points: points ?? this.points,
    isVIP: isVIP ?? this.isVIP,
    freeVipDays: freeVipDays ?? this.freeVipDays,
    vipExpiredDate: vipExpiredDate ?? this.vipExpiredDate,
    isTried: isTried ?? this.isTried,
    registerFrom: registerFrom ?? this.registerFrom,
    inviteCode: inviteCode ?? this.inviteCode,
    registrationStatus: registrationStatus ?? this.registrationStatus,
    createDatetime: createDatetime ?? this.createDatetime,
    updateDatetime: updateDatetime ?? this.updateDatetime,
    appleID: appleID ?? this.appleID,
    facebookID: facebookID ?? this.facebookID,
    googleID: googleID ?? this.googleID,
    appVersion: appVersion ?? this.appVersion,
    deviceID: deviceID ?? this.deviceID,
    fcmToken: fcmToken ?? this.fcmToken,
    isSplitGoUser: isSplitGoUser ?? this.isSplitGoUser,
    splitGoAppleID: splitGoAppleID ?? this.splitGoAppleID,
    splitGoFacebookID: splitGoFacebookID ?? this.splitGoFacebookID,
    splitGoGoogleID: splitGoGoogleID ?? this.splitGoGoogleID,
    isSplitGoVIP: isSplitGoVIP ?? this.isSplitGoVIP,
    freeSplitGoVipDays: freeSplitGoVipDays ?? this.freeSplitGoVipDays,
    isSplitGoTried: isSplitGoTried ?? this.isSplitGoTried,
    splitGoVip: splitGoVip ?? this.splitGoVip,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ID'] = id;
    map['UserCode'] = userCode;
    map['Email'] = email;
    map['Country'] = country;
    map['CountryCode'] = countryCode;
    map['Phone'] = phone;
    map['Nickname'] = nickname;
    map['Gender'] = gender;
    map['AvatarUrl'] = avatarUrl;
    map['Points'] = points;
    map['IsVIP'] = isVIP;
    map['FreeVipDays'] = freeVipDays;
    map['VipExpiredDate'] = vipExpiredDate;
    map['IsTried'] = isTried;
    map['RegisterFrom'] = registerFrom;
    map['InviteCode'] = inviteCode;
    map['RegistrationStatus'] = registrationStatus;
    map['CreateDatetime'] = createDatetime;
    map['UpdateDatetime'] = updateDatetime;
    map['AppleID'] = appleID;
    map['FacebookID'] = facebookID;
    map['GoogleID'] = googleID;
    map['AppVersion'] = appVersion;
    map['DeviceID'] = deviceID;
    map['FcmToken'] = fcmToken;
    map['IsSplitGoUser'] = isSplitGoUser;
    map['SplitGoAppleID'] = splitGoAppleID;
    map['SplitGoFacebookID'] = splitGoFacebookID;
    map['SplitGoGoogleID'] = splitGoGoogleID;
    map['IsSplitGoVIP'] = isSplitGoVIP;
    map['FreeSplitGoVipDays'] = freeSplitGoVipDays;
    map['IsSplitGoTried'] = isSplitGoTried;
    map['SplitGoVip'] = splitGoVip?.toJson();
    return map;
  }


}


SplitGoVip splitGoVipFromJson(String str) => SplitGoVip.fromJson(json.decode(str));
String splitGoVipToJson(SplitGoVip data) => json.encode(data.toJson());
class SplitGoVip {
  SplitGoVip({
    this.id,
    this.userCode,
    this.startDate,
    this.expiredDate,
    this.subscriptionMethod,
    this.transactionId,
    this.purchaseToken,
    this.isTrialPeriod,
    this.createDatetime,
    this.updateDatetime,});

  SplitGoVip.fromJson(dynamic json) {
    id = json['ID'] as  num?;
    userCode = json['UserCode'] as  String?;
    startDate = json['StartDate'] as  String?;
    expiredDate = json['ExpiredDate'] as  String?;
    subscriptionMethod = json['SubscriptionMethod'];
    transactionId = json['TransactionId'];
    purchaseToken = json['PurchaseToken'];
    isTrialPeriod = json['IsTrialPeriod'];
    createDatetime = json['CreateDatetime'] as  String?;
    updateDatetime = json['UpdateDatetime'] as  String?;
  }
  num? id;
  String? userCode;
  String? startDate;
  String? expiredDate;
  dynamic subscriptionMethod;
  dynamic transactionId;
  dynamic purchaseToken;
  dynamic isTrialPeriod;
  String? createDatetime;
  String? updateDatetime;
  SplitGoVip copyWith({  num? id,
    String? userCode,
    String? startDate,
    String? expiredDate,
    dynamic subscriptionMethod,
    dynamic transactionId,
    dynamic purchaseToken,
    dynamic isTrialPeriod,
    String? createDatetime,
    String? updateDatetime,
  }) => SplitGoVip(  id: id ?? this.id,
    userCode: userCode ?? this.userCode,
    startDate: startDate ?? this.startDate,
    expiredDate: expiredDate ?? this.expiredDate,
    subscriptionMethod: subscriptionMethod ?? this.subscriptionMethod,
    transactionId: transactionId ?? this.transactionId,
    purchaseToken: purchaseToken ?? this.purchaseToken,
    isTrialPeriod: isTrialPeriod ?? this.isTrialPeriod,
    createDatetime: createDatetime ?? this.createDatetime,
    updateDatetime: updateDatetime ?? this.updateDatetime,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ID'] = id;
    map['UserCode'] = userCode;
    map['StartDate'] = startDate;
    map['ExpiredDate'] = expiredDate;
    map['SubscriptionMethod'] = subscriptionMethod;
    map['TransactionId'] = transactionId;
    map['PurchaseToken'] = purchaseToken;
    map['IsTrialPeriod'] = isTrialPeriod;
    map['CreateDatetime'] = createDatetime;
    map['UpdateDatetime'] = updateDatetime;
    return map;
  }

}