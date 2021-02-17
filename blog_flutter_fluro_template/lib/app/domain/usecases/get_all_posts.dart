import 'package:blog_flutter_fluro_template/app/domain/error/errors.dart';
import 'package:blog_flutter_fluro_template/app/domain/services/post_service.dart';
import 'package:dartz/dartz.dart';

abstract class IGetAllPosts<T> {
  Future<Either<Failure, List<T>>> getPosts(String pathName);
}

class GetAllPosts<T> implements IGetAllPosts {
  final IPostService service;

  GetAllPosts(this.service);

  @override
  Future<Either<Failure, List<T>>> getPosts(String pathName) async {
    if(pathName == null || pathName.isEmpty) {
      return Left(InvalidTextError());
    }

    return service.getPosts(pathName);
  }

}