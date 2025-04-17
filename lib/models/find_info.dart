/// name : "string"
/// url : "string"
/// logo : "string"
part of 'index.dart';

class FindInfo {
  FindInfo({
    this.name,
    this.url,
    this.logo,
  });

  FindInfo.fromJson(dynamic json) {
    name = json['name'];
    url = json['url'];
    logo = json['logo'];
  }

  dynamic name;
  dynamic url;
  dynamic logo;

  FindInfo copyWith({
    dynamic name,
    dynamic url,
    dynamic logo,
  }) =>
      FindInfo(
        name: name ?? this.name,
        url: url ?? this.url,
        logo: logo ?? this.logo,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['url'] = url;
    map['logo'] = logo;
    return map;
  }
}
