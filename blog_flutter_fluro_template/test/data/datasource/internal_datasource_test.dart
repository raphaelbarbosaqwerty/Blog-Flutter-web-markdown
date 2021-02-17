import 'package:blog_flutter_fluro_template/app/data/datasource/internal_datasource.dart';
import 'package:blog_flutter_fluro_template/app/domain/entities/result_post_entity.dart';
import 'package:flutter_test/flutter_test.dart';


main() {
  
  final sut = InternalDatasource();
  test('Should return a list of ResultPostModel when get', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final future = sut.getPosts('assets/markdown_posts/');
    expect(future, completes);
  });

  test('Should return a ResultPostModel when GetPostByPath', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final future = await sut.getPostByPath('assets/markdown_posts/about/0-welcome.md');
    expect(future, isA<ResultPostEntity>());
  });

  test('Should return a Url<String> when GetPostUrlByPath', () {
    TestWidgetsFlutterBinding.ensureInitialized();
    final future = sut.getPostUrlByPath('assets/markdown_posts/about/0-welcome.md');
    expect(future, isA<String>());
  });

  test('Should return a ResultPostModel when GetPostWithNameFromPath', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final future = await sut.getPostWithNameFromPath('0-welcome', 'assets/markdown_posts/about/0-welcome.md');
    expect(future, isA<ResultPostEntity>());
  });
}