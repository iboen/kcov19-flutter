import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:kawalcovid19/common/sizes.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:html/parser.dart';

class PostDetail extends StatelessWidget {
  final String title;
  final String message;
  final String content;

  const PostDetail({Key key, this.title, this.message, this.content})
      : super(key: key);

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(Sizes.dp16(context)),
          width: Sizes.width(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                parse(parse(title).body.text).documentElement.text.trim(),
                style: TextStyle(
                  fontSize: Sizes.dp24(context),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: Sizes.dp6(context)),
              Text(
                parse(parse(message).body.text).documentElement.text.trim(),
                style: TextStyle(
                  fontSize: Sizes.dp18(context),
                ),
              ),
              SizedBox(height: Sizes.dp8(context)),
              Divider(
                height: Sizes.dp10(context),
              ),
              SizedBox(height: Sizes.dp8(context)),
              Html(
                defaultTextStyle: TextStyle(height: 1.4, fontSize: 17),
                onLinkTap: (src) {
                  _launchURL(src);
                },
                data: content,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
