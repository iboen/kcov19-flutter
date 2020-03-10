import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:kawalcovid19/blocs/post/bloc.dart';
import 'package:kawalcovid19/common/sizes.dart';
import 'package:html/parser.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  static const routeName = '/about';

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
    BlocProvider.of<PostBloc>(context).add(LoadAbout());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tentang KawalCOVID19"),
          centerTitle: true,
        ),
        body: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
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
                          fontSize: Sizes.dp24(context),
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: Sizes.dp6(context)),
                      Text(
                        parse(parse(state.post.excerpt.rendered).body.text)
                            .documentElement
                            .text
                            .trim(),
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
        }));
  }
}
