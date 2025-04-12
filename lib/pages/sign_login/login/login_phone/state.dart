part of '../index.dart';

class LoginPhoneState {
  TextEditingController phoneController = TextEditingController();

  CountryCodeModel countryCodeModel =
      CountryCodeManager.instance.getDefaultCountry();

  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  bool isLogin = false;
}
