import 'package:blog_flutter_fluro_template/app/core/design/pages_configuration.dart';
import 'package:blog_flutter_fluro_template/app/core/design/widget_configuration.dart';
import 'package:blog_flutter_fluro_template/app/infra/model/result_post_model.dart';
import 'package:blog_flutter_fluro_template/app/presenter/pages/home/components/card/card_widget.dart';
import 'package:blog_flutter_fluro_template/app/presenter/pages/post/post_store.dart';
import 'package:blog_flutter_fluro_template/app/presenter/pages/post/states/post_state.dart';
import 'package:blog_flutter_fluro_template/app/presenter/states/states.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'components/markdown_post/markdown_post_widget.dart';

class PostPage extends StatefulWidget {
  final String markdownTextPath;
  final String postName;

  PostPage({Key key, this.markdownTextPath, this.postName}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  PostStore store = GetIt.I.get<PostStore>();

  @override
  Widget build(BuildContext context) {
    return PageConfiguration(
      child: WidgetConfiguration(
        child: Column(
          children: [
            FutureBuilder(
              future: store.getPostInformations(postName: widget.postName, pathName: 'assets/markdown_posts/'),
              builder: (context, snapshot) {
                return RxBuilder(
                  builder: (_) {
                    
                    if(store.state is ErrorState) {
                      return Center(
                        child: Text('Error post not found!', style: TextStyle(color: Colors.white)),
                      );
                    }

                    if(store.state is PostSuccessState) {
                      if(store.state?.model == null) return CircularProgressIndicator();
                      var text = _cleanMarkdownText(store.state.model);
                      var blogModel = store.state.model;
                      return Column(
                        children: [
                          CardWidget(
                            image: DecorationImage(
                              image: AssetImage('${blogModel.headerImageLocal}'), fit: BoxFit.cover
                            ),
                            listKeyWordWidget: [],
                          ),
                          if(blogModel.title != null || blogModel.title != "")
                            MarkdownPostWidget(
                              text: text, 
                              title: blogModel.title,
                              date: blogModel.date,
                              keywords: blogModel.keywords,
                            )
                          else
                            Container(
                              child: Center(
                                child: Text('A postagem não foi encontrada! Favor tentar novamente', style: TextStyle(color: Colors.white)),
                              ),
                            ),
                        ],
                      );
                    } else if(store.state is LoadingState) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      return Text('AA');
                    }
                  }
                );
              }
            ),
          ],
        ),
      ),
    );
  }

  String _cleanMarkdownText(ResultPostModel blogModel) {
    var removeKeywords = blogModel.keywords.toString().replaceAll('[', '').replaceAll(']', '').replaceAll(' ', '');
    // print(blogModel.bodyContentPost.replaceAll(blogModel.keywords.toString(), ''));
    var text = blogModel.bodyContentPost
      .replaceAll(blogModel.title, '')
      .replaceAll(blogModel.date, '')
      .replaceAll(removeKeywords, '')
      .replaceAll(blogModel.headerImageLocal, '')
      .replaceFirst('#', '')
      .replaceFirst('####', '')
      .replaceFirst('####', '')
      .replaceFirst('####', '')
      .trim();

    return text;
  }
}