import 'package:flutter/material.dart';
import 'package:kawalcovid19/network/data/important_link.dart';
import 'package:kawalcovid19/widget/card/card_important_link.dart';
import 'package:url_launcher/url_launcher.dart';

class MorePage extends StatelessWidget {

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: importantLink == null ? 0 :importantLink.length,
          itemBuilder: (BuildContext context, int index) {
            Map restaurant = importantLink[index];
            return CardImportantLink(
              title: restaurant["title"],
              onTap: () {
                _launchURL(restaurant["link"]);
              },
            );
          },
        ),
      ),
    );

  }
}
