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
class Post extends Equatable {
  final int id;
  final Renderable title;
  final Renderable excerpt;
  final Renderable content;
  final String date;

  Post(this.id, this.title, this.excerpt, this.content, this.date);

  @override
  List<Object> get props => [id, excerpt, title, content, date];

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}

@JsonSerializable()
class Renderable extends Equatable {
  final String rendered;

  Renderable(this.rendered);

  @override
  List<Object> get props => [rendered];

  factory Renderable.fromJson(Map<String, dynamic> json) => _$RenderableFromJson(json);

  Map<String, dynamic> toJson() => _$RenderableToJson(this);
}
