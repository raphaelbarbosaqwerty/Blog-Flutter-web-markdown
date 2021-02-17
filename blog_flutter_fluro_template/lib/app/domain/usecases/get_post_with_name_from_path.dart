import 'package:blog_flutter_fluro_template/app/domain/entities/result_post_entity.dart';
import 'package:blog_flutter_fluro_template/app/domain/error/errors.dart';
import 'package:blog_flutter_fluro_template/app/domain/services/post_service.dart';
import 'package:dartz/dartz.dart';

abstract class IGetPostWithNameFromPath {
  Future<Either<Failure, ResultPostEntity>> getPostWithNameFromPath(String postName, String pathName);
}

class GetPostWithNameFromPath implements IGetPostWithNameFromPath {
  final IPostService service;

  GetPostWithNameFromPath(this.service);

  @override
  Future<Either<Failure, ResultPostEntity>> getPostWithNameFromPath(String postName, String pathName) async {
    
    if(postName == "" || postName == null) {
      return Left(InvalidTextError());
    }

    if(pathName == "" || pathName == null) {
      return Left(InvalidTextError());
    }
    
    var result = await service.getPostWithNameFromPath(postName, pathName);
    return result;
  }
}
