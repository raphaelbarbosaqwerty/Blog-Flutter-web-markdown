import 'package:blog_flutter_fluro_template/app/domain/entities/result_post_entity.dart';
import 'package:blog_flutter_fluro_template/app/domain/error/errors.dart';
import 'package:blog_flutter_fluro_template/app/domain/services/post_service.dart';
import 'package:dartz/dartz.dart';

abstract class IGetPostByPath {
  Future<Either<Failure, ResultPostEntity>> getPostByPath(String pathName);
}

class GetPostByPath implements IGetPostByPath {
  final IPostService service;

  GetPostByPath(this.service);

  @override
  Future<Either<Failure, ResultPostEntity>> getPostByPath(String pathName) async {
    if(pathName == "" || pathName == null) {
      return Left(InvalidTextError());
    }

    return await service.getPostByPath(pathName);
  }
}
