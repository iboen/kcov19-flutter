import 'package:equatable/equatable.dart';
import 'package:kawalcovid19/network/rest_client.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class InitialPostsState extends PostsState {}

class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  final List<Post> posts;

  const PostsLoaded([this.posts = const []]);

  @override
  List<Object> get props => [posts];
}

class PostsNotLoaded extends PostsState {
  final String errorMessage;

  PostsNotLoaded([this.errorMessage = ""]);

  @override
  List<Object> get props => [errorMessage];
}
