import 'package:blog_flutter_fluro_template/app/presenter/pages/components/keyword/keyword_widget.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class CardWidget extends StatelessWidget {
  const CardWidget({Key key, this.width=double.infinity, this.height=400, this.child, this.image, this.title, this.content, this.listKeyWordWidget, this.header=false}) : super(key: key);

  final List<KeyWordWidget> listKeyWordWidget;
  final double width;
  final String title;
  final double height;
  final String content;
  final bool header;
  final child;
  final image;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: HexColor('#0a0a12'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: image,
        ),
        width: width,
        height: height,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: header ? child : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 150,
              ),
              Wrap(
                spacing: 5.0,
                direction: Axis.horizontal,
                children: [
                  Row(
                    children: List.generate(listKeyWordWidget.length, (index) {
                        return KeyWordWidget(
                          name: listKeyWordWidget[index].name
                        );
                      })
                  ),
                ]
              ),
              const SizedBox(
                height: 15,
              ),
              Text('${title ?? ""}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(
                height: 15,
              ),
              Text('${content ?? ""}', style: TextStyle(color: Colors.grey), overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ),
    );
  }
}