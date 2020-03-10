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

  Future<List<Post>> getPosts() async {
    try {
      // check last update, if more than an hour, get from API
      if ((DateTime.now().millisecondsSinceEpoch -
                  await local
                      .getLastUpdate(AppConstant.LAST_UPDATE_POSTS)) /
              1000 <
          3600) {
        return await local.getPosts();
      } else {
        throw Exception();
      }
    } catch (_) {
      final posts = await api.getPosts();
      await local.saveLastUpdate(AppConstant.LAST_UPDATE_POSTS);
      await local.savePosts(posts);
      return posts;
    }
  }

  @override
  Future<Post> getFaq() async {
    try {
      // check last update, if more than an hour, get from API
      if ((DateTime.now().millisecondsSinceEpoch -
                  await local.getLastUpdate(AppConstant.LAST_UPDATE_FAQ)) /
              1000 <
          3600) {
        return await local.getFaq();
      } else {
        throw Exception();
      }
    } catch (_) {
      final faq = await api.getFaq();
      await local.saveFaq(faq);
      await local.saveLastUpdate(AppConstant.LAST_UPDATE_FAQ);
      return faq;
    }
  }

  @override
  Future<Post> getAbout() async {
    try {
      // check last update, if more than an hour, get from API
      if ((DateTime.now().millisecondsSinceEpoch -
          await local.getLastUpdate(AppConstant.LAST_UPDATE_ABOUT)) /
          1000 <
          3600) {
        return await local.getAbout();
      } else {
        throw Exception();
      }
    } catch (_) {
      final about = await api.getAbout();
      await local.saveAbout(about);
      await local.saveLastUpdate(AppConstant.LAST_UPDATE_ABOUT);
      return about;
    }
  }

  @override
  Future<bool> savePosts(List<Post> posts) {
    return local.savePosts(posts);
  }

  @override
  Future<Statistics> getStatistics() async {
    try {
      // check last update, if more than an hour, get from API
      if ((DateTime.now().millisecondsSinceEpoch -
          await local.getLastUpdate(AppConstant.LAST_UPDATE_STATISTICS)) /
          1000 <
          3600) {
        return await local.getStatistics();
      } else {
        throw Exception();
      }
    } catch (_) {
      final statistics = await api.getStatistics();
      await local.saveStatistics(statistics);
      await local.saveLastUpdate(AppConstant.LAST_UPDATE_STATISTICS);
      return statistics;
    }
  }

  @override
  Future<bool> saveStatistics(Statistics statistics) {
    return local.saveStatistics(statistics);
  }

  @override
  Future<List<ListConfirmed>> getListConfirmed() async {
    try {
      // check last update, if more than an hour, get from API
      if ((DateTime.now().millisecondsSinceEpoch -
          await local
              .getLastUpdate(AppConstant.LAST_UPDATE_CONFIRMED)) /
          1000 <
          3600) {
        return await local.getListConfirmed();
      } else {
        throw Exception();
      }
    } catch (_) {
      final confirmed = await api.getListConfirmed();
      await local.saveLastUpdate(AppConstant.LAST_UPDATE_CONFIRMED);
      await local.saveListConfirmed(confirmed);
      return confirmed;
    }
  }

  @override
  Future<bool> saveListConfirmed(List<ListConfirmed> listConfirmed) {
    return local.saveListConfirmed(listConfirmed);
  }
}
