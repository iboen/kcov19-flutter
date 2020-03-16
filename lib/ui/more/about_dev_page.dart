import 'package:flutter/material.dart';
import 'package:kawalcovid19/network/data/important_link.dart';
import 'package:kawalcovid19/widget/card/card_important_link.dart';
import 'package:url_launcher/url_launcher.dart';

class Developer {
  const Developer({this.name});

  final String name;
}

const List<Developer> choices = const <Developer>[
  const Developer(name: 'Ibnu Sina Wardy'),
  const Developer(name: 'R. Rifa Fauzi Komara'),
  const Developer(name: 'Topik Mujianto'),
  const Developer(name: 'Sudaryatno'),
];

class AboutDevPage extends StatelessWidget {
  static const routeName = '/about-dev';

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
      appBar: AppBar(
        title: Text("Tentang Pengembang"),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Aplikasi mobile ini dibuat oleh tim relawan dari\nGITS Indonesia & Family",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16,
                ),
                ...choices.map((e) => Text(
                      e.name,
                      style: TextStyle(fontSize: 16),
                    )),
                SizedBox(
                  height: 32,
                ),
                FlatButton(
                  onPressed: () {
                    _launchURL("https://gits.id");
                  },
                  child: Text(
                    "(www.gits.id)",
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
