import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'components/bottom_bar/bottom_bar_widget.dart';
import 'components/menu_bar/menu_bar_widget.dart';

class PageConfiguration extends StatelessWidget {
  const PageConfiguration({Key key, this.child}) : super(key: key);
  final child;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MenuBarWidget(),
            child,
            BottomBarWidget()
          ],
        ),
      )
    ); 
  }
}