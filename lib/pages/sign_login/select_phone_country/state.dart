part of 'index.dart';

class SelectPhoneCountryState {
  Rx<CountryCodeModel> countryCodeModel =
      CountryCodeManager.instance.getDefaultCountry().obs;
  TextEditingController searchController = TextEditingController();
  RxList<CountryCodeModel> CountryCodeModelList=RxList();
}
