import 'package:blog_flutter_fluro_template/app/domain/usecases/get_all_posts.dart';
import 'package:blog_flutter_fluro_template/app/domain/usecases/get_post_by_path.dart';
import 'package:blog_flutter_fluro_template/app/domain/usecases/get_url_post_by_path.dart';
import 'package:blog_flutter_fluro_template/app/presenter/pages/home/home_store.dart';
import 'package:mockito/mockito.dart';

class GetAllPostsSpy extends Mock implements IGetAllPosts {}

class GetPostByPathSpy extends Mock implements IGetPostByPath {}

class GetUrlPostByPathSpy extends Mock implements IGetUrlPostByPath {}

class HomeStoreSpy extends Mock implements HomeStore {}

main() {
  
}