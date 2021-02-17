import 'package:blog_flutter_fluro_template/app/domain/entities/result_post_entity.dart';
import 'package:blog_flutter_fluro_template/app/domain/error/errors.dart';
import 'package:blog_flutter_fluro_template/app/domain/services/post_service.dart';
import 'package:blog_flutter_fluro_template/app/domain/usecases/get_all_posts.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class PostServiceSpy extends Mock implements IPostService {}
main() {
  
  final service = PostServiceSpy();
  final sut = GetAllPosts(service);
  test('Should get all posts', () async {
    when(service.getPosts(any)).thenAnswer((_) async => Right(<String>[]));
    final result = await sut.getPosts('path/markdown/');
    expect(result | null, isA<List<String>>());
  });

  test('Should return an Exception if PathName is null', () async {
    // when(service.getPosts(any)).thenAnswer((_) async => Right(<String>[]));
    when(service.getPosts(any)).thenThrow(Left(InvalidTextError()));
    final result = await sut.getPosts(null);
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}