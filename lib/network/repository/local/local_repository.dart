import 'dart:convert';
import 'package:kawalcovid19/common/pref_helper.dart';
import 'package:kawalcovid19/const/app_constant.dart';
import 'package:kawalcovid19/network/api/rest_client.dart';
import 'package:kawalcovid19/network/repository/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepository implements Repository {
  @override
  Future<List<Post>> getPosts([int page = 1]) async {
    var fromCache =
        await PrefHelper.getCache(AppConstant.POSTS + "/" + page.toString());
    if (fromCache != null) {
      Iterable iterable = jsonDecode(fromCache);
      return iterable.map((e) => Post.fromJson(e)).toList();
    }
    return null;
  }

  @override
  Future<Post> getFaq() async {
    var fromCache = await PrefHelper.getCache(AppConstant.FAQ);
    if (fromCache != null) {
      Map json = jsonDecode(fromCache);
      return Post.fromJson(json);
    }
    return null;
  }

  @override
  Future<Post> getAbout() async {
    var fromCache = await PrefHelper.getCache(AppConstant.ABOUT);
    if (fromCache != null) {
      Map json = jsonDecode(fromCache);
      return Post.fromJson(json);
    }
    return null;
  }

  Future<bool> savePosts(List<Post> posts, int page) async {
    // if not page 1, set last checked date similar to page 1
    int page1LastChecked;
    if (page > 1) {
      var page1Data = await PrefHelper.getFullCache(AppConstant.POSTS + "/1");
      page1LastChecked = page1Data[PrefHelper.LAST_CHECKED];
    }
    return await PrefHelper.storeCache(
        AppConstant.POSTS + "/" + page.toString(), jsonEncode(posts), lastChecked: page1LastChecked);
  }

  Future<bool> saveFaq(Post faq) {
    return PrefHelper.storeCache(AppConstant.FAQ, jsonEncode(faq));
  }

  Future<bool> saveAbout(Post about) {
    return PrefHelper.storeCache(AppConstant.ABOUT, jsonEncode(about));
  }

  @override
  Future<Statistics> getStatistics() async {
    var fromCache = await PrefHelper.getCache(AppConstant.STATISTICS);
    if (fromCache != null) {
      Map json = jsonDecode(fromCache);
      return Statistics.fromJson(json);
    }
    return null;
  }

  Future<bool> saveStatistics(Statistics statistics) {
    return PrefHelper.storeCache(
        AppConstant.STATISTICS, jsonEncode(statistics));
  }

  @override
  Future<List<ListConfirmed>> getListConfirmed() async {
    var fromCache = await PrefHelper.getCache(AppConstant.CONFIRMED);
    if (fromCache != null) {
      Iterable iterable = jsonDecode(fromCache);
      return iterable.map((e) => ListConfirmed.fromJson(e)).toList();
    }
    return null;
  }

  Future<bool> saveListConfirmed(List<ListConfirmed> listConfirmed) {
    return PrefHelper.storeCache(AppConstant.ABOUT, jsonEncode(listConfirmed));
  }
}
