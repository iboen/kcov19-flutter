import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kawalcovid19/blocs/confirmed/confirmed_bloc.dart';
import 'package:kawalcovid19/blocs/post/bloc.dart';
import 'package:kawalcovid19/blocs/posts/bloc.dart';
import 'package:kawalcovid19/blocs/statistics/statistics_bloc.dart';
import 'package:kawalcovid19/common/navigation.dart';
import 'package:kawalcovid19/common/version_check.dart';
import 'package:kawalcovid19/const/app_constant.dart';
import 'package:kawalcovid19/network/repository/kcov_repository.dart';
import 'package:kawalcovid19/ui/about/about_page.dart';
import 'package:kawalcovid19/ui/faq/faq_page.dart';
import 'package:kawalcovid19/ui/home/home_page.dart';
import 'package:kawalcovid19/ui/more/about_dev_page.dart';
import 'package:kawalcovid19/ui/more/more_page.dart';
import 'package:kawalcovid19/ui/statistics/statistics_page.dart';
import 'package:kawalcovid19/widget/alert/pop_up.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class Choice {
  const Choice({this.route, this.title, this.icon});

  final String route;
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(
      route: AboutPage.routeName,
      title: 'Tentang KawalCOVID19',
      icon: Icons.info),
  const Choice(
      route: AboutDevPage.routeName,
      title: 'Tentang Pengembang',
      icon: Icons.developer_mode),
];

class _DashBoardState extends State<DashBoardPage> {
  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstant.appName),
        centerTitle: true,
        actions: <Widget>[
          // overflow menu
          PopupMenuButton<Choice>(
            onSelected: (Choice choice) {
              // Causes the app to rebuild with the new _selectedChoice.
              Navigation.intent(context, choice.route);
            },
            itemBuilder: (BuildContext context) {
              return choices.map((Choice choice) {
                return PopupMenuItem<Choice>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          ),
//          IconButton(
//            icon: Icon(
//              Icons.info,
//            ),
//            onPressed: () {
//              Navigation.intent(context, AboutPage.routeName);
//            },
//          ),
        ],
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          BlocProvider(
            create: (context) {
              return PostsBloc(KcovRepository());
            },
            child: HomePage(),
          ),
          BlocProvider(
            create: (context) {
              return PostBloc(KcovRepository());
            },
            child: FAQPage(),
          ),
          MultiBlocProvider(
            providers: [
              BlocProvider<StatisticsBloc>(
                create: (context) {
                  return StatisticsBloc(KcovRepository());
                },
              ),
              BlocProvider<ConfirmedBloc>(
                create: (context) {
                  return ConfirmedBloc(KcovRepository());
                },
              ),
            ],
            child: StatisticsPage(),
          ),
          MorePage(),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Theme.of(context).primaryColor,
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Theme.of(context).accentColor,
          textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Colors.grey[500]),
              ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Container(height: 0.0),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.question_answer,
              ),
              title: Container(height: 0.0),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.show_chart,
              ),
              title: Container(height: 0.0),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.more_horiz,
              ),
              title: Container(height: 0.0),
            ),
          ],
          onTap: navigationTapped,
          currentIndex: _page,
        ),
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    versionCheck(context);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
