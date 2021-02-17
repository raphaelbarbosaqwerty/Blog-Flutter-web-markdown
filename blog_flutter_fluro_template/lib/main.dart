import 'package:blog_flutter_fluro_template/app/domain/usecases/get_post_by_path.dart';
import 'package:blog_flutter_fluro_template/app/domain/usecases/get_post_with_name_from_path.dart';
import 'package:blog_flutter_fluro_template/app/domain/usecases/get_url_post_by_path.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app/app.dart';
import 'app/core/router/blog_router.dart';
import 'app/data/datasource/internal_datasource.dart';
import 'app/domain/usecases/get_all_posts.dart';
import 'app/infra/services/post_service_adapter.dart';
import 'app/presenter/pages/home/home_store.dart';
import 'app/presenter/pages/post/post_store.dart';

void main() {
  BlogRouter.setupRouter();

  WidgetsFlutterBinding.ensureInitialized(); 
  dependencyInjection();
  
  runApp(App());
}

void dependencyInjection() {
  GetIt getIt = GetIt.I;

  // Internal
  InternalDatasource internalDatasource = InternalDatasource();
  PostServiceAdapter postServiceAdapter = PostServiceAdapter(internalDatasource);

  // Usecases
  IGetAllPosts getAllPosts = GetAllPosts(postServiceAdapter);
  IGetPostByPath getPostByPath = GetPostByPath(postServiceAdapter);
  IGetUrlPostByPath getUrlPostByPath = GetUrlPostByPath(postServiceAdapter);
  IGetPostWithNameFromPath getPostWithNameFromPath = GetPostWithNameFromPath(postServiceAdapter);
  
  // Stores
  PostStore postStore = PostStore(getPostWithNameFromPath);
  HomeStore homeStore = HomeStore(getAllPosts, getPostByPath, getUrlPostByPath);

  // DI
  getIt.registerSingleton(internalDatasource);
  getIt.registerSingleton(postServiceAdapter);
  getIt.registerSingleton(getAllPosts);
  getIt.registerSingleton(homeStore);
  getIt.registerSingleton(postStore);
}