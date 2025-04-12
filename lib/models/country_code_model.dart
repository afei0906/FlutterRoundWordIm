part of 'index.dart';
class CountryCodeModel {
  final String? code;
  final String? name;
  final String? countryCode;
  final String? flag;

  CountryCodeModel({
    this.code,
    this.name,
    this.countryCode,
    this.flag,
  });

  factory CountryCodeModel.fromJson(Map<String, dynamic> json) {
    return CountryCodeModel(
      code: json['code'] as String?,
      name: json['name'] as String?,
      countryCode: json['countryCode'] as String?,
      flag: json['flag'] as String?,
    );
  }
}
