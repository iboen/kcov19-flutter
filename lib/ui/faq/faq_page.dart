import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:kawalcovid19/blocs/faq/bloc.dart';
import 'package:kawalcovid19/common/sizes.dart';
import 'package:html/parser.dart';
import 'package:url_launcher/url_launcher.dart';

class FAQPage extends StatefulWidget {
  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FaqBloc>(context).add(LoadFaq());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<FaqBloc, FaqState>(builder: (context, state) {
          if (state is FaqLoaded) {
            return ListView(
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
                              state.post.title.rendered,
                              style: TextStyle(
                                fontSize: Sizes.dp20(context),
                                fontWeight: FontWeight.w800,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: Sizes.dp6(context)),
                            Text(
                              parse(
                                  parse(state.post.excerpt.rendered).body.text)
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
                              onImageTap: (src) {
                                _launchURL(src);
                              },
                              data: state.post.content.rendered,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (state is FaqLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is FaqNotLoaded) {
            return Center(child: Text(state.errorMessage));
          } else {
            return Center(child: Text("Ada kesalahan"));
          }
        }));
  }
}
