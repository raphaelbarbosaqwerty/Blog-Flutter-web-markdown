import 'package:blog_flutter_fluro_template/app/core/router/blog_router.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../widget_configuration.dart';

class MenuBarWidget extends StatelessWidget {
  const MenuBarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetConfiguration(
      child: Container(
        width: double.infinity,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              child: Row(
                children: [
                  Container(
                    width: 40,
                    child: Image.asset(defaultLogo),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(defaultTitle, style: TextStyle(color: Colors.white, fontSize: 18)),
                ],
              ),
              onTap: () {
                if(!ModalRoute.of(context).settings.name.contains('/home')) {
                  BlogRouter.router.navigateTo(context, '/home', transition: TransitionType.fadeIn);
                }
              },
            ),
            const SizedBox(
              width: 30,
            ),
            Row(
              children: [
                Wrap(
                  children: [
                    InkWell(
                      child: Text('Home', style: TextStyle(color: Colors.white, fontSize: 18)),
                      onTap: () {
                        if(!ModalRoute.of(context).settings.name.contains('/home')) {
                          BlogRouter.router.navigateTo(context, '/home', transition: TransitionType.fadeIn);
                        }
                      },
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      child: Text('About', style: TextStyle(color: Colors.white, fontSize: 18)),
                      onTap: () {
                        if(!ModalRoute.of(context).settings.name.contains('/about')) {
                          BlogRouter.router.navigateTo(context, '/post/0/about', transition: TransitionType.fadeIn);
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}