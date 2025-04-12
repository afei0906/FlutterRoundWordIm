part of 'index.dart';

class SelectPhoneCountryLogic extends GetxController {
  final SelectPhoneCountryState state = SelectPhoneCountryState();

  @override
  void onInit() async {
    if (Get.arguments != null) {
      state.countryCodeModel.value = Get.arguments as CountryCodeModel;
    }
    state.CountryCodeModelList.addAll(
        await CountryCodeManager.instance.countries);
    super.onInit();
  }

  void onChanged() async {
    List<CountryCodeModel> list = await CountryCodeManager.instance.countries;
    if (state.searchController.text.isNotEmpty) {
      var evenList = list
          .where((action) =>
              (action.name ?? "").contains(state.searchController.text) ||
              (action.code ?? "").contains(state.searchController.text))
          .toList();
      state.CountryCodeModelList.clear();
      state.CountryCodeModelList.addAll(evenList);
    } else {
      state.CountryCodeModelList.clear();
      state.CountryCodeModelList.addAll(list);
    }
  }

  void selectCountryCodeModel(CountryCodeModel countryCodeModel) {
    state.countryCodeModel.value = countryCodeModel;
    Get.back(result: state.countryCodeModel.value);
  }
}
