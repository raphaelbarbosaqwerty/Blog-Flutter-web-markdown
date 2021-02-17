import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import './core/utils/constants.dart';
import 'core/router/blog_router.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: defaultBlogName,
      theme: ThemeData(
        scaffoldBackgroundColor: HexColor(backgroundColor),
      ),
      initialRoute: '/home',
      onGenerateRoute: BlogRouter.router.generator,
    );
  }
}