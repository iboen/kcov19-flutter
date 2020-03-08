import 'package:equatable/equatable.dart';
import 'package:kawalcovid19/network/rest_client.dart';

abstract class FaqState extends Equatable {
  const FaqState();

  @override
  List<Object> get props => [];
}

class InitialFaqState extends FaqState {}

class FaqLoading extends FaqState {}

class FaqLoaded extends FaqState {
  final Post post;

  const FaqLoaded(this.post);

  @override
  List<Object> get props => [post];
}

class FaqNotLoaded extends FaqState {
  final String errorMessage;

  FaqNotLoaded([this.errorMessage = ""]);

  @override
  List<Object> get props => [errorMessage];
}
