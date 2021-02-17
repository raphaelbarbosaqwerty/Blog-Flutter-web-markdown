import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class KeyWordWidget extends StatelessWidget {
  const KeyWordWidget({Key key, this.name}) : super(key: key);

  final name;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: HexColor('#323a96'),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Text('$name', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
      ),
    );
  }
}