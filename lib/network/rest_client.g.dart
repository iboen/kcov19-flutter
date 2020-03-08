// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    json['id'] as int,
    json['title'] == null
        ? null
        : Renderable.fromJson(json['title'] as Map<String, dynamic>),
    json['excerpt'] == null
        ? null
        : Renderable.fromJson(json['excerpt'] as Map<String, dynamic>),
    json['content'] == null
        ? null
        : Renderable.fromJson(json['content'] as Map<String, dynamic>),
    json['date'] as String,
  );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'excerpt': instance.excerpt,
      'content': instance.content,
      'date': instance.date,
    };

Renderable _$RenderableFromJson(Map<String, dynamic> json) {
  return Renderable(
    json['rendered'] as String,
  );
}

Map<String, dynamic> _$RenderableToJson(Renderable instance) =>
    <String, dynamic>{
      'rendered': instance.rendered,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'http://demo5353862.mockable.io/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getPosts() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('/posts',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Post.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  getFaq() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/posts/2',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Post.fromJson(_result.data);
    return Future.value(value);
  }
}
