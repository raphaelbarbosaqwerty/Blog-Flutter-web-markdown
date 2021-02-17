import 'package:blog_flutter_fluro_template/app/domain/entities/result_post_entity.dart';
import 'package:blog_flutter_fluro_template/app/domain/error/errors.dart';
import 'package:blog_flutter_fluro_template/app/domain/services/post_service.dart';
import 'package:blog_flutter_fluro_template/app/infra/datasource/internal_datasource_adapter.dart';
import 'package:dartz/dartz.dart';

class PostServiceAdapter<T> implements IPostService {
  
  final InternalDatasourceAdapter service;

  PostServiceAdapter(this.service);
   
  @override
  Future<Either<Failure, List<T>>> getPosts(String pathName) async {
    try {
      final result = await service.getPosts(pathName);
      return Right(result);
    } on DatasourceResultNull catch(e) {
      return Left(e);
    } catch(e) {
      return Left(DatasourceResultNull());
    }
  }

  @override
  Future<Either<Failure, ResultPostEntity>> getPostByPath(String pathName) async {
    try {
      final result = await service.getPostByPath(pathName);
      return Right(result);      
    } on DatasourceResultNull catch(e) {
      return Left(e);  
    } catch(e) {
      return Left(DatasourceResultNull());
    }
  }

  @override
  Either<Failure, String> getPostUrlByPath(String pathName) {
    try {
      final result = service.getPostUrlByPath(pathName);
      return Right(result);
    } on DatasourceResultNull catch(e) {
      return Left(e);
    } catch(e) {
      return Left(DatasourceResultNull());
    }
  }

  @override
  Future<Either<Failure, ResultPostEntity>> getPostWithNameFromPath(String postName, String pathName) async {
    try {
      final result = await service.getPostWithNameFromPath(postName, pathName);
      return Right(result);
    } on DatasourceResultNull catch(e) {
      return Left(e);
    } catch(e) {
      return Left(DatasourceResultNull());
    }
  }
}