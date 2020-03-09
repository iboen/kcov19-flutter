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

  @override
  Future<List<ListConfirmed>> getListConfirmed() {
    return client.getListConfirmed();
  }

  @override
  Future<bool> saveListConfirmed(List<ListConfirmed> listConfirmed) {
    return Future.value(false);
  }

}
