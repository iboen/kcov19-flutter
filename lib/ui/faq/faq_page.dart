import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:kawalcovid19/blocs/post/bloc.dart';
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
    BlocProvider.of<PostBloc>(context).add(LoadFaq());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(builder: (context, state) {
      if (state is PostLoaded) {
        return ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              width: Sizes.width(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    state.post.title.rendered,
                    style: TextStyle(
                      fontSize: Sizes.dp25(context),
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: Sizes.dp6(context)),
                  Text(
                    parse(parse(state.post.excerpt.rendered).body.text)
                        .documentElement
                        .text.trim(),
                    style: TextStyle(
                      fontSize: Sizes.dp18(context),
                    ),
                  ),
                  SizedBox(height: Sizes.dp16(context)),
                  Divider(
                    height: Sizes.dp10(context),
                  ),
                  SizedBox(height: Sizes.dp8(context)),
                  Html(
                    onLinkTap: (src) {
                      _launchURL(src);
                    },
                    data: state.post.content.rendered,
                  ),
                ],
              ),
            ),
          ],
        );
      } else if (state is PostLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is PostNotLoaded) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(child: Text(state.errorMessage)),
        );
      } else {
        return Center(child: Text(""));
      }
    });
  }
}
