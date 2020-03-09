import 'dart:convert';

import 'package:kawalcovid19/network/repository.dart';
import 'package:kawalcovid19/network/rest_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepository implements Repository {
  static const LAST_UPDATE_POSTS = "last_update_posts";
  static const POSTS = "posts";
  static const LAST_UPDATE_FAQ = "last_update_faq";
  static const FAQ = "faq";
  static const LAST_UPDATE_STATISTICS = "last_update_statistics";
  static const STATISTICS = "statistics";

  Future<List<Post>> getPosts() async {
    return SharedPreferences.getInstance().then((prefs) {
      Iterable iterable = jsonDecode(prefs.getString(POSTS));
      return iterable.map((e) => Post.fromJson(e)).toList();
    });
  }

  @override
  Future<Post> getFaq() {
    return SharedPreferences.getInstance().then((prefs) {
      Map json = jsonDecode(prefs.getString(FAQ));
      return Post.fromJson(json);
    });
  }

  @override
  Future<bool> savePosts(List<Post> posts) {
    return SharedPreferences.getInstance().then((prefs) {
      String json = jsonEncode(posts);
      return prefs.setString(POSTS, json);
    });
  }

  @override
  Future<bool> saveFaq(Post faq) {
    return SharedPreferences.getInstance().then((prefs) {
      String json = jsonEncode(faq);
      return prefs.setString(FAQ, json);
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
      Map json = jsonDecode(prefs.getString(STATISTICS));
      return Statistics.fromJson(json);
    });
  }

  @override
  Future<bool> saveStatistics(Statistics statistics) {
    return SharedPreferences.getInstance().then((prefs) {
      String json = jsonEncode(statistics);
      return prefs.setString(STATISTICS, json);
    });
  }

}