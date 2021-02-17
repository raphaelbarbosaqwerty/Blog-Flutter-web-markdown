import 'package:blog_flutter_fluro_template/app/domain/entities/result_post_entity.dart';
import 'package:blog_flutter_fluro_template/app/domain/error/errors.dart';
import 'package:dartz/dartz.dart';

abstract class IPostService<T> {
  Future<Either<Failure, List<T>>> getPosts(String pathName);
  Future<Either<Failure, ResultPostEntity>> getPostByPath(String pathName);
  Either<Failure, String> getPostUrlByPath(String pathName);
  Future<Either<Failure, ResultPostEntity>> getPostWithNameFromPath(String postName, String pathName);
}
