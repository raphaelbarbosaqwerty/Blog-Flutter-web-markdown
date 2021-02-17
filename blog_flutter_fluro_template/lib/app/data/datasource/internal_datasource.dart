import 'dart:convert';

import 'package:blog_flutter_fluro_template/app/infra/datasource/internal_datasource_adapter.dart';
import 'package:blog_flutter_fluro_template/app/infra/model/result_post_model.dart';
import 'package:flutter/services.dart';

import '../../core/utils/constants.dart';

class InternalDatasource<T> implements InternalDatasourceAdapter {
  @override
  Future<List<T>> getPosts(String pathName) async {
    var postsList = [];
    var posts = await _loadFile(pathFolder: pathName);
    postsList.addAll(posts);
    return postsList;
  }

  @override
  Future<ResultPostModel> getPostByPath(String pathName) async {
    final posts = await _loadFile(pathFolder: pathName);
    var namePost = posts.toList().firstWhere((element) => element.toString().contains(pathName), orElse: () => "");
    return _getPostInformations(markdown: namePost);
  }

  @override
  Future<ResultPostModel> getPostWithNameFromPath(String postName, String pathName) async {
    final posts = await _loadFile(pathFolder: pathName);
    var namePost = posts.toList().firstWhere((element) => element.toString().contains(postName), orElse: () => "");
    return _getPostInformations(markdown: namePost);
  }

  Future<ResultPostModel> _getPostInformations({String markdown}) async {
    if(markdown != null && markdown != "") {
      var response = await rootBundle.loadString(markdown);
      IMarkdownPostController markdownPostController = MarkdownPostController(data: response);
      var headerImage = markdownPostController.getHeaderImage(data: response);
      var title = markdownPostController.getTitle(data: response);
      var date = markdownPostController.getDate(data: response);
      var subtitle = markdownPostController.getSubtitle(data: response);
      var keywords = markdownPostController.getKeywords(data: response);
      
      return ResultPostModel(
        headerImageLocal: headerImage, 
        bodyContentPost: response,
        title: title,
        date: date,
        subtitle: subtitle,
        keywords: keywords
      );
    }
    
    return ResultPostModel(headerImageLocal: defaultHeaderImage);
  }

  Future _loadFile({String pathFolder}) async {
    final manifestJson = await rootBundle.loadString('AssetManifest.json');
    final posts = json.decode(manifestJson).keys.where((String key) => key.startsWith(pathFolder));
    return posts;
  }

  @override
  String getPostUrlByPath(String pathName) {
    var splitFileName = pathName.toString().split('/');
    var findUrl = splitFileName.indexWhere((element) => element.contains('.md'));

    return splitFileName[findUrl].split('.')[0];
  }
}

// TODO - REMOVE THIS FROM HERE
abstract class IMarkdownPostController {
  String getTitle({dynamic data});
  String getDate({dynamic data});
  String getHeaderImage({dynamic data});
  String getSubtitle({dynamic data});
  List<String> getKeywords({dynamic data});
}

class MarkdownPostController implements IMarkdownPostController {

  final String data;

  MarkdownPostController({this.data});

  @override
  String getTitle({dynamic data}) {
    return data.split('\n')[0].replaceAll('#', '').trim();
  }

  @override
  String getDate({dynamic data}) {
    return data.split('\n')[1].replaceAll('#', '').trim();
  }

  @override
  String getHeaderImage({dynamic data}) {
    return data.split('\n')[3].replaceAll('#', '').trim();
  }

  @override
  String getSubtitle({dynamic data}) {
    return data.split('\n')[5].replaceAll('#', '').trim();
  }

  @override
  List<String> getKeywords({dynamic data}) {
    return data.split('\n')[2].replaceAll('#', '').trim().split(',').toList();
  }
}