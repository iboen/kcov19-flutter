import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:kawalcovid19/common/sizes.dart';
import 'package:intl/intl.dart';

class CardArticle extends StatelessWidget {
  final String title;
  final String shortContent;
  final String date;
  final Function onTap;

  const CardArticle({Key key, this.title, this.shortContent, this.date, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: Sizes.dp16(context),
          top: Sizes.dp8(context),
          bottom: Sizes.dp8(context)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    width: 60,
                    height: 60,
                    color: Theme.of(context).primaryTextTheme.body1.color,
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
                  padding: EdgeInsets.only(left: Sizes.dp8(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: Sizes.dp20(context),
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
                              .text,
                          style: TextStyle(
                            fontSize: Sizes.dp14(context),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Divider()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
