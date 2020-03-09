import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:kawalcovid19/network/repository.dart';
import 'bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final Repository repository;

  PostBloc(this.repository);

  @override
  PostState get initialState => InitialPostState();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is LoadFaq) {
      yield* _mapLoadFaqToState();
    }else if (event is LoadAbout) {
      yield* _mapLoadAboutToState();
    }
  }

  Stream<PostState> _mapLoadFaqToState() async* {
    try {
      yield PostLoading();

      // call api
      var post = await repository.getFaq();

      yield PostLoaded(post);
    } catch (_) {
      print(_.toString());
      yield PostNotLoaded(_.toString());
    }
  }

  Stream<PostState> _mapLoadAboutToState() async* {
    try {
      yield PostLoading();

      // call api
      var post = await repository.getAbout();

      yield PostLoaded(post);
    } catch (_) {
      print(_.toString());
      yield PostNotLoaded(_.toString());
    }
  }
}
