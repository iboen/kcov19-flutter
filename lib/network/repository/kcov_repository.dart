import 'package:flutter/cupertino.dart';
import 'package:kawalcovid19/const/app_constant.dart';
import 'package:kawalcovid19/network/api/rest_client.dart';
import 'package:kawalcovid19/network/repository/local/local_repository.dart';
import 'package:kawalcovid19/network/repository/remote/api_repository.dart';
import 'package:kawalcovid19/network/repository/repository.dart';

class KcovRepository implements Repository {
  final ApiRepository api;
  final LocalRepository local;

  static final KcovRepository _singleton =
      KcovRepository._internal(api: ApiRepository(), local: LocalRepository());

  factory KcovRepository() {
    return _singleton;
  }

  KcovRepository._internal({@required this.api, @required this.local});

  Future<List<Post>> getPosts([int page = 1]) async {
    try {
      var fromLocal = await local.getPosts(page);
      if (fromLocal != null) {
        return fromLocal;
      } else {
        throw Exception();
      }
    } catch (_) {
      final posts = await api.getPosts(page);
      local.savePosts(posts, page);
      return posts;
    }
  }

  @override
  Future<Post> getFaq() async {
    try {
      var fromLocal = await local.getFaq();
      if (fromLocal != null) {
        return fromLocal;
      } else {
        throw Exception();
      }
    } catch (_) {
      final post = await api.getFaq();
      local.saveFaq(post);
      return post;
    }
  }

  @override
  Future<Post> getAbout() async {
    try {
      var fromLocal = await local.getAbout();
      if (fromLocal != null) {
        return fromLocal;
      } else {
        throw Exception();
      }
    } catch (_) {
      final post = await api.getAbout();
      local.saveAbout(post);
      return post;
    }
  }

  @override
  Future<Statistics> getStatistics() async {
    try {
      var fromLocal = await local.getStatistics();
      if (fromLocal != null) {
        return fromLocal;
      } else {
        throw Exception();
      }
    } catch (_) {
      final data = await api.getStatistics();
      local.saveStatistics(data);
      return data;
    }
  }

  Future<bool> saveStatistics(Statistics statistics) {
    return local.saveStatistics(statistics);
  }

  @override
  Future<List<ListConfirmed>> getListConfirmed() async {
    try {
      var fromLocal = await local.getListConfirmed();
      if (fromLocal != null) {
        return fromLocal;
      } else {
        throw Exception();
      }
    } catch (_) {
      final data = await api.getListConfirmed();
      local.saveListConfirmed(data);
      return data;
    }
  }

  Future<bool> saveListConfirmed(List<ListConfirmed> listConfirmed) {
    return local.saveListConfirmed(listConfirmed);
  }
}
