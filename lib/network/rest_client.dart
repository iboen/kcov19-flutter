import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kawalcovid19/const/app_constant.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part 'rest_client.g.dart';

@RestApi(baseUrl: AppConstant.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/posts")
  Future<List<Post>> getPosts();

}

@JsonSerializable()
class Post extends Equatable{
  final String id;
  final String title;

  Post(this.id, this.title);

  @override
  List<Object> get props =>  [id, title];

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);

}