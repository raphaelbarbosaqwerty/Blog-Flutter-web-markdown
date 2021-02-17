import 'package:blog_flutter_fluro_template/app/domain/error/errors.dart';
import 'package:blog_flutter_fluro_template/app/domain/services/post_service.dart';
import 'package:blog_flutter_fluro_template/app/infra/services/post_service_adapter.dart';
import 'package:dartz/dartz.dart';

abstract class IGetUrlPostByPath {
  Either<Failure, String> getUrlPostWithPath(String postPath);
}

class GetUrlPostByPath implements IGetUrlPostByPath {
  final IPostService service;

  GetUrlPostByPath(this.service);

  @override
  Either<Failure, String> getUrlPostWithPath(String postPath) {
    if(postPath == "" || postPath == null) {
      return Left(InvalidTextError());
    }

    return service.getPostUrlByPath(postPath);
  }
}