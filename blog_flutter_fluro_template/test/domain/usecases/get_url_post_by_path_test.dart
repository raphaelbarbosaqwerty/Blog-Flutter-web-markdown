import 'package:blog_flutter_fluro_template/app/domain/error/errors.dart';
import 'package:blog_flutter_fluro_template/app/domain/services/post_service.dart';
import 'package:blog_flutter_fluro_template/app/domain/usecases/get_url_post_by_path.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class PostServiceSpy extends Mock implements IPostService {}
main() {

  final service = PostServiceSpy();
  final sut = GetUrlPostByPath(service);

  test('Should return post URL when GetUrlPostByPath', () async {
    when(service.getPostUrlByPath(any)).thenAnswer((_) => Right('example-url'));
    var result = await sut.getUrlPostWithPath('assets/markdown_posts/about/0-welcome.md');
    expect(result | null, isA<String>());
  });

  test('Should return an Exception when GetUrlPostByPath', () async {
    when(service.getPostUrlByPath(any)).thenThrow(Left(InvalidTextError()));
    var result = await sut.getUrlPostWithPath(null);
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}