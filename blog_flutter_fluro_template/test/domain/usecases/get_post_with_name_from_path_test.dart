import 'package:blog_flutter_fluro_template/app/domain/entities/result_post_entity.dart';
import 'package:blog_flutter_fluro_template/app/domain/error/errors.dart';
import 'package:blog_flutter_fluro_template/app/domain/services/post_service.dart';
import 'package:blog_flutter_fluro_template/app/domain/usecases/get_post_with_name_from_path.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class PostServiceSpy extends Mock implements IPostService {}
main() {
  
  final service = PostServiceSpy();
  final sut = GetPostWithNameFromPath(service);
  test('Should return GetPostWithNameFromPath without errors', () async {
    when(service.getPostWithNameFromPath(any, any)).thenAnswer((_) async => Right(ResultPostEntity()));
    final result = await sut.getPostWithNameFromPath('0-welcome', 'assets/markdown_posts/about/0-welcome.md');
    expect(result | null, isA<ResultPostEntity>());
  });

  test('Should an Exception when GetPostWithNameFromPath with one parameter valid', () async {
    when(service.getPostWithNameFromPath(any, any)).thenThrow(Left(InvalidTextError()));
    final result = await sut.getPostWithNameFromPath('0-welcome', null);
    expect(result.fold(id, id), isA<InvalidTextError>());
  });

  test('Should an Exception when GetPostWithNameFromPath with two parameters invalid', () async {
    when(service.getPostWithNameFromPath(any, any)).thenThrow(Left(InvalidTextError()));
    final result = await sut.getPostWithNameFromPath(null, null);
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}