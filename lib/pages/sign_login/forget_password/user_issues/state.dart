part of '../index.dart';

class UserIssuesState {
  int backIndex = 0;

  ///1 手机，2email
  int formType = 1;

  CountryCodeModel countryCodeModel =
      CountryCodeManager.instance.getDefaultCountry();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailFirstController = TextEditingController();
  TextEditingController emailLastController = TextEditingController();

  RxList<CheckIssueList> userIssuesList = RxList();
  Map<int, TextEditingController> controllerMap = {};
  RxBool isSubmit = false.obs;
}
