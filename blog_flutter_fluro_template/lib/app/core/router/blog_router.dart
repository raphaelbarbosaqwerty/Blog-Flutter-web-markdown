import 'package:blog_flutter_fluro_template/app/presenter/pages/home/home_page.dart';
import 'package:blog_flutter_fluro_template/app/presenter/pages/post/post_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class BlogRouter {

  // ignore: missing_required_param
  static final router = FluroRouter();
  // static final router = FluroRouter();

  static Handler _homeHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => HomePage());

  // static Handler _booksHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => BooksPage());

  // static Handler _bookHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => BookPage(
  //   markdownTextPath: context.settings.arguments
  // ));

  static Handler _postsHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => PostPage(
    postName: params['name'][0],
    markdownTextPath: context.settings.arguments,
  ));

  static void setupRouter() {
    router.define(
      '/home',
      handler: _homeHandler
    );

    // router.define(
    //   '/books', 
    //   handler: _booksHandler
    // );

    // router.define(
    //   '/book/:name',
    //   handler: _bookHandler
    // );

    router.define(
      '/post/:id/:name', 
      handler: _postsHandler
    );
  }
}

