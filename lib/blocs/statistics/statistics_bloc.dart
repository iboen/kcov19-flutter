import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:kawalcovid19/network/repository/repository.dart';
import 'bloc.dart';

class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {

  final Repository repository;

  StatisticsBloc(this.repository);

  @override
  StatisticsState get initialState => InitialStatisticsState();

  @override
  Stream<StatisticsState> mapEventToState(StatisticsEvent event) async* {
    if (event is LoadStatistics) {
      yield* _mapLoadStatisticsToState();
    }
  }

  Stream<StatisticsState> _mapLoadStatisticsToState() async* {
    try {
      yield StatisticsLoading();

      // call api
      var statistics = await repository.getStatistics();
      yield StatisticsLoaded(statistics);
    } catch (_) {
      print(_.toString());
      yield StatisticsNotLoaded(_.toString());
    }
  }

}