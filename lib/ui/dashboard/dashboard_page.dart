import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kawalcovid19/common/color_palettes.dart';
import 'package:kawalcovid19/common/sizes.dart';
import 'package:kawalcovid19/widget/alert/pop_up.dart';
import 'package:kawalcovid19/widget/bottomnavbar/bottom_navy_bar.dart';

class DashBoardPage extends StatefulWidget {

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoardPage> {

  int _page = 0;

  final List<Widget> _list = [
    Container(),
    Container(),
    Container()
  ];

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
        appBar: AppBar(),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _page,
          onItemSelected: onTapped,
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(
                  fontSize: Sizes.dp12(context),
                ),
              ),
              activeColor: ColorPalettes.blueNavBar,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.library_books),
              title: Text(
                'Articles',
                style: TextStyle(
                  fontSize: Sizes.dp12(context),
                ),
              ),
              activeColor: ColorPalettes.blueNavBar,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.more_horiz),
              title: Text(
                'More',
                style: TextStyle(
                  fontSize: Sizes.dp12(context),
                ),
              ),
              activeColor: ColorPalettes.blueNavBar,
            ),
          ],
        ),
        body: _list[_page],
      ),
    );
  }

  void onTapped(int index) {
    setState(() {
      _page = index;
    });
  }

}