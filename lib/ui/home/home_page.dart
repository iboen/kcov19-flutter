import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kawalcovid19/blocs/posts/bloc.dart';
import 'package:kawalcovid19/common/navigation.dart';
import 'package:kawalcovid19/common/screen_arguments.dart';
import 'package:kawalcovid19/network/rest_client.dart';
import 'package:kawalcovid19/ui/home/detail_article.dart';
import 'package:kawalcovid19/widget/card/card_article.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    _loadPost();
  }

  Future<Null> _refresh() {
    BlocProvider.of<PostsBloc>(context).add(LoadPosts());
    return null;
  }

  void _loadPost() {
    BlocProvider.of<PostsBloc>(context).add(LoadPosts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
            key: _refreshIndicatorKey,
            child:
                BlocBuilder<PostsBloc, PostsState>(builder: (context, state) {
              if (state is PostsLoaded) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: state.posts == null ? 0 : state.posts.length,
                    itemBuilder: (BuildContext context, int index) {
                      Post post = state.posts[index];
                      return CardArticle(
                        title: post.title.rendered,
                        shortContent: post.excerpt.rendered,
                        date: post.date,
                        onTap: () {
                          Navigation.intentWithData(
                            context,
                            DetailArticle.routeName,
                            ScreenArguments(
                              post.title.rendered,
                              post.excerpt.rendered,
                              post.content.rendered,
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              } else if (state is PostsLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is PostsNotLoaded) {
                return Center(child: Text(state.errorMessage));
              } else {
                return Center(child: Text(""));
              }
            }),
            onRefresh: _refresh));
  }
}
