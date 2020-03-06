import 'package:flutter/cupertino.dart';
import 'package:kawalcovid19/network/api_repository.dart';
import 'package:kawalcovid19/network/repository.dart';
import 'package:kawalcovid19/network/rest_client.dart';

class KcovRepository implements Repository {
  final ApiRepository api;

  const KcovRepository({@required this.api});

  Future<List<Post>> getPosts() {
    return api.getPosts();
  }
}
