import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:kawalcovid19/common/screen_arguments.dart';
import 'package:kawalcovid19/common/sizes.dart';
import 'package:kawalcovid19/const/app_constant.example.dart';

import 'package:html/parser.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailArticle extends StatelessWidget {

  static const routeName = '/detail_screen';

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstant.appName),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(Sizes.dp16(context)),
            child: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Sizes.dp16(context),
                    horizontal: Sizes.dp16(context)),
                child: Container(
                  width: Sizes.width(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        args.title,
                        style: TextStyle(
                          fontSize: Sizes.dp20(context),
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: Sizes.dp6(context)),
                      Text(
                        parse(
                            parse(args.message).body.text)
                            .documentElement
                            .text,
                        style: TextStyle(
                          fontSize: Sizes.dp14(context),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: Sizes.dp8(context)),
                      Divider(
                        height: Sizes.dp10(context),
                      ),
                      SizedBox(height: Sizes.dp8(context)),
                      Html(
                        onLinkTap: (src) {
                          _launchURL(src);
                        },
                        data: args.content,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
