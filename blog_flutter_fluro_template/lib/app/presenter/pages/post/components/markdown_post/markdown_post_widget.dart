import 'package:blog_flutter_fluro_template/app/presenter/pages/components/keyword/keyword_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkdownPostWidget extends StatelessWidget {
  const MarkdownPostWidget({Key key, this.pathPost, this.text, this.title, this.date, this.keywords}) : super(key: key);

  final pathPost;
  final keywords;
  final title;
  final text;
  final date;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 20),
          child: Builder(
            builder: (context) {
              return Column(
                children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for(var word in keywords.toString().replaceAll('[', '').replaceAll(']', '').replaceAll(' ', '').split(','))
                          Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: Container(
                              child: Center(
                                child: KeyWordWidget(
                                  name: word.toUpperCase() ,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text('$title', style: TextStyle(color: Colors.white, fontSize: 40)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text('$date', style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                  Container(
                    child: Theme(
                    data: ThemeData(
                        textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white), bodyText2: TextStyle(color: Colors.white)),
                      ), 
                      child: MarkdownBody(
                        selectable: true,
                        data: text,
                        styleSheet: MarkdownStyleSheet(
                          code: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          h1: TextStyle(color: Colors.white, fontSize: 40),
                          h2: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                          h3: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                          h4: TextStyle(color: Colors.white, fontSize: 12),
                          h5: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    )
                  ),
                ],
              );
            },
          ), 
      ),
    );
  }
}