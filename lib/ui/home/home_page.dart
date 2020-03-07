import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kawalcovid19/blocs/posts/bloc.dart';
import 'package:kawalcovid19/network/rest_client.dart';
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
                        img:
                            "https://awsimages.detik.net.id/api/wm/2020/03/05/71372c6f-3dc5-485b-bb78-823bd6b36363_169.jpeg?wid=54&w=650&v=1&t=jpeg",
                        title: post.title.rendered,
                        shortContent: post.excerpt.rendered,
                        date: DateFormat("dd MMM yyyy")
                            .format(DateTime.parse(post.date)),
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

// temporary data dummy
//List posts = [
//  {
//    "img": "https://awsimages.detik.net.id/api/wm/2020/03/05/71372c6f-3dc5-485b-bb78-823bd6b36363_169.jpeg?wid=54&w=650&v=1&t=jpeg",
//    "title": "Title",
//    "shortContent": "Short Content",
//    "date": "2020-03-05T14:10:56Z"
//  },
//  {
//    "img": "https://www.harianhaluan.com/assets/berita/original/24259554315-aster.jpeg",
//    "title": "Title",
//    "shortContent": "Shor Content",
//    "date": "2020-03-05T13:34:10Z"
//  },
//  {
//    "img": "https://www.tagar.id/Asset/uploads2019/1583412876587-kantor-grab-yogyakarta.jpg",
//    "title": "Title",
//    "shortContent": "Short Content",
//    "date": "2020-03-05T13:03:00Z"
//  },
//  {
//    "img": "https://awsimages.detik.net.id/api/wm/2019/12/22/4a896468-2cd4-40c6-a1bf-249b6616ea2f_169.jpeg?wid=54&w=650&v=1&t=jpeg",
//    "title": "Title",
//    "shortContent": "Short Content",
//    "date": "2020-03-05T12:52:54Z"
//  },
//  {
//    "img": "https://asset.kompas.com/crops/0gRMCxFjfGlRyKq5vN9wOnvr9w0=/0x41:1000x708/780x390/filters:watermark(data/photo/2020/03/05/5e605747d66ad.png,0,-0,1)/data/photo/2020/03/01/5e5b66c42d2f1.jpg",
//    "title": "Title",
//    "shortContent": "Short Content",
//    "date": "2020-03-05T12:51:00Z"
//  },
//];
