import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../widget_configuration.dart';
import 'components/bottom_social_media_button/bottom_social_media_button_widget.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor('#0a0a12'),
      height: 250,
      width: double.infinity,
      child: WidgetConfiguration(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Wrap(
                    children: [
                      BottomSocialMediaButtonWidget(
                        icon: FaIcon(FontAwesomeIcons.twitter, color: Colors.white),
                        url: 'https://twitter.com',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      BottomSocialMediaButtonWidget(
                        icon: FaIcon(FontAwesomeIcons.github, color: Colors.white),
                        url: 'https://github.com/raphaelbarbosaqwerty',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      BottomSocialMediaButtonWidget(
                        icon: FaIcon(FontAwesomeIcons.youtube, color: Colors.white),
                        url: 'https://youtube.com',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      BottomSocialMediaButtonWidget(
                        icon: FaIcon(FontAwesomeIcons.linkedinIn, color: Colors.white),
                        url: 'https://linkedin.com/in/raphaelbarbosaqwerty',
                      ),
                      // const SizedBox(
                      //   width: 10,
                      // ),
                      // BottomSocialMediaButtonWidget(
                      //   icon: FaIcon(FontAwesomeIcons.instagram, color: Colors.white),
                      //   url: 'https://instagram.com',
                      // ),
                      // const SizedBox(
                      //   width: 10,
                      // ),
                      // BottomSocialMediaButtonWidget(
                      //   icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.white),
                      //   url: 'https://facebook.com',
                      // ),
                    ],
                  ),
                ),
                Text('2020 © Cosmicshell. Design based on Artem Sheludko. With Flutter.', style: TextStyle(color: Colors.white))
              ],
            ),
          ],
        ),
      )
    );
  }
}