import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kawalcovid19/blocs/post/bloc.dart';
import 'package:kawalcovid19/common/sizes.dart';
import 'package:kawalcovid19/widget/post_detail.dart';

class AboutPage extends StatefulWidget {
  static const routeName = '/about';

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

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
            return PostDetail(
              title: state.post.title.rendered,
              message: state.post.excerpt.rendered,
              content: state.post.content.rendered,
            );
          } else if (state is PostLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PostNotLoaded) {
            return Padding(
              padding: EdgeInsets.all(Sizes.dp16(context)),
              child: Center(child: Text(state.errorMessage)),
            );
          } else {
            return Center(child: Text(""));
          }
        }));
  }
}
