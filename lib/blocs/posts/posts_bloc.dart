import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:kawalcovid19/const/app_constant.dart';
import 'package:kawalcovid19/network/repository/repository.dart';
import 'bloc.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final Repository repository;

  PostsBloc(this.repository);

  @override
  PostsState get initialState => InitialPostsState();

  @override
  Stream<PostsState> mapEventToState(PostsEvent event) async* {
    if (event is LoadPosts) {
      yield* _mapLoadPostsToState();
    }
  }

  Stream<PostsState> _mapLoadPostsToState() async* {
    try {
      yield PostsLoading();

      // call api
      var posts = await repository.getPosts();

      yield PostsLoaded(posts);
    } catch (_) {
      print(_.toString());
      yield PostsNotLoaded(AppConstant.ERROR_GENERAL);
    }
  }
}
