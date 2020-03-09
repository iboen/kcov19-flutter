import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:kawalcovid19/network/repository/repository.dart';
import 'bloc.dart';

class FaqBloc extends Bloc<FaqEvent, FaqState> {
  final Repository repository;

  FaqBloc(this.repository);

  @override
  FaqState get initialState => InitialFaqState();

  @override
  Stream<FaqState> mapEventToState(FaqEvent event) async* {
    if (event is LoadFaq) {
      yield* _mapLoadFaqToState();
    }
  }

  Stream<FaqState> _mapLoadFaqToState() async* {
    try {
      yield FaqLoading();

      // call api
      var faq = await repository.getFaq();

      yield FaqLoaded(faq);
    } catch (_) {
      print(_.toString());
      yield FaqNotLoaded(_.toString());
    }
  }
}
