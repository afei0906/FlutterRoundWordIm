part of 'index.dart';

abstract class Routes {
  static final RouteObserver<Route> observer = RouteObservers<Route>();
  static List<String> history = [];

  ///注册登录相关
  static const splash = '/splash';
  static const loginPhone = '/loginPhone';
  static const loginEmail = '/loginEmail';
  static const signPhone = '/signPhone';
  static const signEmail = '/signEmail';
  static const signSuss = '/signSuss';
  static const passWordProtect = '/passWordProtect';
  static const emailRest = '/emailRest';
  static const phoneRest = '/phoneRest';
  static const userIssues = '/userIssues';
  static const selectPhoneCountry = '/selectPhone';

  //

  ///消息聊天相关
  static const main = '/main';
  static const webView = '/webView';
  static const chatListPage = '/chatListPage';

  ///联系人相关
  static const addNewFriendPage = '/addNewFriendPage';
  static const groupListPage = '/groupListPage';

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
      name: emailRest,
      page: () => EmailRestPage(),
    ),
    GetPage(
      name: phoneRest,
      page: () => PhoneRestPage(),
    ),
    GetPage(
      name: userIssues,
      page: () => UserIssuesPage(),
    ),
    GetPage(
      name: main,
      page: () => const HomePage(),
    ),
    GetPage(
      name: chatListPage,
      page: () => ChatListPage(),
    ),
    GetPage(
      name: addNewFriendPage,
      page: () => AddNewFriendPage(),
    ),
    GetPage(
      name: groupListPage,
      page: () => GroupListPage(),
    ),
  ];
}
