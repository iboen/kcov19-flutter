import 'package:kawalcovid19/network/rest_client.dart';

abstract class Repository {
  Future<List<Post>> getPosts();
  Future<Post> getFaq();
}
