part of 'index.dart';

class CountryCodeManager {
  static final CountryCodeManager _instance = CountryCodeManager._();

  CountryCodeManager._();

  static CountryCodeManager get instance => _instance;

  List<CountryCodeModel> _countries = <CountryCodeModel>[];

  Future<void> _init() async {
    final resp = await getAssetsFile(Resource.assetsJsonCountryCodeJson);
    if (resp != null) {
      if (resp is List) {
        List<CountryCodeModel> data = resp
            .map((e) => CountryCodeModel.fromJson(e as Map<String, dynamic>))
            .toList();
        _countries = data;
      }
    }
  }

  static Future<dynamic> getAssetsFile(String path) async {
    var jsonValue = await rootBundle.loadString(path);
    dynamic data = json.decode(jsonValue);
    return data;
  }

  /// 获取系统中所有国家地区列表
  Future<List<CountryCodeModel>> get countries async {
    if (_countries.isEmpty) {
      await _init();
    }
    return _countries;
  }

  ///
  /// 获取当前用户的国家地区
  // Future<CountryCodeModel> get getCurrentUserCountry async {
  //   List<CountryCodeModel> list = await countries;
  //   CountryCodeModel? country = list.firstWhereOrNull(
  //       (e) => e.code == UserManager.instance.current.value.phoneArea);
  //   if (country != null) {
  //     return country;
  //   }
  //   return getDefaultCountry();
  // }

  CountryCodeModel getDefaultCountry() {
    return CountryCodeModel(
      name: '中国',
      code: '+86',
      countryCode: 'CN',
      flag: "https://flagcdn.com/w320/cn.png",
    );
  }
}
