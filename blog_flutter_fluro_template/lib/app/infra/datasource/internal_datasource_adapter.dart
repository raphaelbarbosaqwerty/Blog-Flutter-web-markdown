

import 'package:blog_flutter_fluro_template/app/infra/model/result_post_model.dart';

abstract class InternalDatasourceAdapter<T> {
  Future<List<T>> getPosts(String pathName);
  Future<ResultPostModel> getPostByPath(String pathName);
  String getPostUrlByPath(String pathName);
  Future<ResultPostModel> getPostWithNameFromPath(String postName, String pathName);
}