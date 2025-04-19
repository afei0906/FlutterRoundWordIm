part of '../index.dart';

class Urls {
  /// app 域名验证
  static const appVerify = 'app/verify';

  /// app配置
  static const appGetClientConf = 'app/getClientConf';

  /// 用户信息。进入APP调用
  static const userCurr = 'user/curr';

  ///
  static const emailCodeSend = 'emailCode/send';

  ///
  static const emailCodeCheck = 'emailCode/check';

  /// 检查verifyCode
  static const registerCheck = 'registerCheck';


  /// 滑动验证码
  static const anjiCaptchaGet = 'anjiCaptcha/get';

  /// 滑动验证码
  static const anjiCaptchaCheck = 'anjiCaptcha/check';

  /// 字典
  static const appDictItem = 'app/dictItem';

  /// 注册
  static const register = 'register';

  ///登录
  static const login = 'login';

  ///重置密码和密保
  static const resetPasswordByUserIssue = 'resetPasswordByUserIssue';

  ///查询用户密码问题
  static const getUserIssues = 'getUserIssues';


  ///保存用户密保问题
  static const saveUserIssues = 'user/security/saveUserIssues';

  ///保存用户密保问题
  static const resetPasswordByEmailVerifyCode = 'resetPasswordByEmailVerifyCode';



  ///查看签到规则
  static const getSignInRule = 'user/getSignInRule';

  ///签到
  static const signIn = 'user/signIn';






  ///好友列表
  static const myFriendList = 'friend/myFriendList';
  ///好友申请列表
  static const applyList = 'friend/applyList';
  ///好友申请
  static const apply = 'friend/apply';


  ///用户搜索
  static const userSearch = 'user/search';


  ///群组列表
  static const myGroupList = 'group/myGroupList';

  ///群组创建
  static const groupCreate = 'group/create';



  ///发现页列表
  static const discoveryPage = 'app/discoveryPage';

}
