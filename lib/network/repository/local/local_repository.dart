import 'dart:convert';
import 'package:kawalcovid19/const/app_constant.dart';
import 'package:kawalcovid19/network/api/rest_client.dart';
import 'package:kawalcovid19/network/repository/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepository implements Repository {

  Future<List<Post>> getPosts() async {
    return SharedPreferences.getInstance().then((prefs) {
      Iterable iterable = jsonDecode(prefs.getString(AppConstant.POSTS));
      return iterable.map((e) => Post.fromJson(e)).toList();
    });
  }

  @override
  Future<Post> getFaq() {
    return SharedPreferences.getInstance().then((prefs) {
      Map json = jsonDecode(prefs.getString(AppConstant.FAQ));
      return Post.fromJson(json);
    });
  }

  @override
  Future<Post> getAbout() {
    return SharedPreferences.getInstance().then((prefs) {
      Map json = jsonDecode(prefs.getString(AppConstant.ABOUT));
      return Post.fromJson(json);
    });
  }

  Future<bool> savePosts(List<Post> posts) {
    return SharedPreferences.getInstance().then((prefs) {
      String json = jsonEncode(posts);
      return prefs.setString(AppConstant.POSTS, json);
    });
  }

  Future<bool> saveFaq(Post faq) {
    return SharedPreferences.getInstance().then((prefs) {
      String json = jsonEncode(faq);
      return prefs.setString(AppConstant.FAQ, json);
    });
  }

  Future<bool> saveAbout(Post about) {
    return SharedPreferences.getInstance().then((prefs) {
      String json = jsonEncode(about);
      return prefs.setString(AppConstant.ABOUT, json);
    });
  }

  Future<bool> saveLastUpdate(String key) {
    return SharedPreferences.getInstance().then((prefs) {
      return prefs.setInt(key, DateTime.now().millisecondsSinceEpoch);
    });
  }

  Future<int> getLastUpdate(String key) {
    return SharedPreferences.getInstance().then((prefs) {
      return prefs.getInt(key);
    });
  }

  @override
  Future<Statistics> getStatistics() {
    return SharedPreferences.getInstance().then((prefs) {
      Map json = jsonDecode(prefs.getString(AppConstant.STATISTICS));
      return Statistics.fromJson(json);
    });
  }

  Future<bool> saveStatistics(Statistics statistics) {
    return SharedPreferences.getInstance().then((prefs) {
      String json = jsonEncode(statistics);
      return prefs.setString(AppConstant.STATISTICS, json);
    });
  }

  @override
  Future<List<ListConfirmed>> getListConfirmed() {
    return SharedPreferences.getInstance().then((prefs) {
      Iterable iterable = jsonDecode(prefs.getString(AppConstant.CONFIRMED));
      return iterable.map((e) => ListConfirmed.fromJson(e)).toList();
    });
  }

  Future<bool> saveListConfirmed(List<ListConfirmed> listConfirmed) {
    return SharedPreferences.getInstance().then((prefs) {
      String json = jsonEncode(listConfirmed);
      return prefs.setString(AppConstant.CONFIRMED, json);
    });
  }

}