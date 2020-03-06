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
}
