import 'package:kawalcovid19/network/rest_client.dart';

abstract class Repository {

  Future<List<Post>> getPosts();

  Future<bool> savePosts(List<Post> posts);

  Future<Post> getFaq();

  Future<bool> saveFaq(Post faq);

  Future<Statistics> getStatistics();

  Future<bool> saveStatistics(Statistics statistics);

  Future<List<ListConfirmed>> getListConfirmed();

  Future<bool> saveListConfirmed(List<ListConfirmed> listConfirmed);
}
