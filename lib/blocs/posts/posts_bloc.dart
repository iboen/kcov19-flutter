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
      yield* _mapLoadPostsToState(1);
    } else if (event is LoadMorePosts) {
      yield* _mapLoadPostsToState(event.page);
    }
  }

  Stream<PostsState> _mapLoadPostsToState(int page) async* {
    try {
      var currentPosts;
      if (state is PostsLoaded) {
        currentPosts = (state as PostsLoaded).posts.toList();
      } else {
        yield PostsLoading();
      }

      // call api
      var newPosts = await repository.getPosts(page);
      var resPosts;
      if (page > 1 && currentPosts != null) {
        // if load more
        resPosts = currentPosts..addAll(newPosts);
      } else {
        resPosts = newPosts;
      }
      yield PostsLoaded(resPosts, page);
    } catch (_) {
      print(_.toString());
      if (page == 1) yield PostsNotLoaded(AppConstant.ERROR_GENERAL);
    }
  }
}
