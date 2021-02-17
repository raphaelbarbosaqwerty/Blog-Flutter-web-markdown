import 'package:blog_flutter_fluro_template/app/core/design/pages_configuration.dart';
import 'package:blog_flutter_fluro_template/app/core/design/widget_configuration.dart';
import 'package:blog_flutter_fluro_template/app/core/router/blog_router.dart';
import 'package:blog_flutter_fluro_template/app/presenter/pages/components/keyword/keyword_widget.dart';
import 'package:blog_flutter_fluro_template/app/presenter/states/states.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../core/utils/constants.dart';
import 'components/card/card_widget.dart';
import 'home_store.dart';
import 'states/home_state.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title='Home'}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeStore store = GetIt.I.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return PageConfiguration(
      child: WidgetConfiguration(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RxBuilder(
              builder: (_) {
                if(store.state is ErrorState) {
                  return Text('Error! Not found.');
                }

                if(store.state is HomeSuccessState) {
                  return Column(
                    children: [
                      CardWidget(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Hacking, Programming', style: TextStyle(color: Colors.white))
                          ],
                        ),
                        image: DecorationImage(
                          image: AssetImage(defaultHeaderImage),
                          fit: BoxFit.cover
                        ),
                        listKeyWordWidget: [],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        children: List.generate(store.state.list.length, (index) {
                          return FutureBuilder(
                            future: store.showPostFromPath(store.state.list[index]),
                            builder: (context, snapshot) {
                              if(!snapshot.hasData) return CircularProgressIndicator();
                              return InkWell(
                                child: CardWidget(
                                  header: false,
                                  image: DecorationImage(
                                    image: AssetImage('${snapshot.data.model.headerImageLocal}'), fit: BoxFit.cover
                                  ),
                                  height: 300,
                                  width: 300,
                                  listKeyWordWidget: List.generate(snapshot.data.model.keywords.length, (index) {
                                    return KeyWordWidget(
                                      name: snapshot.data.model.keywords[index],
                                    );
                                  }),
                                  title: '${snapshot.data.model.title}',
                                  content: '${snapshot.data.model.subtitle}',
                                ),
                                onTap: () {
                                  var url = store.getUrl(store.state.list[index]);
                                  var urlList = url.toString().split('-');
                                  var id = urlList[0];
                                  var tmpNamePost = urlList;
                                  tmpNamePost.removeAt(0);
                                  var namePost = tmpNamePost.join('-');
                                  
                                  BlogRouter.router.navigateTo(
                                    context, 
                                    '/post/$id/$namePost', 
                                    transition: TransitionType.fadeIn,
                                    routeSettings: RouteSettings(
                                      arguments: store.state.list[index]
                                    )
                                  );
                                },
                              );
                            }
                          );
                        }),
                      ),
                    ],
                  );
                } else if (store.state is LoadingState) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
