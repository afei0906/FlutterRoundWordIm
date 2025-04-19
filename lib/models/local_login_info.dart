/// type : 0
/// emailFirst : "xxx@example.com"
/// emailLast : "example.com"
/// phone : "1234567890"
/// phoneAre : "+86"
part of 'index.dart';

class LocalLoginInfo {
  LocalLoginInfo({
    this.type,
    this.emailFirst,
    this.emailLast,
    this.phone,
    this.phoneAre,
  });

  LocalLoginInfo.fromJson(dynamic json) {
    type = json['type'] as int?;
    emailFirst = json['emailFirst'] as String?;
    emailLast = json['emailLast'] as String?;
    phone = json['phone'] as String?;
    phoneAre = json['phoneAre'] as String?;
  }

  ///0 phone 1email
  int? type;
  String? emailFirst;
  String? emailLast;
  String? phone;
  String? phoneAre;

  LocalLoginInfo copyWith({
    int? type,
    String? emailFirst,
    String? emailLast,
    String? phone,
    String? phoneAre,
  }) =>
      LocalLoginInfo(
        type: type ?? this.type,
        emailFirst: emailFirst ?? this.emailFirst,
        emailLast: emailLast ?? this.emailLast,
        phone: phone ?? this.phone,
        phoneAre: phoneAre ?? this.phoneAre,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['emailFirst'] = emailFirst;
    map['emailLast'] = emailLast;
    map['phone'] = phone;
    map['phoneAre'] = phoneAre;
    return map;
  }
}
