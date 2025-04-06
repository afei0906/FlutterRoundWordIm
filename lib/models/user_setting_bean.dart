part of 'index.dart';

/// UserCode : "1714049005950"
/// LanguageCode : "zh-cn"
/// CurrencyCode : "GBP"
/// FirstdayOfMonth : "1"
/// FirstdayOfWeek : "7"
/// DecimalDigits : "2"
/// MsgPush : "1"
/// ReminderPush : null
/// MailNotice : null
/// HideBalance : 0
/// CreateDatetime : "2024-04-25T12:43:25.000Z"
/// UpdateDatetime : "2024-06-03T08:28:35.000Z"
/// HasSetCurrency : "1"

UserSettingBean userSettingBeanFromJson(String str) =>
    UserSettingBean.fromJson(json.decode(str));

String userSettingBeanToJson(UserSettingBean data) =>
    json.encode(data.toJson());

class UserSettingBean {
  UserSettingBean(
      {this.userCode,
      this.languageCode,
      this.currencyCode,
      this.firstdayOfMonth,
      this.firstdayOfWeek,
      this.decimalDigits,
      this.msgPush,
      this.reminderPush,
      this.mailNotice,
      this.hideBalance,
      this.createDatetime,
      this.updateDatetime,
      this.hasSetCurrency,
      this.azureConnectionString});

  UserSettingBean.fromJson(dynamic json) {
    if (json == null) {
      return;
    }
    userCode = json['UserCode'];
    languageCode = json['LanguageCode'];
    currencyCode = json['CurrencyCode'];
    firstdayOfMonth = json['FirstdayOfMonth'];
    firstdayOfWeek = json['FirstdayOfWeek'];
    decimalDigits = json['DecimalDigits'];
    msgPush = json['MsgPush'];
    reminderPush = json['ReminderPush'];
    mailNotice = json['MailNotice'];
    hideBalance = json['HideBalance'];
    createDatetime = json['CreateDatetime'];
    updateDatetime = json['UpdateDatetime'];
    hasSetCurrency = json['HasSetCurrency'];
    azureConnectionString = json['AzureConnectionString'];
  }

  dynamic userCode;
  dynamic languageCode;
  dynamic currencyCode;
  dynamic firstdayOfMonth;
  dynamic firstdayOfWeek;
  dynamic decimalDigits;
  dynamic msgPush;
  dynamic reminderPush;
  dynamic mailNotice;
  dynamic hideBalance;
  dynamic createDatetime;
  dynamic updateDatetime;
  dynamic hasSetCurrency;
  dynamic azureConnectionString;

  UserSettingBean copyWith({
    dynamic userCode,
    dynamic languageCode,
    dynamic currencyCode,
    dynamic firstdayOfMonth,
    dynamic firstdayOfWeek,
    dynamic decimalDigits,
    dynamic msgPush,
    dynamic reminderPush,
    dynamic mailNotice,
    dynamic hideBalance,
    dynamic createDatetime,
    dynamic updateDatetime,
    dynamic hasSetCurrency,
    dynamic azureConnectionString,
  }) =>
      UserSettingBean(
        userCode: userCode ?? this.userCode,
        languageCode: languageCode ?? this.languageCode,
        currencyCode: currencyCode ?? this.currencyCode,
        firstdayOfMonth: firstdayOfMonth ?? this.firstdayOfMonth,
        firstdayOfWeek: firstdayOfWeek ?? this.firstdayOfWeek,
        decimalDigits: decimalDigits ?? this.decimalDigits,
        msgPush: msgPush ?? this.msgPush,
        reminderPush: reminderPush ?? this.reminderPush,
        mailNotice: mailNotice ?? this.mailNotice,
        hideBalance: hideBalance ?? this.hideBalance,
        createDatetime: createDatetime ?? this.createDatetime,
        updateDatetime: updateDatetime ?? this.updateDatetime,
        hasSetCurrency: hasSetCurrency ?? this.hasSetCurrency,
        azureConnectionString:
            azureConnectionString ?? this.azureConnectionString,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UserCode'] = userCode;
    map['LanguageCode'] = languageCode;
    map['CurrencyCode'] = currencyCode;
    map['FirstdayOfMonth'] = firstdayOfMonth;
    map['FirstdayOfWeek'] = firstdayOfWeek;
    map['DecimalDigits'] = decimalDigits;
    map['MsgPush'] = msgPush;
    map['ReminderPush'] = reminderPush;
    map['MailNotice'] = mailNotice;
    map['HideBalance'] = hideBalance;
    map['CreateDatetime'] = createDatetime;
    map['UpdateDatetime'] = updateDatetime;
    map['HasSetCurrency'] = hasSetCurrency;
    map['AzureConnectionString'] = azureConnectionString;

    return map;
  }
}
