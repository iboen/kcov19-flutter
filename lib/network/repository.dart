import 'package:kawalcovid19/network/rest_client.dart';

abstract class Repository {
  Future<List<Post>> getPosts();

  Future<bool> savePosts(List<Post> posts);

  Future<Post> getFaq();

  Future<bool> saveFaq(Post faq);
}
