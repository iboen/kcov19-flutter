import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kawalcovid19/blocs/faq/bloc.dart';
import 'package:kawalcovid19/blocs/posts/bloc.dart';
import 'package:kawalcovid19/blocs/statistics/statistics_bloc.dart';
import 'package:kawalcovid19/const/app_constant.example.dart';
import 'package:kawalcovid19/network/kcov_repository.dart';
import 'package:kawalcovid19/ui/faq/faq_page.dart';
import 'package:kawalcovid19/ui/home/home_page.dart';
import 'package:kawalcovid19/ui/more/more_page.dart';
import 'package:kawalcovid19/ui/statistics/statistics_page.dart';
import 'package:kawalcovid19/widget/alert/pop_up.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoardPage> {
  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return PopUp(
                content: "Are you sure want to exit?",
                cancelText: "No",
                acceptText: "Yes",
                onTapCancel: () => Navigator.of(context).pop(),
                onTapAccept: () => SystemNavigator.pop(),
              );
            }
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppConstant.appName),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.info,
              ),
              onPressed: () {},
            ),
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
                return FaqBloc(KcovRepository());
              },
              child: FAQPage(),
            ),
            BlocProvider(
              create: (context) {
                return StatisticsBloc(KcovRepository());
              },
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
