import 'package:kawalcovid19/network/api/rest_client.dart';

abstract class Repository {

  Future<List<Post>> getPosts([int page = 1]);

  Future<Post> getFaq();

  Future<Post> getAbout();

  Future<Statistics> getStatistics();

}
