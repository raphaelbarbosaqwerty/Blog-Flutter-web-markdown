import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../utils/constants.dart';

class BottomSocialMediaButtonWidget extends StatelessWidget {
  const BottomSocialMediaButtonWidget({Key key, this.url, this.icon}) : super(key: key);

  final url;
  final icon;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor(backgroundColor),
      child: IconButton(
        icon: icon, 
        onPressed: () async {
          await launch(url);
        }
      ),
    );
  }
}