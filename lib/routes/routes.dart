part of 'index.dart';

abstract class Routes {
  static final RouteObserver<Route> observer = RouteObservers<Route>();
  static List<String> history = [];

  static const splash = '/splash';
  static const loginPhone = '/loginPhone';
  static const loginEmail = '/loginEmail';
  static const signPhone = '/signPhone';
  static const signEmail = '/signEmail';
  static const signSuss = '/signSuss';
  static const passWordProtect = '/passWordProtect';
  static const selectPhoneCountry = '/selectPhoneCountryPage';
  static const forgetPassword = '/forgetPassword';
  static const main = '/main';
  static const webView = '/webView';

  static final List<GetPage> pages = [
    GetPage(
      name: splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: webView,
      page: () => WebViewPage(),
    ),
    GetPage(
      name: loginEmail,
      page: () => LoginEmailPage(),
    ),
    GetPage(
      name: loginPhone,
      page: () => LoginPhonePage(),
    ),
    GetPage(
      name: signPhone,
      page: () => SignPhonePage(),
    ),
    GetPage(
      name: selectPhoneCountry,
      page: () => SelectPhoneCountryPage(),
    ),
    GetPage(
      name: forgetPassword,
      page: () => ForgetPasswordPage(),
    ),
    GetPage(
      name: signEmail,
      page: () => SignEmailPage(),
    ),
    GetPage(
      name: signSuss,
      page: () => SignSussPage(),
    ),
    GetPage(
      name: passWordProtect,
      page: () => PassWordProtectPage(),
    ),
    GetPage(
      name: main,
      page: () => const HomePage(),
    ),
  ];
}
