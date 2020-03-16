import UIKit
import Flutter
import OneSignal

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    //START OneSignal initialization code
    let onesignalInitSettings = [kOSSettingsKeyAutoPrompt: false]

    // Replace 'YOUR_APP_ID' with your OneSignal App ID.
//    OneSignal.initWithLaunchOptions(launchOptions,
//    appId: "df1b119e-14c3-4361-8a97-76ae9a827bf6",
//    handleNotificationAction: nil,
//    settings: onesignalInitSettings)
//
//    OneSignal.inFocusDisplayType = OSNotificationDisplayType.notification;
//    OneSignal.setLogLevel(.LL_WARN, visualLevel: .LL_INFO)
//
//    // Recommend moving the below line to prompt for push after informing the user about
//    //   how your app will use them.
//    OneSignal.promptForPushNotifications(userResponse: { accepted in
//    print("User accepted notifications: \(accepted)")
//    })
    //END OneSignal initializataion code
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
