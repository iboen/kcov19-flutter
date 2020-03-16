import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kawalcovid19/blocs/post/bloc.dart';
import 'package:kawalcovid19/common/color_palettes.dart';
import 'package:kawalcovid19/const/app_constant.dart';
import 'package:kawalcovid19/network/repository/kcov_repository.dart';
import 'package:kawalcovid19/ui/about/about_page.dart';
import 'package:kawalcovid19/common/firebase_notification_handler.dart';
import 'package:kawalcovid19/ui/dashboard/dashboard_page.dart';
import 'package:kawalcovid19/blocs/SimpleBlocDelegate.dart';
import 'package:kawalcovid19/ui/home/detail_article.dart';
import 'package:kawalcovid19/ui/more/about_dev_page.dart';

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
    // Check the default of FCM
    new FirebaseNotifications().setUpFirebase();

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
