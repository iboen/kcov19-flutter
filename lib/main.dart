import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kawalcovid19/blocs/post/bloc.dart';
import 'package:kawalcovid19/common/color_palettes.dart';
import 'package:kawalcovid19/common/firebase_notification_handler.dart';
import 'package:kawalcovid19/const/app_constant.dart';
import 'package:kawalcovid19/network/repository/kcov_repository.dart';
import 'package:kawalcovid19/ui/about/about_page.dart';
// import 'package:kawalcovid19/common/firebase_notification_handler.dart';
import 'package:kawalcovid19/ui/dashboard/dashboard_page.dart';
import 'package:kawalcovid19/blocs/SimpleBlocDelegate.dart';
import 'package:kawalcovid19/ui/home/detail_article.dart';
import 'package:kawalcovid19/ui/more/about_dev_page.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  // BlocSupervisor oversees Blocs and delegates to BlocDelegate.
  // We can set the BlocSupervisor's delegate to an instance of `SimpleBlocDelegate`.
  // This will allow us to handle all transitions and errors in SimpleBlocDelegate.
  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // "true" for darkTheme, "false" for lightTheme
  bool isDark = true;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:
          isDark ? ColorPalettes.darkPrimary : ColorPalettes.lightPrimary,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
    ));

    //Setup One Signal
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    if (!mounted) return;

    OneSignal.shared.setLogLevel(OSLogLevel.none, OSLogLevel.none);

    var settings = {
      OSiOSSettings.autoPrompt: false,
      OSiOSSettings.promptBeforeOpeningPushUrl: true
    };

    OneSignal.shared.setNotificationReceivedHandler((OSNotification notification) {
      print("Received notification: \n${notification.jsonRepresentation().replaceAll("\\n", "\n")}");
    });

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
          print("Opened notification: \n${result.notification.jsonRepresentation().replaceAll("\\n", "\n")}");
    });

    OneSignal.shared
    .setInAppMessageClickedHandler((OSInAppMessageAction action) {
      print( "In App Message Clicked: \n${action.jsonRepresentation().replaceAll("\\n", "\n")}");
    });

    OneSignal.shared
        .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
      print("SUBSCRIPTION STATE CHANGED: ${changes.jsonRepresentation()}");
    });

    bool requiresConsent = await OneSignal.shared.requiresUserPrivacyConsent();
     print("REQUIRES CONSENT $requiresConsent");


    OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
      print("PERMISSION STATE CHANGED: ${changes.jsonRepresentation()}");
    });

    OneSignal.shared.setEmailSubscriptionObserver(
        (OSEmailSubscriptionStateChanges changes) {
      print("EMAIL SUBSCRIPTION STATE CHANGED ${changes.jsonRepresentation()}");
    });

    // NOTE: Replace with your own app ID from https://www.onesignal.com
    await OneSignal.shared.init("df1b119e-14c3-4361-8a97-76ae9a827bf6", iOSSettings: settings);

    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);

  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstant.appName,
      theme: isDark ? ColorPalettes.darkTheme : ColorPalettes.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => DashBoardPage(),
        DetailArticle.routeName: (context) => DetailArticle(),
        AboutDevPage.routeName: (context) => AboutDevPage(),
        AboutPage.routeName: (context) => BlocProvider(
            create: (context) {
              return PostBloc(KcovRepository());
            },
            child: AboutPage()),
      },
    );
  }

}
