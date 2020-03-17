import 'package:flutter/material.dart';
import 'package:kawalcovid19/common/screen_arguments.dart';
import 'package:kawalcovid19/const/app_constant.dart';
import 'package:kawalcovid19/widget/post_detail.dart';
import 'package:share/share.dart';
import 'package:html/parser.dart';

class DetailArticle extends StatelessWidget {
  static const routeName = '/detail_screen';

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstant.appName),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            tooltip: "Share",
            icon: Icon(Icons.share),
            onPressed: () {
              var url = "https://kawalcovid19.id/content/${args.id}/${args.slug}";
              print(url);
              Share.share('${parse(parse(args.title).body.text).documentElement.text.trim()} $url');
            },
          )
        ],
      ),
      body: PostDetail(
        title: args.title,
        message: args.message,
        content: args.content,
      ),
    );
  }
}
