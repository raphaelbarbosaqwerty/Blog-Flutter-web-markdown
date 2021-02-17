import 'package:blog_flutter_fluro_template/app/domain/entities/result_post_entity.dart';
import 'package:blog_flutter_fluro_template/app/domain/error/errors.dart';
import 'package:blog_flutter_fluro_template/app/infra/datasource/internal_datasource_adapter.dart';
import 'package:blog_flutter_fluro_template/app/infra/model/result_post_model.dart';
import 'package:blog_flutter_fluro_template/app/infra/services/post_service_adapter.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';



class InternalDatasourceAdapterSpy extends Mock implements InternalDatasourceAdapter {}
main() {
  final service = InternalDatasourceAdapterSpy();
  final sut = PostServiceAdapter(service);

  test('Should return a list of String when get posts', () async {
    when(service.getPosts(any)).thenAnswer((_) async => <String>[]);
    final result = await sut.getPosts('path/markdown');
    expect(result | null, isA<List<String>>());
  });

  test('Should return an DatasourceError if datasource fails when try to get posts', () async {
    when(service.getPosts(any)).thenThrow(Exception());
    final result = await sut.getPosts('path/markdown');
    expect(result.fold(id, id), isA<DatasourceResultNull>());
  });

  test('Should return a ResultPostEntity when GetPostByPath', () async {
    when(service.getPostByPath(any)).thenAnswer((_) async => ResultPostModel());
    var result = await sut.getPostByPath('any');
    expect(result | null, isA<ResultPostEntity>());
  });

  test('Should return an DatasourceError when GetPostByPath and get error', () async {
    when(service.getPostByPath(any)).thenThrow(Left(DatasourceResultNull()));
    var result = await sut.getPostByPath(null);
    expect(result.fold(id, id), isA<DatasourceResultNull>());
  });

  test('Should return the Post Url when GetPostUrlByPath', () async {
    when(service.getPostUrlByPath(any)).thenAnswer((_) => 'example-url');
    final result = sut.getPostUrlByPath('path/markdown');
    expect(result | null, isA<String>());
  });

  test('Should return an DatasourceError when GetPostUrlByPath and get error', () async {
    when(service.getPostUrlByPath(any)).thenThrow(Left(DatasourceResultNull()));
    final result = sut.getPostUrlByPath(null);
    expect(result.fold(id, id), isA<DatasourceResultNull>());
  });

  test('Should return the complete Post when GetPostWithNameFromPath', () async {
    when(service.getPostWithNameFromPath(any, any)).thenAnswer((_) async => ResultPostModel());
    final result = await sut.getPostWithNameFromPath('0-welcome', 'assets/markdown_posts/about/0-welcome.md');
    expect(result | null, isA<ResultPostModel>());
  });

  test('Should return an DatasourceError when GetPostWithNameFromPath and get error', () async {
    when(service.getPostWithNameFromPath(any, any)).thenThrow(Left(DatasourceResultNull()));
    final result = await sut.getPostWithNameFromPath('0-welcome', 'assets/wrong');
    expect(result.fold(id, id), isA<DatasourceResultNull>());
  });

}