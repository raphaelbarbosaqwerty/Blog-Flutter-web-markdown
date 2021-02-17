import 'package:blog_flutter_fluro_template/app/domain/usecases/get_post_with_name_from_path.dart';
import 'package:blog_flutter_fluro_template/app/presenter/states/states.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'states/post_state.dart';

class PostStore {
  final IGetPostWithNameFromPath getPost;
  
  PostStore(this.getPost);

  get state => _state.value;

  RxNotifier<States> _state = RxNotifier<States>(StartState());
  
  Future<void> getPostInformations({String postName, String pathName}) async {
    var result = await getPost.getPostWithNameFromPath(postName, pathName);
    setState(result.fold((l) => ErrorState(l), (r) => PostSuccessState(r)));
  }

  setState(States value) => _state.value = value;
}