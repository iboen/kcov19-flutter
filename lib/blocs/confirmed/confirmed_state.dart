import 'package:equatable/equatable.dart';
import 'package:kawalcovid19/network/api/rest_client.dart';

abstract class ConfirmedState extends Equatable {
  const ConfirmedState();

  @override
  List<Object> get props => [];
}

class InitialConfirmedState extends ConfirmedState{}

class ConfirmedLoading extends ConfirmedState{}

class ConfirmedLoaded extends ConfirmedState {
  final List<ListConfirmed> confirmed;

  const ConfirmedLoaded([this.confirmed = const []]);

  @override
  List<Object> get props => [confirmed];
}

class ConfirmedNotLoaded extends ConfirmedState{
  final String errorMessage;

  ConfirmedNotLoaded([this.errorMessage = ""]);

  @override
  List<Object> get props => [errorMessage];
}