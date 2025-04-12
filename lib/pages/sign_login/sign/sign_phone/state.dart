part of '../index.dart';
class SignPhoneState {
  CountryCodeModel countryCodeModel =
  CountryCodeManager.instance.getDefaultCountry();

  TextEditingController phoneController = TextEditingController();

  TextEditingController codeController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController prePasswordController = TextEditingController();

  TextEditingController nickController = TextEditingController();

  bool passwordObscureText = true;
  bool prePasswordObscureText = true;

  bool isLogin=false;

  RxBool isChecked=true.obs;

  String? inviteCode;
}
