import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:kawalcovid19/common/sizes.dart';
import 'package:intl/intl.dart';

class CardArticle extends StatelessWidget {
  final String title;
  final String shortContent;
  final String date;
  final Function onTap;

  const CardArticle(
      {Key key, this.title, this.shortContent, this.date, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          top: 16.0,
          bottom: 16.0,
          right: 16.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  color: Theme.of(context).primaryTextTheme.body2.color,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        DateFormat("dd").format(DateTime.parse(date)),
                        style: TextStyle(
                            color: Theme.of(context).backgroundColor,
                            fontSize: Sizes.dp20(context),
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        DateFormat("MMM")
                            .format(DateTime.parse(date))
                            .toUpperCase(),
                        style: TextStyle(
                          color: Theme.of(context).backgroundColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: Sizes.dp16(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: Sizes.dp18(context),
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: Sizes.dp6(context)),
                    Container(
                      width: Sizes.width(context),
                      child: Text(
                        parse(parse(shortContent).body.text)
                            .documentElement
                            .text.trim(),
                        style: TextStyle(
                          fontSize: Sizes.dp14(context),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
