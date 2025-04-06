part of '../index.dart';

class Urls {
  ///登录
  static const login = 'app/login';

  ///Get user info
  static const userInfo = 'app/user-info';
  static const userSetting = 'app/user-setting';
  static const vipTrial = "app/vip-trial";
  //iOS支付
  static const appleReceipt = "app/verify-apple-receipt";

  //vip 支付接口
  static const vipSubscribe = "app/vip-subscribe";
  //vip 订单接口
  static const vipOrder = "app/vip-order";
  ///vip恢复购买
  static const vipRestore="app/vip-restore";

  // 注册
  static const register = "app/register";
  //删除用户
  static const relatedUser = "app/user-and-related-data";

  // 发送验证码
  static const sendVerifyEmail = "app/send-verify-email";

  //上传用户头像
  static const uploadAvatar = "app/upload-user-avatar";

  ///苹果隐私邮箱的账户绑定邮箱
  static const appBindEmail="app/apple/bind-email";

  /// 修改邮箱
  static const changeEmail = "app/change-email";


  // 校验验证码
  static const verifyEmail = "app/verify-email";

  // 修改密码
  static const changePassword = "app/change-password";

  // 忘记密码
  static const forgotPassword = "app/forgot-password";

  static const google = "app/sign-in-with-google";
  static const facebook = "app/sign-in-with-facebook";
  static const apple = "app/sign-in-with-apple";
  //更新Token
  static const refreshTokenApi = 'app/refresh-token';

  //意见回馈
  static const feedbacks = "app/feedbacks";

  //已读意见回馈
  static const feedbacksRead = "app/feedbacks/read";

  //查看消息是否已读
  static const unread = "app/unread";


  //用户类别
  static const categories = "app/user-categories";

  ///friends
  static const friends = 'app/friends';

  static const friendsBlocked = 'app/friends/blocked';

  ///reports
  static const reports = 'app/reports';

  ///splits
  static const splits = 'app/splits';

  ///leaveAllWithFriend
  static const leaveAllWithFriend = '/app/groups/leave-all-with-friend';




  ///未结清split
  static const splitsUnsettled = 'app/splits/unsettled';

  ///最近已结清的split，7天内的
  static const splitsRecent = 'app/splits/settled/recent';

  ///更早已结清的split，7天之前的
  static const splitsOlder = 'app/splits/settled/older';

  ///activities
  static const activities = 'app/splits/activities';

  ///exchangeRate
  static const exchangeRate = 'app/exchange-rate';

  ///currencies
  static const currencies = "app/currencies";

  ///groups
  static const groups = 'app/groups';

  ///groupsTypes
  static const groupsTypes = 'app/groups/types';


  ///settle-ups
  static const settle_ups = 'app/splits/settle-ups';



}
