import 'package:dio/dio.dart';
import 'package:kawalcovid19/network/repository.dart';
import 'package:kawalcovid19/network/rest_client.dart';

class ApiRepository implements Repository {
  Dio dio;
  RestClient client;

  ApiRepository() {
    dio = Dio(); // Provide a dio instance
    client = RestClient(dio);
  }

  Future<List<Post>> getPosts() {
    return client.getPosts();
  }

  @override
  Future<Post> getFaq() {
    return client.getFaq();
  }

  @override
  Future<bool> savePosts(List<Post> posts) {
    return Future.value(false);
  }

  @override
  Future<bool> saveFaq(Post faq) {
    return Future.value(false);
  }

  @override
  Future<bool> saveStatistics(Statistics statistics) {
    return Future.value(false);
  }

  @override
  Future<Statistics> getStatistics() {
    return client.getStatistics();
  }

}
