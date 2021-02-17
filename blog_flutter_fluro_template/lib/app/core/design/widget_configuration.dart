import 'package:flutter/material.dart';

class WidgetConfiguration extends StatelessWidget {
  const WidgetConfiguration({Key key, this.child}) : super(key: key);
  final child;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.15;
    final height = MediaQuery.of(context).size.height * 0.8;
    
    MediaQueryData deviceInfo = MediaQuery.of(context);

    return Padding(
      padding: EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: width, right: width),
          child: child,
        ),
      ),
    );
  }
}