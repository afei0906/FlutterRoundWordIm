part of 'index.dart';

class LocalNotification {
  //静态变量_notification，存储唯一对象
  static LocalNotification? _notification;

  static String? fcmToken;

  // notification的getter方法，通过LocalNotification.notification获取对象
  static LocalNotification get notification => _getNotification();

  //获取对象
  static LocalNotification _getNotification() {
    //使用私有的构造方法来创建对象
    _notification ??= LocalNotification._initialize();
    return _notification!;
  }

  FlutterLocalNotificationsPlugin np = FlutterLocalNotificationsPlugin();
  static FirebaseInAppMessaging fiam = FirebaseInAppMessaging.instance;

// 私有的自定义命名式构造方法，通过它实现一个类;
  LocalNotification._initialize() {
    //初始化本地通知。设置安卓的logo，iOS不需要设置
    np = FlutterLocalNotificationsPlugin();
    //不能通过自定义图片设置logo
    final android =
        const AndroidInitializationSettings('@mipmap/icon_notifications');
    final ios = const DarwinInitializationSettings();
    np.initialize(InitializationSettings(iOS: ios, android: android),
        onDidReceiveNotificationResponse: (d) {
      if (!Utils.isEmpty(d.payload)) {

      }
    },);
  }

  Future<void> send(
      {required String title, required String body, String? payload,}) async {
    //在iOS13以上需要申请权限
    np = FlutterLocalNotificationsPlugin();
    np
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
    // 构建描述，暂不需要另外修改
    final androidDetails = const AndroidNotificationDetails('ID', 'Name',
        importance: Importance.max, priority: Priority.high,);
    final iosDetails = const DarwinNotificationDetails();
    final details = NotificationDetails(android: androidDetails, iOS: iosDetails);
    //第一个参数为通知的id，不能重复，否则通知会被替换
    np.show(DateTime.now().millisecondsSinceEpoch >> 10, title, body, details,
        payload: payload,);
  }

  //添加推送相关信息
  static initializePushNotification() async {
    WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp();

    // LocalNotification.notification.send(
    //     title: '测试测试浿',
    //     body: '朝秦暮楚械');
    _getPushNotificationNews();
  }

//收到推送的信息
  static _getPushNotificationNews() async {
    //前台

  }


}
