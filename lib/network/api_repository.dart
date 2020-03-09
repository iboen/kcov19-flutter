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

  @override
  Future<List<Post>> getPosts() {
    return client.getPosts();
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

  @override
  Future<List<ListConfirmed>> getListConfirmed() {
    return client.getListConfirmed();
  }

}
