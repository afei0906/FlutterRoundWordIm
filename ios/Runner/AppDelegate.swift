import UIKit
import Flutter
import StoreKit
import Vision
import VisionKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let flutterEndine:FlutterEngine = FlutterEngine(name:"io.flutter",project:nil)
           flutterEndine.run(withEntrypoint: nil)
           var controller:FlutterViewController = FlutterViewController(engine: flutterEndine, nibName: nil, bundle: nil)
           controller = window.rootViewController as! FlutterViewController;
         GeneratedPluginRegistrant.register(with: self)
           if #available(iOS 10.0, *) {
             UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
           }
           let flutterEve = FlutterMethodChannel(name: "flutter_launcher", binaryMessenger:  controller as! FlutterBinaryMessenger)
           flutterEve.setMethodCallHandler{(call ,result) in
               if("inAppLaunch" == call.method){
                   if #available(iOS 10.3, *)  {
                     SKStoreReviewController.requestReview()
                  } else {
                      // Fallback on earlier versions
                  }
               }else if("appStore" == call.method){
                   //跳转到应用的AppStore页页面
                   // let urlString = "itms-apps://itunes.apple.com/app/id1662347500?action=write-review"
                   // let url = URL(string: urlString)
                   // UIApplication.shared.open(url!);
                   let str = "itms-apps://itunes.apple.com/app/id6503243223"
                   guard let url = URL(string: str) else { return }
                   let can = UIApplication.shared.canOpenURL(url)
                   if can {
                       if #available(iOS 10.0, *) {
                           UIApplication.shared.open(url, options: [:]) { (b) in
                               print("打开结果: \(b)")
                           }
                       } else {
                           //iOS 10 以前
                           UIApplication.shared.openURL(url)
                       }
                   }
               }else if("scanner" == call.method){
                   // Register your custom Flutter plugin
                   print("aaaaaaa");
                   if let registrar = controller.registrar(forPlugin: "SwiftScannerPlugin") {
                       if #available(iOS 13.0, *) {
                           print("aaaaaaa1111");
                           SwiftScannerPlugin.register(with: registrar)
                       } else {

                       }
                   }
               }

           }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
