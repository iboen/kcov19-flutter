import 'package:equatable/equatable.dart';
import 'package:kawalcovid19/network/api/rest_client.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class InitialPostState extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final Post post;

  const PostLoaded(this.post);

  @override
  List<Object> get props => [post];
}

class PostNotLoaded extends PostState {
  final String errorMessage;

  PostNotLoaded([this.errorMessage = ""]);

  @override
  List<Object> get props => [errorMessage];
}
