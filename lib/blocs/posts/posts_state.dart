import 'package:equatable/equatable.dart';
import 'package:kawalcovid19/network/api/rest_client.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class InitialPostsState extends PostsState {}

class PostsLoading extends PostsState {}

class MorePostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  final List<Post> posts;
  final int page;

  const PostsLoaded([this.posts = const [], this.page = 1]);

  @override
  List<Object> get props => [posts, page];
}

class PostsNotLoaded extends PostsState {
  final String errorMessage;

  PostsNotLoaded([this.errorMessage = ""]);

  @override
  List<Object> get props => [errorMessage];
}
