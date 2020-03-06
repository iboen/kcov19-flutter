import 'package:flutter/material.dart';
import 'package:html/parser.dart';

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
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Container(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 3.0,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  // Image
                  Container(
                    height: MediaQuery.of(context).size.height / 5.5,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.network(
                        img,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Date
                  Positioned(
                    top: 6.0,
                    right: 6.0,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      child: Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Text(
                          date,
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 7.0),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(height: 7.0),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    parse(parse(shortContent).body.text).documentElement.text,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
