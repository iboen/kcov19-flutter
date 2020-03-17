import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kawalcovid19/const/api_constant.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part 'rest_client.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/categories")
  Future<List<Category>> getCategories();

  @GET("/posts")
  Future<List<Post>> getPosts(@Query("page") int page);

  @GET("/posts")
  Future<List<Post>> getPostsByCategory(@Query("categories") String category);

  @GET("/posts/2")
  Future<Post> getFaq();

  @GET("/posts/282")
  Future<Post> getAbout();

  @GET("https://kawalcovid19.harippe.id/api/summary")
  Future<Statistics> getStatistics();

  @GET("https://kawalcovid19.harippe.id/api/raw")
  Future<List<ListConfirmed>> getListConfirmed();
}

@JsonSerializable()
class ListConfirmed extends Equatable {

  final String caseId;
  final int age;
  final String gender;
  final String city;
  final String province;
  final String firstContactAt;
  final String hospitalizedIn;
  final String notes;

  ListConfirmed(this.caseId, this.age, this.gender, this.city, this.province, this.firstContactAt, this.hospitalizedIn, this.notes);

  @override
  List<Object> get props => [caseId, age, gender, city, province, firstContactAt, hospitalizedIn, notes];

  factory ListConfirmed.fromJson(Map<String, dynamic> json) => _$ListConfirmedFromJson(json);
  Map<String, dynamic> toJson() => _$ListConfirmedToJson(this);

}

@JsonSerializable()
class Statistics extends Equatable {

  final Value confirmed;
  final Value activeCare;
  final Value recovered;
  final Value deaths;
  final Value metadata;

  Statistics(this.confirmed, this.activeCare, this.recovered, this.deaths, this.metadata);

  @override
  List<Object> get props => [confirmed, activeCare, recovered, deaths, metadata];

  factory Statistics.fromJson(Map<String, dynamic> json) => _$StatisticsFromJson(json);
  Map<String, dynamic> toJson() => _$StatisticsToJson(this);

}

@JsonSerializable()
class Value extends Equatable {

  final int value;
  final String lastUpdatedAt;

  Value(this.value, this.lastUpdatedAt);

  @override
  List<Object> get props => [value, lastUpdatedAt];

  factory Value.fromJson(Map<String, dynamic> json) =>
      _$ValueFromJson(json);

  Map<String, dynamic> toJson() => _$ValueToJson(this);

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
  final String slug;

  Post(this.id, this.title, this.excerpt, this.content, this.date, this.slug);

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