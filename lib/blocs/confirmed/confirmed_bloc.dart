import 'package:bloc/bloc.dart';
import 'package:kawalcovid19/blocs/confirmed/bloc.dart';
import 'package:kawalcovid19/network/repository.dart';

class ConfirmedBloc extends Bloc<ConfirmedEvent, ConfirmedState> {

  final Repository repository;

  ConfirmedBloc(this.repository);

  @override
  ConfirmedState get initialState => InitialConfirmedState();

  @override
  Stream<ConfirmedState> mapEventToState(ConfirmedEvent event) async* {
    if (event is LoadConfirmed) {
      yield* _mapLoadConfirmedToState();
    }
  }

  Stream<ConfirmedState> _mapLoadConfirmedToState() async* {
    try {
      yield ConfirmedLoading();

      // call api
      var confirmed = await repository.getListConfirmed();
      yield ConfirmedLoaded(confirmed);
    } catch (_) {
      print(_.toString());
      yield ConfirmedNotLoaded(_.toString());
    }
  }

}