import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kawalcovid19/const/app_constant.example.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part 'rest_client.g.dart';

@RestApi(baseUrl: AppConstant.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/categories")
  Future<List<Category>> getCategories();

  @GET("/posts")
  Future<List<Post>> getPosts();

  @GET("/posts")
  Future<List<Post>> getPostsByCategory(@Query("categories") String category);

  @GET("/posts/2")
  Future<Post> getFaq();
}

@JsonSerializable()
class Category extends Equatable {
  final int id;
  final String description;
  final String name;

  Category(this.id, this.description, this.name);

  @override
  List<Object> get props => throw UnimplementedError();

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
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

  factory Renderable.fromJson(Map<String, dynamic> json) =>
      _$RenderableFromJson(json);

  Map<String, dynamic> toJson() => _$RenderableToJson(this);
}
