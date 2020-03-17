import 'package:equatable/equatable.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object> get props => [];
}

class LoadPosts extends PostsEvent {}

class LoadMorePosts extends PostsEvent {
  final int page;

  LoadMorePosts(this.page);

  @override
  List<Object> get props => [this.page];
}
