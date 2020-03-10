import 'package:flutter/material.dart';
import 'package:kawalcovid19/common/screen_arguments.dart';
import 'package:kawalcovid19/const/app_constant.dart';
import 'package:kawalcovid19/widget/post_detail.dart';

class DetailArticle extends StatelessWidget {

  static const routeName = '/detail_screen';

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstant.appName),
        centerTitle: true,
      ),
      body: PostDetail(
        title: args.title,
        message: args.message,
        content: args.content,
      ),
    );
  }
}
