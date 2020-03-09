import 'package:equatable/equatable.dart';
import 'package:kawalcovid19/network/rest_client.dart';

abstract class StatisticsState extends Equatable {
  const StatisticsState();

  @override
  List<Object> get props => [];
}

class InitialStatisticsState extends StatisticsState{}

class StatisticsLoading extends StatisticsState{}

class StatisticsLoaded extends StatisticsState{
  final Statistics statistics;

  const StatisticsLoaded(this.statistics);

  @override
  List<Object> get props => [statistics];
}

class StatisticsNotLoaded extends StatisticsState {
  final String errorMessage;

  StatisticsNotLoaded([this.errorMessage = ""]);

  @override
  List<Object> get props => [errorMessage];
}