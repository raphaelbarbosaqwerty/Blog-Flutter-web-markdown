import 'package:blog_flutter_fluro_template/app/domain/usecases/get_all_posts.dart';
import 'package:blog_flutter_fluro_template/app/domain/usecases/get_post_by_path.dart';
import 'package:blog_flutter_fluro_template/app/domain/usecases/get_url_post_by_path.dart';
import 'package:blog_flutter_fluro_template/app/presenter/states/states.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'states/home_state.dart';

class HomeStore {
  final IGetAllPosts getAllPosts;
  final IGetPostByPath getPostByPath;
  final IGetUrlPostByPath getUrlPostByPath;

  HomeStore(this.getAllPosts, this.getPostByPath, this.getUrlPostByPath) {
    loadPostsFromFile();
  }

  Future<void> loadPostsFromFile() async {
    setState(LoadingState());
    var response = await getAllPosts.getPosts('assets/markdown_posts');
    setState(response.fold((l) => ErrorState(l), (r) => HomeSuccessState(_orderListReversed(blogPosts: r))));
  }


  Future showPostFromPath(String pathName) async {
    var result = await getPostByPath.getPostByPath(pathName);
    return result.fold((l) => ErrorState(l), (r) => PostByPathSuccessState(r));    
  }

  getUrl(String pathName) {
    var result = getUrlPostByPath.getUrlPostWithPath(pathName);
    return result.fold((l) => ErrorState(l), (r) => r);
  }

  List<dynamic> _orderListReversed({List<dynamic> blogPosts}) {
    blogPosts.sort((a, b) => a.toString()
      .split('/')[3]
      .split('-')[0]
      .compareTo(b.toString().split('/')[3].split('-')[0]));
    return blogPosts.reversed.toList();
  }

  get state => _state.value;

  RxNotifier<States> _state = RxNotifier<States>(StartState());

  setState(States value) => _state.value = value;
}