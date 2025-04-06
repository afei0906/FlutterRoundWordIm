part of 'index.dart';

abstract class Routes {
  static final RouteObserver<Route> observer = RouteObservers<Route>();
  static List<String> history = [];

  static const splash = '/splash';
  static const login = '/login';
  static const sign = '/signPage';
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
      name: login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: sign,
      page: () => SignPage(),
    ),
    GetPage(
      name: main,
      page: () => const HomePage(),
    ),
  ];
}
