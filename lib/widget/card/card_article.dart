import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:kawalcovid19/common/sizes.dart';

class CardArticle extends StatelessWidget {
  final String img;
  final String title;
  final String shortContent;
  final String date;

  const CardArticle(
      {Key key, this.img, this.title, this.shortContent, this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Sizes.dp4(context), bottom: Sizes.dp4(context)),
      child: Container(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.dp10(context))),
          elevation: 3.0,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  // Image
                  Container(
                    height: Sizes.height(context) / 5.5,
                    width: Sizes.width(context),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Sizes.dp10(context)),
                        topRight: Radius.circular(Sizes.dp10(context)),
                      ),
                      child: Image.network(
                        img,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Date
                  Positioned(
                    top: Sizes.dp6(context),
                    right: Sizes.dp6(context),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Sizes.dp4(context))),
                      child: Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Text(
                          date,
                          style: TextStyle(
                            fontSize: Sizes.dp10(context),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Sizes.dp6(context)),
              Padding(
                padding: EdgeInsets.only(left: Sizes.dp16(context)),
                child: Container(
                  width: Sizes.width(context),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: Sizes.dp20(context),
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(height: Sizes.dp6(context)),
              Padding(
                padding: EdgeInsets.only(left: Sizes.dp16(context)),
                child: Container(
                  width: Sizes.width(context),
                  child: Text(
                    parse(parse(shortContent).body.text).documentElement.text,
                    style: TextStyle(
                      fontSize: Sizes.dp12(context),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Sizes.dp10(context)),
            ],
          ),
        ),
      ),
    );
  }
}
