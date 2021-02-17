import 'package:blog_flutter_fluro_template/app/domain/entities/result_post_entity.dart';
import 'package:blog_flutter_fluro_template/app/domain/error/errors.dart';
import 'package:blog_flutter_fluro_template/app/domain/services/post_service.dart';
import 'package:blog_flutter_fluro_template/app/domain/usecases/get_post_by_path.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class PostServiceSpy extends Mock implements IPostService {}
main() {
  final service = PostServiceSpy();
  final sut = GetPostByPath(service);

  test('Should return GetPostByPath without errors', () async {
    when(service.getPostByPath(any)).thenAnswer((_) async => Right(ResultPostEntity()));
    final result = await sut.getPostByPath('assets/markdown_posts/about/1-about-me.md');
    expect(result | null, isA<ResultPostEntity>());
  });

  test('Should return Exception if get error when try to GetPostByPath', () async {
    when(service.getPostByPath(any)).thenThrow(Left(InvalidTextError()));
    final result = await sut.getPostByPath(null);
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}