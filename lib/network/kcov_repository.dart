import 'package:flutter/cupertino.dart';
import 'package:kawalcovid19/network/api_repository.dart';
import 'package:kawalcovid19/network/local_repository.dart';
import 'package:kawalcovid19/network/repository.dart';
import 'package:kawalcovid19/network/rest_client.dart';

class KcovRepository implements Repository {
  final ApiRepository api;
  final LocalRepository local;

  static final KcovRepository _singleton =
      KcovRepository._internal(api: ApiRepository(), local: LocalRepository());

  factory KcovRepository() {
    return _singleton;
  }

  KcovRepository._internal({@required this.api, @required this.local});

  Future<List<Post>> getPosts() async {
    try {
      // check last update, if more than an hour, get from API
      if ((DateTime.now().millisecondsSinceEpoch -
                  await local
                      .getLastUpdate(LocalRepository.LAST_UPDATE_POSTS)) /
              1000 <
          3600) {
        return await local.getPosts();
      } else {
        throw Exception();
      }
    } catch (_) {
      final posts = await api.getPosts();
      await local.saveLastUpdate(LocalRepository.LAST_UPDATE_POSTS);
      await local.savePosts(posts);
      return posts;
    }
  }

  @override
  Future<Post> getFaq() async {
    try {
      // check last update, if more than an hour, get from API
      if ((DateTime.now().millisecondsSinceEpoch -
                  await local.getLastUpdate(LocalRepository.LAST_UPDATE_FAQ)) /
              1000 <
          3600) {
        return await local.getFaq();
      } else {
        throw Exception();
      }
    } catch (_) {
      final faq = await api.getFaq();
      await local.saveFaq(faq);
      await local.saveLastUpdate(LocalRepository.LAST_UPDATE_FAQ);
      return faq;
    }
  }

  @override
  Future<bool> savePosts(List<Post> posts) {
    return local.savePosts(posts);
  }

  @override
  Future<bool> saveFaq(Post faq) {
    return local.saveFaq(faq);
  }

  @override
  Future<Statistics> getStatistics() async {
    try {
      // check last update, if more than an hour, get from API
      if ((DateTime.now().millisecondsSinceEpoch -
          await local.getLastUpdate(LocalRepository.LAST_UPDATE_STATISTICS)) /
          1000 <
          3600) {
        return await local.getStatistics();
      } else {
        throw Exception();
      }
    } catch (_) {
      final statistics = await api.getStatistics();
      await local.saveStatistics(statistics);
      await local.saveLastUpdate(LocalRepository.LAST_UPDATE_STATISTICS);
      return statistics;
    }
  }

  @override
  Future<bool> saveStatistics(Statistics statistics) {
    return local.saveStatistics(statistics);
  }
}
