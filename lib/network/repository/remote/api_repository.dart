import 'package:dio/dio.dart';
import 'package:kawalcovid19/network/repository/repository.dart';
import 'package:kawalcovid19/network/api/rest_client.dart';

class ApiRepository implements Repository {
  Dio dio;
  RestClient client;

  ApiRepository() {
    dio = Dio(); // Provide a dio instance
    client = RestClient(dio);
  }

  @override
  Future<List<Post>> getPosts([int page = 1]) {
    return client.getPosts(page);
  }

  @override
  Future<Post> getFaq() {
    return client.getFaq();
  }

  @override
  Future<Post> getAbout() {
    return client.getAbout();
  }

  @override
  Future<Statistics> getStatistics() {
    return client.getStatistics();
  }

}
