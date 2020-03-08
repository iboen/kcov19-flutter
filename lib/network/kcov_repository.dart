import 'package:flutter/cupertino.dart';
import 'package:kawalcovid19/network/api_repository.dart';
import 'package:kawalcovid19/network/repository.dart';
import 'package:kawalcovid19/network/rest_client.dart';

class KcovRepository implements Repository {
  final ApiRepository api;

  static final KcovRepository _singleton =
      KcovRepository._internal(api: ApiRepository());

  factory KcovRepository() {
    return _singleton;
  }

  KcovRepository._internal({@required this.api});

  Future<List<Post>> getPosts() {
    return api.getPosts();
  }

  @override
  Future<Post> getFaq() {
    return api.getFaq();
  }
}
